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
<title>我的钱包</title>
<link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon" />
<link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
<link rel="stylesheet" href="<%=basePath%>css/user.css" />

<!-- bootstrap -->
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/first-swx-css.css" />

	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

</head>
<body style="overflow-x:hidden;">
	<div class="pre-2 visible-sm visible-md visible-lg" id="big_img">
		<img
			src="http://findfun.oss-cn-shanghai.aliyuncs.com/images/head_loading.gif"
			class="jcrop-preview jcrop_preview_s">
	</div>
	<div id="cover" style="min-height: 639px;height: 950px" class="visible-sm visible-md visible-lg">
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
						<img  src="<%=basePath%>img/photo.jpg">
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
								<div></div> <span>订单中心</span> <strong></strong>
						</li>
						</a>
						<a href="<%=basePath%>user/allFocus">
							<li class="fri">
								<div></div> <span>收藏列表</span> <strong></strong>
						</li>
						</a>
						<a href="<%=basePath%>goods/publishGoods">
							<li class="store">
								<div></div> <span>发布物品</span> <strong></strong>
						</li>
						</a>
						<a href="<%=basePath%>user/allGoods">
							<li class="second">
								<div></div> <span>我的闲置</span> <strong></strong>
						</li>
						</a>
						<a href="<%=basePath%>user/basic">
							<li class="set">
								<div></div> <span>个人设置</span> <strong></strong>
						</li>
						</a>
					</ul>
				</div>
			</div>
			<!--

            描述：右侧内容区域
        -->
			<div id="user_content"  >

				<div class="share">

					<!--

                    描述：关注商品展示
                -->
					<h1 style="text-align: center">我的钱包</h1>
					<hr />
					<div class="share_content">
						<div class="story">
							<form id="myUpAndDwon" class="form-horizontal" role="form" action="<%=basePath%>user/updatePurse" >
								<div class="form-group">
									<%--@declare id="firstname"--%><div class="col-sm-12">
                					<img style="height: 320px;width: 548px" src="<%=basePath%>img/mypurse.jpg" />
									</div>
									<label for="firstname" class="col-sm-2 control-label">余额：</label>
									<div class="col-sm-10">
										<input type="text" name="balance" class="form-control" disabled="disabled" style="border:0px;background:rgba(0, 0, 0, 0); " value="${myPurse.balance}" >
									</div>
									<label for="firstname" class="col-sm-2 control-label" >充值：</label>
									<div class="col-sm-10">
										<input name="recharge" type="number" class="form-control recharge" style="border:0px;background:rgba(0, 0, 0, 0); " value="${myPurse.recharge}" data-toggle="tooltip"  title="请输入整数金额！"/>
									</div>
									<label for="firstname" class="col-sm-2 control-label" >提现：</label>
									<div class="col-sm-10">
										<input name="withdrawals" type="number" class="form-control withdrawals" style="border:0px;background:rgba(0, 0, 0, 0); " value="${myPurse.withdrawals}" data-toggle="tooltip"  title="请输入整数金额！"/>
									</div>
								</div>
								<hr />
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-8">
										 <c:if test="${myPurse.state==null}">
										 <a  onclick="upAnddown(1)" class="btn btn-danger">立即充值</a>
										 <a  onclick="upAnddown(2)" class="btn btn-danger">立即提现</a>
										 </c:if>
										 <c:if test="${myPurse.state==0}">
											 <c:if test="${myPurse.recharge!=null}">
											 <a   class="btn btn-danger">【申请提现中】,待管理员审核！</a>
											 </c:if>
											 <c:if test="${myPurse.withdrawals!=null}">
											 <a   class="btn btn-danger">【申请充值中】,待管理员审核！</a>
											 </c:if>
										 </c:if>
										  <c:if test="${myPurse.state==1 or myPurse.state==2}">
										 <a   class="btn btn-danger btn_mypurse">请点击查看审核结果！</a>
										 </c:if>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
<nav class="navbar navbar-default visible-xs" style="z-index: 9999;position: fixed;width: 500px">
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
				<span class="second-swx-home" data-toggle="modal" data-target="#myModal">
				 信用积分：${cur_user.power}
			</span>
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
	<div class="row visible-xs">
		<div class="col-xs-5"  style="margin-left: 15px;margin-top: 50px">
			<div class="thumbnail"  style="width: 470px">
				<div class="share">
					<h1 style="text-align: center">我的钱包</h1>
					<hr />
					<div class="share_content">
						<div class="story">
							<form id="myUpAndDwon" class="form-horizontal" role="form" action="<%=basePath%>user/updatePurse" >
								<div class="form-group">
									<%--@declare id="firstname"--%><div class="col-sm-12">
									<img style="width: 440px;height: 300px" src="<%=basePath%>img/mypurse.jpg" />
								</div>
									<label for="firstname" class="col-sm-2 control-label">余额：</label>
									<div class="col-sm-10">
										<input type="text" name="balance" class="form-control" disabled="disabled" style="border:0px;background:rgba(0, 0, 0, 0); " value="${myPurse.balance}" >
									</div>
									<label for="firstname" class="col-sm-2 control-label" >充值：</label>
									<div class="col-sm-10">
										<input name="recharge" type="number" class="form-control recharge" style="border:0px;background:rgba(0, 0, 0, 0); " value="${myPurse.recharge}" data-toggle="tooltip"  title="请输入整数金额！"/>
									</div>
									<label for="firstname" class="col-sm-2 control-label" >提现：</label>
									<div class="col-sm-10">
										<input name="withdrawals" type="number" class="form-control withdrawals" style="border:0px;background:rgba(0, 0, 0, 0); " value="${myPurse.withdrawals}" data-toggle="tooltip"  title="请输入整数金额！"/>
									</div>
								</div>
								<hr />
								<div class="form-group" style="margin-left: 111px">
									<div class="col-sm-offset-4 col-sm-8">
										<c:if test="${myPurse.state==null}">
											<a  onclick="upAnddown(1)" class="btn btn-danger">立即充值</a>
											<a  onclick="upAnddown(2)" class="btn btn-danger">立即提现</a>
										</c:if>
										<c:if test="${myPurse.state==0}">
											<c:if test="${myPurse.recharge!=null}">
												<a   class="btn btn-danger">【申请提现中】,待管理员审核！</a>
											</c:if>
											<c:if test="${myPurse.withdrawals!=null}">
												<a   class="btn btn-danger">【申请充值中】,待管理员审核！</a>
											</c:if>
										</c:if>
										<c:if test="${myPurse.state==1 or myPurse.state==2}">
											<a   class="btn btn-danger btn_mypurse">请点击查看审核结果！</a>
										</c:if>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(".btn_mypurse").on('click',function(){
		
		if(1${myPurse.state}!=1){
			var state=1${myPurse.state}
			/* 	var recharge=${myPurse.recharge};
				var withdrawals=${myPurse.withdrawals}; */
				if(state==10){
					alert("您的申请,还【未审核】！")
				}
				if(state==11){
					alert("您的申请，已审核【不通过】，请联系管理员！")
				}
				if(state==12){
					alert("您的申请，已审核【通过】~")
				}
				if(state==11||state==12){
					/*ajax 修改数据库state==null */
					var id=${myPurse.id};
					$.ajax({
						url:'<%=basePath%>admin/updatePurseState',
						type:'GET',
						data:{id:id},
						dataType:'json'
						});
						location.reload();
					}
		}
	});
</script>
<script type="text/javascript">

	function upAnddown(num){
		var reg=/^[1-9]\d*$|^0$/;  
		if(num==1){
			var Recharge=$(" input[ name='recharge' ] ").val();
			if(Recharge==null || Recharge==""){
				alert("请输入您要充值的金额！")
			}else if(reg.test(Recharge)!=true){
				alert("您输入的金额格式有误，请重新输入！")
			}else{
				$(".withdrawals").val("");
				//提交表单
		        $("#myUpAndDwon").submit();
				alert("申请充值成功，等待管理员审核~")
			}
			
		}
		if(num==2){
			var withdrawals=$(" input[ name='withdrawals' ] ").val();
			if(withdrawals==null || withdrawals==""){
				alert("请输入您要提现的金额！")
			}else if(reg.test(withdrawals)!=true){
				alert("您输入的金额格式有误，请重新输入！")
			}else if(withdrawals>${myPurse.balance}){
				alert("您输入的金额太大，请重新输入！")
			}else{
			$(".Recharge").val("");
			//提交表单
	        $("#myUpAndDwon").submit();
	        alert("申请提现成功，等待管理员审核~")
			}
		}
	
	}
</script>
</html>