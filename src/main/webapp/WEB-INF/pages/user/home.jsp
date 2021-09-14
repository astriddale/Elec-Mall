<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/emoji.css" />
    <link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
    <link rel="stylesheet" href="<%=basePath%>css/user.css" />
    <!-- bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap-paginator.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/first-swx-css.css" />
   <script type="text/javascript">

   function viewPersonal(id){
	   $.ajax({
			url:'<%=basePath%>admin/getUser',
			type:'GET',
			data:{id:id},
			dataType:'json',
			success:function(json){
				if(json){
					$('#myviewform').find("input[name='phone']").val(json.phone);
					$('#myviewform').find("input[name='username']").val(json.username);
					$('#myviewform').find("input[name='qq']").val(json.qq);
					$('#myviewform').find("input[name='power']").val(json.power);
					$('#myviewform').find("input[name='createAt']").val(json.createAt);
					$('#viewModal').modal('toggle');
				}
			},
			error:function(){
				alert('请求超时或系统出错!');
				$('#viewModal').modal('hide');
			}
   });
  }
   
   function sendContext(){
	 var context= $("#mycontext").text();
	 $.ajax({
		 url:'<%=basePath%>user/insertSelective',
		 type:'POST',
		 data:{context:context},
		 dataType:'json',
		 success:function(json){
			 alert(json.msg);
			 location.reload();
		 },
		error:function(){
			 alert('请求超时或系统出错!');
			}
	 });
	   
   }
   
   $(function(){
       var options={
           bootstrapMajorVersion:1,    //版本
           currentPage:1,    //当前页数
           numberOfPages:5,    //最多显示Page页
           totalPages:10,    //所有数据可以显示的页数
           onPageClicked:function(e,originalEvent,type,page){
               console.log("e");
               console.log(e);
               console.log("originalEvent");
               console.log(originalEvent);
               console.log("type");
               console.log(type);
               console.log("page");
               console.log(page);
           }
       }
       $("#page").bootstrapPaginator(options);
   })
   </script>
</head>
<body style="overflow-x:hidden">
<div class="pre-2 visible-lg visible-sm visible-md" id="big_img">
    <img src="http://findfun.oss-cn-shanghai.aliyuncs.com/images/head_loading.gif" class="jcrop-preview jcrop_preview_s">
</div>
<div id="cover" style="min-height: 639px;" class="visible-sm visible-md visible-lg">
    <div id="user_area">
        <div id="home_header">
            <a href="<%=basePath%>goods/homeGoods">
                 <img src="<%=basePath%>img/home_header.png">
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
            <div class="home_nav" style="margin-top: 50px;">
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
        <div id="user_content">
            <div class="share">
                <div class="publish">
                	<form role="form" id="contextForm">
                     <div class="pub_content">
                        <div class="text_pub lead emoji-picker-container">
                            <input type="text" name="context" data-emojiable="converted"  class="form-control" data-type="original-input" style="display: none;"/>
                            <div class="emoji-wysiwyg-editor form-control" data-type="input" id="mycontext" contenteditable="true"></div>
                            <i class="emoji-picker-icon emoji-picker face" data-type="picker" style="top: 153px;"></i>
                            <div class="tag"></div>
                        </div>
                        <div class="img_pub">
                            <ul></ul>
                        </div>
                    </div>
                 	  </form>
                    <div class="button">
                        <span class="fa fa-image">
                            ::before
                            <input type="file" accept="image/gif,image/jpeg,image/jpg,image/png" multiple/>
                        </span>
                        <div class="checkbox" style="background-color: orange">
                            <button onclick="sendContext()">发 布</button>
                        </div>
                    </div>

                </div>
                <!--

                    描述：闲置商品展示
                -->
                <div class="share_content">
                 <c:if test="${notice==null}">
                    <div class="no_share">
                    <span>没有任何内容，去看看其它的吧！</span>
                    </div>
                   </c:if>
                   <c:if test="${notice!=null}">
                    <div class="yes_share">
                    <h1 style="text-align: center;">求购信息</h1><hr>
                     <c:forEach items="${notice}" var="item" varStatus="status">
                   	 <button type="button" class="btn btn-info" onclick="viewPersonal(${item.user.id})" style="background-color: #c6f5f4;border:0px;outline:none;">${item.user.username}</button>
                     <span >说：&nbsp;&nbsp;&nbsp;&nbsp;${item.context}</span><br>
                     <p style="text-align:right;color:#4fbef6;">发布时间：${item.createAt}</p>
                     <hr><br>
                     </c:forEach>
                      <div id="page"></div>
                    <!--  <h1> 1 2 3 4 5 下一页 上一页</h1> -->
                    </div>
                    </c:if>
                </div>
            </div>
<%--<!-- 模态框（Modal） -->--%>
<%--<div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
<%--                <h4 class="modal-title middle" id="myModalLabel">查看用户信息</h4>--%>
<%--            </div>--%>
<%--            <div class="modal-body" style="height: 220px;">--%>
<%--	         <form id="myviewform">--%>
<%--	          <div class="form-group">--%>
<%--	            &lt;%&ndash;@declare id="recipient-name"&ndash;%&gt;<label for="recipient-name" class="control-label col-sm-2" >名称:</label>--%>
<%--	            <div class="col-sm-10">--%>
<%--	            <input type="text" class="form-control" id="message-text" name="username" readonly/>--%>
<%--	          </div>--%>
<%--	          </div>--%>
<%--	          <div class="form-group">--%>
<%--	            <label for="message-text" class="control-label col-sm-2">手机号:</label>--%>
<%--	            <div class="col-sm-10">--%>
<%--	            <input type="text" class="form-control" id="message-text" name="phone" readonly/>--%>
<%--	          </div>--%>
<%--	          </div>--%>
<%--	           <div class="form-group">--%>
<%--	            <label for="message-text" class="control-label col-sm-2">qq号:</label>--%>
<%--	            <div class="col-sm-10">--%>
<%--	            <input type="text" class="form-control" id="message-text" name="qq" readonly/>--%>
<%--	          </div>--%>
<%--	          </div>--%>
<%--	          <div class="form-group">--%>
<%--	            <label for="message-text" class="control-label col-sm-2">信用积分:</label>--%>
<%--	            <div class="col-sm-10">--%>
<%--	            <input type="text" class="form-control" id="message-text" name="power" readonly/>--%>
<%--	          </div>--%>
<%--	           </div>--%>
<%--	          <div class="form-group">--%>
<%--	            <label for="message-text" class="control-label col-sm-2">开户时间:</label>--%>
<%--	             <div class="col-sm-10">--%>
<%--	            <input type="text" class="form-control" id="message-text" name="createAt" readonly/>--%>
<%--	          </div>--%>
<%--	           </div>--%>
<%--	        </form>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
<%--            </div>--%>
<%--        </div><!-- /.modal-content -->--%>
<%--    </div><!-- /.modal -->--%>
        </div>
    </div>
</div>
<%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
<nav class="navbar navbar-default visible-xs" style="z-index: 9999;position: fixed;width: 490px">
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
<%--中间内容区--%>
<div ng-controller="detailBoxController" class="detail-box stark-components z-depth-1 ng-scope  row visible-xs">
    <div class="row visible-xs">
        <div class="col-xs-6" style="margin-left: -470px">
            <div id="user_content">
                <div class="share">
                    <div class="publish">
                        <form role="form" id="contextForm">
                            <div class="pub_content">
                                <div class="text_pub lead emoji-picker-container" style="width: 400px">
                                    <input type="text" name="context" data-emojiable="converted"  class="form-control" data-type="original-input" style="display: none;"/>
                                    <div class="emoji-wysiwyg-editor form-control" data-type="input" id="mycontext" contenteditable="true"></div>
                                    <div class="tag"></div>
                                </div>
                            </div>
                        </form>
                        <div class="button">
                            <div class="checkbox" style="margin-top: -15px;right: -20px">
                                <button onclick="sendContext()">发 布</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row visible-xs" style="margin-left: 125px">
                    <div class="col-xs-7">
                        <div class="thumbnail">
                            <div class="share_content">
                                <c:if test="${notice==null}">
                                    <div class="no_share">
                                        <span>没有任何内容，去看看其它的吧！</span>
                                    </div>
                                </c:if>
                                <c:if test="${notice!=null}">
                                    <div class="yes_share">
                                        <h1 style="text-align: center;">求购信息</h1><hr>
                                        <c:forEach items="${notice}" var="item" varStatus="status">
                                            <button type="button" class="btn btn-info" onclick="viewPersonal(${item.user.id})" style="background-color: #c6f5f4;border:0px;outline:none;">${item.user.username}</button>
                                            <span >说：&nbsp;&nbsp;&nbsp;&nbsp;${item.context}</span><br>
                                            <p style="text-align:right;color:#4fbef6;">发布时间：${item.createAt}</p>
                                            <hr><br>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>