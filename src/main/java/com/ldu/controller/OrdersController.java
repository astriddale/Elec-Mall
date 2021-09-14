package com.ldu.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ldu.pojo.Goods;
import com.ldu.pojo.Orders;
import com.ldu.pojo.Purse;
import com.ldu.pojo.User;
import com.ldu.service.GoodsService;
import com.ldu.service.OrdersService;
import com.ldu.service.PurseService;

@Controller
@RequestMapping(value="/orders")
public class OrdersController {
	@Resource
	private OrdersService ordersService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private PurseService  purseService;
    ModelAndView mv = new ModelAndView();
    
    private void set(ModelAndView mv , Integer user_id) {
    	List<Orders> ordersList1 = ordersService.getOrdersByUserId(user_id);
    	List<Orders> ordersList2 = ordersService.getOrdersByUserAndGoods(user_id);
        
    	   // 计算总交易量
        //1.自己的物品交易成功 买的
        int sum1 = 0;
        for (Orders o: ordersList1) {
        	if (o.getOrderState() == 3) {
        		sum1++;
        	}
        }
        
      //2.自己的物品交易成功 卖的
        int sum2 = 0;
        for (Orders o: ordersList2) {
        	if (o.getOrderState() == 3) {
        		sum2++;
        	}
        }
        
        int count = 0;
        int total = 0;
        for (Orders o: ordersList2) {
        	if (o.getOrderState() == 3) {
        		total++;
        		if (o.getScore() >= 4) {
        			count++;
        		}
        	}
        }
        System.out.println("count:" + count);
        System.out.println("total:" + total);
        int sum = sum1 + sum2;
        mv.addObject("sum",sum);
        mv.addObject("score",String.format("%d%%", (int)(count * 1.0 / total*100)));
     
    }
	 /**
     * 我的订单 租用的
     */
    @RequestMapping(value = "/myOrders")
    public ModelAndView orders(HttpServletRequest request) {
        User cur_user = (User)request.getSession().getAttribute("cur_user");
        Integer user_id = cur_user.getId();
        List<Orders> ordersList1=new ArrayList<Orders>();
        List<Orders> ordersList2=new ArrayList<Orders>();
        ordersList1 = ordersService.getOrdersByUserId(user_id);
        ordersList2 = ordersService.getOrdersByUserAndGoods(user_id);
        
     
        set(mv, user_id);
        Purse myPurse=purseService.getPurseByUserId(user_id);
        mv.addObject("ordersOfSell",ordersList2);
        mv.addObject("orders",ordersList1);
        mv.addObject("myPurse",myPurse);
        mv.setViewName("/user/orders");
        return mv;
    }
    
	 /**
     * 提交订单
     */
    @RequestMapping(value = "/addOrders")
    public String addorders(HttpServletRequest request,Orders orders) {
    	Date d=new Date();//获取时间
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//转换格式
        User cur_user = (User)request.getSession().getAttribute("cur_user");
        Integer user_id = cur_user.getId();
        orders.setUserId(user_id);
        orders.setOrderDate(sdf.format(d));
        Goods goods=new Goods();
        goods.setStatus(0);
        goods.setId(orders.getGoodsId());
        goodsService.updateGoodsByGoodsId(goods);
        ordersService.addOrders(orders);
        Float balance=orders.getOrderPrice();
        purseService.updatePurseOfdel(user_id,balance);
        return "redirect:/orders/myOrders";
    }
    
    /**
     * 发货 根据订单号
     */
    @RequestMapping(value = "/deliver/{orderNum}")
    public String deliver(HttpServletRequest request,@PathVariable("orderNum")Integer orderNum) {
    	ordersService.deliverByOrderNum(orderNum);
        return "redirect:/orders/myOrders";
    }

    /**
     * 收货
     */
    @RequestMapping(value = "/receipt")
    public String receipt(HttpServletRequest request) {
    Integer orderNum=Integer.parseInt(request.getParameter("orderNum"));
    	Float balance=Float.parseFloat(request.getParameter("orderPrice"));
    	Integer goodsId=Integer.parseInt(request.getParameter("goodsId"));
    	Integer userId=goodsService.getGoodsById(goodsId).getUserId();
    	Integer score=Integer.parseInt(request.getParameter("score"));
    	ordersService.receiptByOrderNum(orderNum, score);
    	purseService.updatePurseByuserId(userId,balance);
    	/*买家确认收货后，卖家钱包+*/
        return "redirect:/orders/myOrders";
    }
}
