<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>订单中心</title>
<link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon" />
<link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
<link rel="stylesheet" href="<%=basePath%>css/user.css" />
<link rel="stylesheet" href="<%=basePath%>css/first-swx-css.css" />
<!-- bootstrap -->
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

<script type="text/javascript">

		function ordersDeliver(orderNum){
	
		location.href ='<%=basePath%>orders/deliver/'+orderNum
	
		alert("订单完成，请联系对方确认交易地点，并等待对方确认~")
	}
		
		function ordersReceipt(orderNum,orderPrice,goodsId){
			
			//alert($('#pf' + orderNum).val())
			//location.href ='<%=basePath%>orders/receipt?orderNum='+orderNum+'&orderPrice='+orderPrice+'&goodsId='+goodsId;
			$("#score").css("display", "block");
			//alert("交易成功，感谢您的信任~")
			//submitOrder(orderNum, orderPrice, goodsId);
			$("#score button").on( "click", function() {
				//alert(orderNum);
				location.href ='<%=basePath%>orders/receipt?orderNum='+orderNum+'&orderPrice='+orderPrice+'&goodsId='+goodsId + '&score=' + $('#scoreSelect').val() ;
				//alert("交易成功，感谢您的信任~")
			});
		}
	

</script>
<style type="text/css">
	#score {
		position: absolute;
		width: 150px;
		height: 50px;
		top: 50%;
		left: 50%;
		background-color: lightblue;
		z-index: 100000;	
		display: none;
	}
</style>

</head>
<body>
<div id="score">
	评分：<select id="scoreSelect">
			<option value ="1">1</option>
			<option value ="2">2</option>
			<option value ="3">3</option>
			<option value ="4">4</option>
			<option value ="5">5</option>
		</select> 
	<button>提交</button>
</div>
	<div class="pre-2" id="big_img">
    <img src="http://findfun.oss-cn-shanghai.aliyuncs.com/images/head_loading.gif" class="jcrop-preview jcrop_preview_s">
</div>
<div id="cover" style="min-height: 639px;" class="visible-sm visible-md visible-lg">
    <div id="user_area">
        <div id="home_header">
            <a href="<%=basePath%>goods/homeGoods">
                 <img src="<%=basePath%>img/home_header.png" >
            </a>
            <a href="<%=basePath%>user/home">
                <div class="home"></div>
            </a>
        </div>
        <!--

            描述：左侧个人中心栏
        -->
        <div id="user_nav">
            <div class="user_info">
               <div class="head_img">
                   <img src="<%=basePath%>img/photo.jpg">
               </div>
               <div class="big_headimg">
                   <img src="">
               </div>
               <span class="name">${cur_user.username}</span><hr>
               <a class="btn" style="width: 98%;background-color: rgb(79, 190, 246);color:rgba(255, 255, 255, 1);" href="<%=basePath%>user/myPurse">我的钱包：￥${myPurse.balance}</a>
               <input type="hidden" value="${myPurse.recharge}" id="recharge"/>
               <input type="hidden" value="${myPurse.withdrawals}" id="withdrawals"/>
               <span class="btn" data-toggle="modal" data-target="#myModal" style="width: 98%;background-color: rgb(79, 190, 246); color:rgba(255, 255, 255, 1);margin-top:0.5cm;">交易成功数量：${sum}</span>
               <span class="btn" data-toggle="modal" data-target="#myModal" style="width: 98%;background-color: rgb(79, 190, 246); color:rgba(255, 255, 255, 1);margin-top:0.5cm;">好评率：${score}</span>
            </div>
            <div class="home_nav" style="margin-top:50px;">
                <ul>
                    <a href="<%=basePath%>orders/myOrders">
                        <li class="notice">
                            <div></div>
                            <span>订单中心</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/allFocus">
                        <li class="fri">
                            <div></div>
                            <span>收藏列表</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>goods/publishGoods">
                        <li class="store">
                            <div></div>
                            <span>发布物品</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/allGoods">
                        <li class="second">
                            <div></div>
                            <span>我的闲置</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/basic">
                        <li class="set">
                            <div></div>
                            <span>个人设置</span>
                            <strong></strong>
                        </li>
                    </a>
                </ul>
            </div>
        </div>
			<!--

            描述：右侧内容区域
        -->
			<div id="user_content" style="height: 910px">

				<div class="share">

					<!--

                    描述：订单展示
                -->
					<h1 style="text-align: center">订单中心</h1>
					<hr />
					<div class="share_content">
						  <c:if test="${empty orders and empty ordersOfSell}">
                        <div class="no_share">
                            <span>没有任何内容，去看看其它的吧！</span>
                        </div>
                    </c:if>
					 <c:if test="${!empty orders or !empty ordersOfSell}">
						<div class="story">

							<div class="container">
								<!-- Nav tabs -->
								<ul class="nav nav-tabs" role="tablist" style="width: 46%">
									<!-- <li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#home">全部订单</a></li> -->
									<li class="nav-item"><a class="nav-link active" data-toggle="tab"
										href="#orders_my" >我租用的</a></li>
									<li class="nav-item" ><a class="nav-link" data-toggle="tab"
										href="#orders_other" >我租出的</a></li>
								</ul>

								<!-- Tab panes -->
								<div class="tab-content" style="width: 46%">
									<!-- <div id="home" class="container tab-pane active"
										style="width: 100%">
										<br>
										<from>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua.</p>
										</from>
									</div> -->
									<!-- 买家订单中心 -->
									<div id="orders_my" class="container tab-pane active"
										style="width: 100%">
										<br>
										<form class="form-horizontal" role="form">
											<div class="table-responsive">
												<table class="table">
													<thead>
													<tr>
													</tr>
														<tr>
														  <th >订单编号</th>
															<th>名称</th>
															<th>价格</th>
															<th>备注</th>
															<th style="width:50px">操作</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach var="items" items="${orders}">
                                            	<tr>
															<td>${items.orderNum}</td>
															<td>${items.goods.name}</td>
															<td>${items.goods.price}</td>
															<td>${items.orderInformation}</td>
															<td>
															<c:if test="${items.orderState==1}"><input type="button" value="待发货" class="btn btn-info"/></c:if>
															<c:if test="${items.orderState==2}"><input type="button" value="收&nbsp&nbsp&nbsp&nbsp货" onclick="ordersReceipt(${items.orderNum},${items.orderPrice},${items.goods.id})" class="btn btn-info"/></c:if>
															<c:if test="${items.orderState==3}"><input type="button" value="已完成" class="btn btn-info"/></c:if>
															</td>
														</tr>
                    					</c:forEach> 	
													</tbody>
												</table>
											</div>

										</form>
									</div>
									<!-- 卖家订单中心 -->
									<div id="orders_other" class="container tab-pane fade"
										style="width: 100%">
										<br>
										<form class="form-horizontal" role="form">
											<div class="table-responsive">
												<table class="table">
													<thead>
													<tr>
													</tr>
														<tr class="text-center">
														  <th>订单编号</th>
															<th>名称</th>
															<th>价格</th>
															<th>备注</th>
															<th>操作</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach var="items" items="${ordersOfSell}">
                                            		<tr>
															<td>${items.orderNum}</td>
															<td>
															${items.goods.name}
															</td>
															<td>${items.goods.price}</td>
															<td>${items.orderInformation}</td>
															<td>
															<c:if test="${items.orderState==1}"><input type="button" value="发&nbsp&nbsp&nbsp&nbsp货" onclick="ordersDeliver(${items.orderNum})" class="btn btn-info"/></c:if>
															<c:if test="${items.orderState==2}"><input type="button" value="待收货"  class="btn btn-info"/></c:if>
															<c:if test="${items.orderState==3}"><input type="button" value="已完成" class="btn btn-info"/></c:if>
															</td>
													</tr>
                    					</c:forEach>
												 </tbody>
												</table>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						     </c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
<%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
<nav class="navbar navbar-default visible-xs" style="z-index: 9999;position: fixed;min-width: 500px">
		<div class="container-fluid" style="background-color: white">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="second-swx" href="<%=basePath%>goods/homeGoods">
					<em class="em1" style="font: 20px '微软雅黑';color:black;line-height: 50px;font-weight: bold"><span style="color: orange;font:35px '华文彩云';">校园</span>电动车共享系统</em></a>
				</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<div style="height: 100px;float: left">
					<div class="head_img">
						<img style="width: 80px;height: 80px;float: left;margin: 10px 0"  class="swx-bc-1" src="<%=basePath%>img/photo.jpg">
					</div>

				</div>
				<div style="margin-top: 20px">
					<span class="name" style="margin-top: 10px;margin-left: -160px;">${cur_user.username}</span>
					<a  class="second-swx-home"  href="<%=basePath%>user/myPurse">我的钱包：￥${myPurse.balance}</a></hr>
					<span  class="second-swx-home" data-toggle="modal" data-target="#myModal" >交易成功数量：${sum}</span>
					<span  class="second-swx-home" data-toggle="modal" data-target="#myModal" >好评率：${score}</span>
				</div>
				<ul class="nav navbar-nav navbar-right" style="margin-left: 10px;margin-right: 10px">
					<li>
						<a class="swx-hover2" href="<%=basePath%>user/home">
							<div class="swx-bc-image0"></div>
							<span>求购信息</span>
						</a>
					</li>
					<li >
						<a class="swx-hover2" href="<%=basePath%>orders/myOrders">
							<div class="swx-bc-image1"></div>
							<span>订单中心</span>
						</a>
					</li>
					<li>
						<a class="swx-hover2" href="<%=basePath%>user/allFocus">
							<div class="swx-bc-image2"></div>
							<span>收藏列表</span>
						</a>
					</li>
					<li>
						<a class="swx-hover2" href="<%=basePath%>goods/publishGoods">
							<div class="swx-bc-image3"></div>
							<span>发布物品</span>
						</a>
					</li>
					<li>
						<a class="swx-hover2" href="<%=basePath%>user/allGoods">
							<div class="swx-bc-image4"></div>
							<span>我的闲置</span>
						</a>
					</li>
					<li>
						<a class="swx-hover2" href="<%=basePath%>user/basic">
							<div class="swx-bc-image5"></div>
							<span>个人设置</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
<%--订单中心内容--%>
	<div class="swx-xs-2 visible-xs">
		<div class="row">
			<div class="col-xs-12">
				<div class="thumbnail" style="margin-top: 50px;width: 480px;margin-left: -70px">
					<h1 style="text-align: center">订单中心</h1>
					<hr />
					<div class="share_content">
						<c:if test="${empty orders and empty ordersOfSell}">
							<div class="no_share">
								<span>没有任何内容，去看看其它的吧！</span>
							</div>
						</c:if>
						<c:if test="${!empty orders or !empty ordersOfSell}">
							<div class="story">

								<div class="container">
									<!-- Nav tabs -->
									<ul class="nav nav-tabs" role="tablist" style="width: 100%">
									<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#home">全部订单</a></li>
									</ul>

									<!-- Tab panes -->
									<div class="tab-content" style="width: 100%">
										<!-- 买家订单中心 -->
										<div id="orders_my1" class="container tab-pane active"
											 style="width: 480px;margin:0 -25px">
											<br>
											<form class="form-horizontal" role="form">
												<div class="table-responsive">
													<table class="table">
														<thead>
														<tr>
														</tr>
														<tr>
															<th >订单编号</th>
															<th>名称</th>
															<th>价格</th>
															<th>操作</th>
														</tr>
														</thead>
														<tbody>
														<c:forEach var="items" items="${orders}">
															<tr>
																<td>${items.orderNum}</td>
																<td>${items.goods.name}</td>
																<td>${items.goods.price}</td>
																<td>
																	<c:if test="${items.orderState==1}"><input type="button" value="待发货" class="btn btn-info"/></c:if>
<%--																	<c:if test="${items.orderState==2}">评分：<input type="text" id="pf${items.orderNum}" name="pf"/><input type="button" value="收&nbsp&nbsp&nbsp&nbsp货" onclick="ordersReceipt(${items.orderNum},${items.orderPrice},${items.goods.id})" class="btn btn-info"/></c:if>--%>
																	<c:if test="${items.orderState==2}"><input type="button" value="收&nbsp&nbsp&nbsp&nbsp货" onclick="ordersReceipt(${items.orderNum},${items.orderPrice},${items.goods.id})" class="btn btn-info"/></c:if>
																	<c:if test="${items.orderState==3}"><input type="button" value="已完成" class="btn btn-info"/></c:if>
																</td>
															</tr>
														</c:forEach>
														</tbody>
													</table>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>