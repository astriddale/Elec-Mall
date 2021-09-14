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
    <meta charset="utf-8" />
    <title>校园电动车共享系统</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>css/index.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery.js" ></script>
    <script type="text/javascript" src="<%=basePath%>js/materialize.min.js" ></script>
    <script type="text/javascript" src="<%=basePath%>js/index.bundle.js" ></script>
    <link rel="stylesheet" href="<%=basePath%>css/materialize-icon.css" />
    <link rel="stylesheet" href="<%=basePath%>css/detail.css" />
    <link rel="stylesheet" href="<%=basePath%>css/first-swx-css.css" />
    <style>
        .footer{border:none;border-top:2px solid #d9d9d9;margin-top: 50px;background-color: white;}  .footer a,p{color: #999;font: 15px helvetica;text-decoration: none;margin-left: 10px;}  .footer > .bt2{margin-top: 30px;}  .footer .m3{float: right;margin-right: 300px;margin-top: -5px;}  .footer .bottom1{margin-top: 5px;margin-left: 300px;}  .footer .m4{margin: 5px 0 0 750px;}  .footer a:hover{background-color: #d9d9d9;}
    </style>
    <script>
       function showLogin() {
            if($("#signup-show").css("display")=='block'){
                $("#signup-show").css("display","none");
            }
            if($("#login-show").css("display")=='none'){
                $("#login-show").css("display","block");
            }else{
                $("#login-show").css("display","none");
            }
        }
        function showSignup() {
            if($("#login-show").css("display")=='block'){
                $("#login-show").css("display","none");
            }
            if($("#signup-show").css("display")=='none'){
                $("#signup-show").css("display","block");
            }else{
                $("#signup-show").css("display","none");
            }
        }
        function ChangeName() {
            if($("#changeName").css("display")=='none'){
                $("#changeName").css("display","block");
            }else{
                $("#changeName").css("display","none");
            }
        }
    </script>
    
    <script type="text/javascript">
    
    function  addFocus(id) {
    	location.href = '<%=basePath%>user/addFocus/'+id
    	alert("已收藏成功，查看收藏列表~")
    	
    }
    
	/* 前往支付 */
    function  toPay(id) {
    	window.location.href = '<%=basePath%>goods/buyId/'+id
    }
	
    </script>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

<body ng-view="ng-view">
<!--

    描述：顶部
-->
<div ng-controller="headerController" class="header stark-components navbar-fixed ng-scope visible-lg visible-md visible-sm">
    <nav class="white nav1">
        <div class="nav-wrapper" style="min-width: 1350px">
            <a href="<%=basePath%>admin" class="logo">
                <em class="em1" style="font: 50px '华文彩云'; margin-left: -60px; color:orange">校园</em>
                <em class="em2">电动车共享系统</em>
            </a>
            <div class="nav-wrapper search-bar" style="position: absolute">
                <form class="ng-pristine ng-invalid ng-invalid-required" action="<%=basePath%>goods/search" style="margin-left: -210px;position: absolute">
                    <div class="input-field">
                        <input id="search" name="str" placeholder="A区宿舍自用九新..." style="top: 16px;height: 35px;width: 300px;position: absolute"
                               class="ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required col-md-4"/>
                        <button type="submit" class="btn btn-warning" value="搜索" style="top: 16px;left: 300px;height: 35px; position: absolute">搜索</button>
                        <label for="search" class="active">
                            <i ng-click="search()"></i>
                        </label>
                    </div>
                </form>
            </div>
            <ul class="right">
                <%-- 登录之前显示的页面 --%>
                <c:if test="${empty cur_user}">
                    <li>
                        <a href="<%=basePath%>goods/homeGoods">
                            首页</a>
                    </li>

                    <li>
                        <a onclick="showLogin()" data-toggle="tooltip"
                           title="您需要先登录哦！">
                            我要求购</a>
                    </li>
                    <li>
                        <a onclick="showLogin()" data-toggle="tooltip"
                           title="您需要先登录哦！">
                            我要发布</a>
                    </li>
                </c:if>

                <c:if test="${empty cur_user}">
                    <li>
                        <a onclick="showLogin()">登录</a>
                    </li>
                    <li>
                        <a onclick="showSignup()">注册</a>
                    </li>
                </c:if>
                <%-- 登录之后显示的页面 --%>
                <c:if test="${!empty cur_user}">
                    <li>
                        <a href="<%=basePath%>goods/homeGoods">
                            首页</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>user/home">我要求购</a>

                    </li>
                    <li>
                        <a href="<%=basePath%>goods/publishGoods">我要发布</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>user/allGoods">我发布的商品</a>
                    </li>
                    <li>
                        <a>${cur_user.username}</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人设置<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=basePath%>user/home">个人中心</a></li>
                            <li><a href="<%=basePath%>user/allFocus">我的收藏</a></li>
                            <li><a onclick="ChangeName()">更改用户名</a></li>
                            <li><a href="<%=basePath%>user/logout">退出登录</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>
</div>

<!--
    描述：登录
-->
<div ng-controller="loginController" class="ng-scope">
    <div id="login-show" class="login stark-components" style="background-size: cover">
        <div class="publish-box z-depth-3 col-lg-4">
            <div class="row" >
                <a onclick="showLogin()">
                    <div class="col s12 title"></div>
                </a>
                <form action="<%=basePath%>user/login" method="post" role="form">
                    <div class="input-field col s12">
                        <input type="text" name="phone" id="login_phone" required="required" pattern="^1[0-9]{10}$" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>手机&nbsp;&nbsp;<div id="login_errorPhone" style="color:red;display:inline;"></div></label>
                    </div>
                    <div class="input-field col s12">
                        <input type="password" id="login_password"  name="password" required="required" class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" />
                        <label>密码&nbsp;&nbsp;<div id="errorPassword" style="color:red;display:inline;"></div></label>
                        <!--   <a ng-click="showForget()" class="forget-btn">忘记密码？</a> -->
                    </div>
                    <button type="submit" id="loginIn" class="waves-effect waves-light btn login-btn blue lighten-1">
                        <i class="iconfont left"></i>
                        <em>登录</em>
                    </button>
                    <div class="col s12 signup-area">
                        <em>没有账号？赶快</em>
                        <a onclick="showSignup()" class="signup-btn">注册</a>
                        <em>吧！</em>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--
   注册模块
-->
<div ng-controller="signupController" class="ng-scope">
    <div id="signup-show" class="signup stark-components">
        <div class="publish-box z-depth-4 col-lg-4">
            <div class="row">
                <a onclick="showSignup()">
                    <div class="col s12 title"></div>
                </a>
                <form action="<%=basePath%>user/addUser" method="POST" role="form" id="signup_form"  enctype="multipart/form-data">
                    <div class="input-field col s12">
                        <input type="text" name="username" required="required" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>昵称</label>
                    </div>
                    <div class="input-field col s12">
                        <input type="text" name="phone" id="phone" required="required" pattern="^1[3-9][0-9]{9}$" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>手机&nbsp;&nbsp;<div id="errorPhone" style="color:red;display:inline;"></div></label>
                    </div>
                    <div class="input-field col s12">
                        <input type="password" name="password" required="required" class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" />
                        <label>密码</label>
                    </div>
                    <div class="input-field col s12">
                        <input type="button" value="上传学生证" onclick="javascript:$('input[name=\'pic2\']').click();" class=" text" style="border: none;background: transparent;font-size: 12px;color: rgb(158,158,158)"/>
                        <input type="file" name="pic" id="pic" required="required"  class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label><div id="errorPic" style="color:red;display:inline;"></div></label>
                    </div>
                    <div class="input-field col s12">
                        <input type="button" value="上传个人照片" onclick="javascript:$('input[name=\'pic2\']').click();" class=" text" style="border: none;background: transparent;font-size: 12px;color: rgb(158,158,158)"/>
                        <input type="file" name="pic2" id="pic2" required="required" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched"/>
                        <label></label>
                    </div>
                    <div ng-show="checkTelIsShow" class="col s12 register2-position">
                        <button type="submit" id="register" class="waves-effect waves-light btn verify-btn blue lighten-1">
                            <i class="iconfont left"></i>
                            <em>点击注册</em>
                        </button>
                    </div>
                    <div ng-show="checkTelIsShow" class="login-area col s12">
                        <em>已有账号？去</em>
                        <a onclick="showLogin()">登录</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--更改用户名-->
<div ng-controller="changeNameController" class="ng-scope">
    <div id="changeName" class="change-name stark-components">
        <div class="publish-box z-depth-4 col-lg-4">
            <div class="row">
                <div class="col s12 title">
                    <h1>修改用户名</h1>
                </div>
                <form action="<%=basePath%>user/changeName" method="post"  role="form">
                    <div class="input-field col s12">
                        <input type="text" name="username" required="required" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>修改用户名</label>

                    </div>
                    <div ng-show="checkTelIsShow" class="col s12 register-position">
                        <button class="waves-effect waves-light btn publish-btn blue lighten-1">
                            <i class="iconfont left"></i>
                            <em>确认</em>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--显示商品详情-->
<div ng-controller="detailBoxController" class="detail-box stark-components z-depth-1 row ng-scope visible-lg visible-md visible-sm">
    <div class="col s12 path">
        <a href="<%=basePath%>goods/catelog/${catelog.id}">${catelog.name}</a>
        <em>></em>
        <a>${goodsExtend.goods.name}</a>
    </div>
    <div class="col s6">
        <div class="slider" style="height: 440px;">
            <ul class="slides" style="height: 400px;">
                <img src="<%=basePath%>upload/${goodsExtend.images[0].imgUrl}" />
            </ul>
        </div>
    </div>
    <div class="col s6">
        <h1 class="item-name">${goodsExtend.goods.name}</h1>
        <h2 class="item-price">${goodsExtend.goods.price} ￥/天</h2>
        <h2 class="publisher-info-title">押金：<span style="text-decoration:line-through;">${goodsExtend.goods.realPrice}</span></h2>
        <div class="item-public-info">
            <p class="bargain">可讲价</p>
            <p>
                <i class="iconfont"></i>
                <c:if test="${empty catelog.name}"><a class="second-swx" href="">最新发布</a></c:if>
                <c:if test="${!empty catelog.name}"><a class="second-swx" href="">${catelog.name}</a></c:if>
            </p>
        </div>
        <div class="publisher-info-title">
            <em>卖家信息</em><hr>
        </div>
        <c:if test="${empty cur_user}">
            <div class="item-contact">
                <p class="not-login">
                    <a onclick="showLogin()">登录</a>
                    <em>或</em>
                    <a onclick="showSignup()">注册</a>
                    <em>后查看联系信息</em>
                </p>
            </div>
        </c:if>
        <c:if test="${!empty cur_user}">
            <div class="item-contact">
                <div>
                    <div class="base-blue z-depth-1 attr">
                        <i class="iconfont"></i>
                    </div>
                    <div class="value">${seller.username}</div>
                </div>
                <div>
                    <div class="base-blue z-depth-1 attr">
                        <i class="iconfont"></i>
                    </div>
                    <div class="value">${seller.phone}</div>
                </div>
                <div>
                    <div class="base-blue z-depth-1 attr">
                        <i class="iconfont"></i>
                    </div>
                    <c:if test="${seller.qq!=null}">
                    <div class="value">${seller.qq}</div>
                    </c:if>
                    <c:if test="${seller.qq==null}">
                    <div class="value">该同学没留下QQ</div>
                    </c:if>
                    
                </div>
                <div>
                    <div class="base-blue z-depth-1 attr">
                        <p style="font-size: 25px;color:white;">总</p>
                    </div>
                    <div class="value">交易成功数量:${sum }</div>
                </div>
                <div>
                    <div class="base-blue z-depth-1 attr">
                        <p style="font-size: 25px;color:white;">好</p>
                    </div>
                    <div class="value">好评率:${score }</div>
                </div>
                <div>
               <input type="button" value="加入收藏" class="blue lighten-1 waves-effect waves-light btn" id="btn_cart" onclick="addFocus(${goodsExtend.goods.id})"></input>
               <c:if test="${cur_user.id==goodsExtend.goods.userId}">
               <input type="button" value="在线支付" data-toggle="tooltip"  title="不可以购买自己的东西哦~" disabled="disabled" class="blue lighten-1 waves-effect waves-light btn" id="btn_buy"></input>
                </c:if>
                <c:if test="${cur_user.id!=goodsExtend.goods.userId}">
               <input type="button" value="在线支付"  class="blue lighten-1 waves-effect waves-light btn" id="btn_buy" onclick="toPay(${goodsExtend.goods.id})"></input>
                </c:if>
                </div>
                
            </div>
        </c:if>
        <h1 class="item-pub-time">发布于 ${goodsExtend.goods.startTime}</h1>
    </div>
</div>
<div class="detail-box stark-components z-depth-1 row visible-lg visible-md visible-sm">
    <h1 class="title">商品描述</h1>
    <hr class="hr1" />
    <hr class="hr2" />
    <p class="section">描述：${goodsExtend.goods.describle}</p>
    <p class="section"></p>
</div>
<div class="row detail-area visible-lg visible-md visible-sm">
    <div class="clo s12">
        <div ng-controller="commentController" class="comment stark-components z-depth-1 ng-scope">
            <h1 class="title">评论</h1>
            <hr class="hr1" />
            <hr class="hr2" />
            <c:forEach var="item" items="${CommentExtend.comments}"  >
            <div class="comment-collection">
                <div class="comment-item ng-scope">
                    <div class="comment-main-content">
               <em class="name ng-binding">${item.user.username}:</em>
                        <em class="ng-hide">回复</em>
                        <em class="name ng-binding ng-hide">@:</em>
                        <em class="ng-binding">${item.content}</em>
                    </div>
                    <div class="comment-function">
                        <em class="time ng-biinding">${item.createAt}</em>
                    </div>
                </div>
            </div>
             </c:forEach>
          <form id="addCommentForm" class="form-horizontal" >
            <div class="comment-add row">
                <div class="input-field col s12" style="margin-left: -180px;line-height: 50px">
                    <i class="iconfont prefix"></i>
                    <input id="goodsId" name="goods.id" value="${goodsExtend.goods.id}" type="hidden"/>
                    <input id="commentbox" type="text" name="content" class="validate ng-pristine ng-untouched ng-valid ng-empty"/>
                    <label for="commentbox" ></label>
                    <c:if test="${!empty cur_user}">
                    <button type="button" class="waves-effect wave-light btn comment-submit" style="float: right;margin: 10px -100px" onclick="addComments()">确认</button>
                    </c:if>
                     <c:if test="${empty cur_user}">
                    <button href="javacript:void(0);" data-toggle="tooltip"  title="您需要先登录哦！" disabled="disabled" class="waves-effect wave-light btn comment-submit" style="float: right;margin: 10px -100px">确认</button>
                    </c:if>
                   
                </div>
            </div>
            </form>
        </div>
    </div>
</div>
<!--底部标签栏-->
<div class="footer visible-lg visible-md visible-sm">
    <div class="bt2">
        <p class="m3">Site Powered，Design and eveloped By SunWuxin</p>
        <p class="bottom1"><a href="<%=basePath%>user/login">登录</a> 丨<a href="<%=basePath%>user/addUser">注册</a></p>
        <p class="bottom1"><a href="<%=basePath%>goods/homeGoods">首页</a> 丨<a href="<%=basePath%>user/home">求购页面</a> 丨<a href="<%=basePath%>goods/publishGoods">发布页面</a></p>
        <p class="bottom1"><a href="#">关于我们</a><a href="#">联系我们</a><a href="#">隐私政策</a></p>
        <p class="m4">© 2021 校园电动车共享系统 版权所有</p>
    </div>
</div>
<%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
<%--顶部导航条--%>
<nav class="navbar navbar-default visible-xs" style="z-index: 9999;position: fixed;margin-top: -61px">
    <div class="container-fluid" style="background-color: white">
        <!-- Brand and toggle get grouped for better mobile display -->
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
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">分类<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li ng-class="{true: 'active'}[isAll]">
                            <a href="<%=basePath%>goods/catelog" class="index">
                                <img style="height: 50px;" src="<%=basePath%>img/index.png">
                                <em>最新发布</em>
                            </a>
                        </li>
                        <li ng-class="{true: 'active'}[isDigital]">
                            <a href="<%=basePath%>goods/catelog/1" class="digital">
                                <img style="height: 50px;" src="<%=basePath%>img/digital.png" />
                                <em>A区宿舍</em>
                            </a>
                        </li>
                        <li ng-class="{true: 'active'}[isRide]">
                            <a href="<%=basePath%>goods/catelog/2" class="ride">
                                <img style="height: 50px;" src="<%=basePath%>img/ride.png" />
                                <em>B区宿舍</em>
                            </a>
                        </li>
                        <li ng-class="{true: 'active'}[isCommodity]">
                            <a href="<%=basePath%>goods/catelog/3" class="commodity">
                                <img style="height: 50px;" src="<%=basePath%>img/commodity.png" />
                                <em>C区宿舍</em>
                            </a>
                        </li>
                        <li ng-class="{true: 'active'}[isBook]">
                            <a href="<%=basePath%>goods/catelog/4" class="book">
                                <img style="height: 50px;" src="<%=basePath%>img/book.png" />
                                <em>青年公寓</em>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left" action="<%=basePath%>goods/search">
                <div class="form-group">
                    <input name="str" type="text" class="form-control" placeholder="A区宿舍自用九新...">
                </div>
                <button type="submit" class="btn btn-default" value="搜索">搜索</button>
                <label for="search" class="active">
                    <i ng-click="search()"></i>
                </label>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <%-- 登录之前显示的页面 --%>
                <c:if test="${empty cur_user}">
                    <li>
                        <a href="<%=basePath%>goods/homeGoods">
                            首页</a>
                    </li>

                    <li>
                        <a onclick="showLogin()" data-toggle="tooltip" title="您需要先登录哦！">
                            我要求购</a>
                    </li>
                    <li>
                        <a onclick="showLogin()" data-toggle="tooltip" title="您需要先登录哦！">
                            我要发布</a>
                    </li>
                </c:if>

                <c:if test="${empty cur_user}">
                    <li>
                        <a onclick="showLogin()">登录</a>
                    </li>
                    <li>
                        <a onclick="showSignup()">注册</a>
                    </li>
                </c:if>
                <%-- 登录之后显示的页面 --%>
                <c:if test="${!empty cur_user}">
                    <li>
                        <a href="<%=basePath%>goods/homeGoods">
                            首页</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>user/home">我要求购</a>

                    </li>
                    <li>
                        <a href="<%=basePath%>goods/publishGoods">我要发布</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>user/allGoods">我发布的商品</a>
                    </li>
                    <li>
                        <a>${cur_user.username}</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">个人设置<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=basePath%>user/home">个人中心</a></li>
                            <li><a href="<%=basePath%>user/allFocus">我的收藏</a></li>
                            <li><a onclick="ChangeName()">更改用户名</a></li>
                            <li><a href="<%=basePath%>user/logout">退出登录</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
<%--中间内容区--%>
<div ng-controller="detailBoxController" class="detail-box stark-components z-depth-1 ng-scope  row visible-xs" style="margin-top: 58px">
    <div class="col-xs-12">
        <a class="swx-detail-font" href="<%=basePath%>goods/catelog/${catelog.id}">${catelog.name}</a>
        <em style="margin-left: 8px">></em>
        <a class="swx-detail-font">${goodsExtend.goods.name}</a>
    </div>
    <div class="row visible-xs">
        <div class="col-xs-6"style="margin-left: 10px">
            <div class="card col">
                <div class="card-image">
                    <img src="<%=basePath%>upload/${goodsExtend.images[0].imgUrl}" />
                </div>
                <div class="col s6">
                    <h1 class="item-name">${goodsExtend.goods.name}</h1>
                    <h2 class="item-price">${goodsExtend.goods.price} ￥/天</h2>
                    <h2 class="publisher-info-title">押金：<span style="text-decoration:line-through;">${goodsExtend.goods.realPrice}</span></h2>
                    <div class="item-public-info">
                        <p class="bargain">可讲价</p>
                        <p>
                            <i class="iconfont"></i>
                            <c:if test="${empty catelog.name}"><a class="second-swx" href="">最新发布</a></c:if>
                            <c:if test="${!empty catelog.name}"><a class="second-swx" href="">${catelog.name}</a></c:if>
                        </p>
                    </div>
                    <div class="publisher-info-title">
                        <em>卖家信息</em><hr>
                    </div>
                    <c:if test="${empty cur_user}">
                        <div class="item-contact">
                            <p class="not-login">
                                <a onclick="showLogin()">登录</a>
                                <em>或</em>
                                <a onclick="showSignup()">注册</a>
                                <em>后查看联系信息</em>
                            </p>
                        </div>
                    </c:if>
                    <c:if test="${!empty cur_user}">
                        <div class="item-contact">
                            <div>
                                <div class="base-blue z-depth-1 attr">
                                    <i class="iconfont"></i>
                                </div>
                                <div class="value">${seller.username}</div>
                            </div>
                            <div>
                                <div class="base-blue z-depth-1 attr">
                                    <i class="iconfont"></i>
                                </div>
                                <div class="value">${seller.phone}</div>
                            </div>
                            <div>
                                <div class="base-blue z-depth-1 attr">
                                    <i class="iconfont"></i>
                                </div>
                                <c:if test="${seller.qq!=null}">
                                    <div class="value">${seller.qq}</div>
                                </c:if>
                                <c:if test="${seller.qq==null}">
                                    <div class="value">同学没留下QQ</div>
                                </c:if>
                            </div>
                        </div>
                        <div>
                            <input type="button" value="加入收藏" class="blue lighten-1 waves-effect waves-light btn" id="btn_cart" onclick="addFocus(${goodsExtend.goods.id})"></input>
                            <c:if test="${cur_user.id==goodsExtend.goods.userId}">
                                <input type="button" value="在线支付" data-toggle="tooltip"  title="不可以购买自己的东西哦~" disabled="disabled" class="blue lighten-1 waves-effect waves-light btn" id="btn_buy"></input>
                            </c:if>
                            <c:if test="${cur_user.id!=goodsExtend.goods.userId}">
                                <input type="button" value="在线支付"  class="blue lighten-1 waves-effect waves-light btn" id="btn_buy" onclick="toPay(${goodsExtend.goods.id})"></input>
                            </c:if>
                        </div>
                    </c:if>
                    <h1 class="item-pub-time">发布于 ${goodsExtend.goods.startTime}</h1>
                </div>
            </div>
            <div class="row visible-xs ">
                <div class="col-xs-12">
                    <div class="thumbnail">
                        <%--描述--%>
                        <h3 class="title">商品描述</h3>
                        <hr class="hr1" />
                        <p class="section">描述：${goodsExtend.goods.describle}</p>
                        <p class="section"></p>
                        <%--评论--%>
                        <h3 class="title">评论</h3>
                        <hr class="hr1" />
                        <c:forEach var="item" items="${CommentExtend.comments}"  >
                            <div class="comment-collection" id="swx-message">
                                <div class="comment-item ng-scope">
                                    <div class="comment-main-content">
                                        <em class="name ng-binding" style="color: #0bb9f8">${item.user.username}:</em>
                                        <em class="ng-hide">回复</em>
                                        <em class="name ng-binding ng-hide">@:</em>
                                        <em class="ng-binding">${item.content}</em>
                                    </div>
                                    <div class="comment-function">
                                        <em class="time ng-biinding" style="color: #AAAAAA">${item.createAt}</em>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <form id="addCommentForm" class="form-horizontal" >
                            <div class="comment-add row">
                                <div class="input-field col s12" style="margin-left: 10px;line-height: 50px;width: 75%;">
                                    <i class="iconfont prefix"></i>
                                    <input id="goodsId" name="goods.id" value="${goodsExtend.goods.id}" type="hidden"/>
                                    <input id="commentbox" type="text" name="content" class="validate ng-pristine ng-untouched ng-valid ng-empty"/>
                                    <label for="commentbox" ></label>
                                    <c:if test="${!empty cur_user}">
                                        <button type="button" class="waves-effect wave-light btn comment-submit" style="float: right;margin: 10px -80px" onclick="addComments()">确认</button>
                                    </c:if>
                                    <c:if test="${empty cur_user}">
                                        <button href="javacript:void(0);" data-toggle="tooltip"  title="您需要先登录哦！" disabled="disabled" class="waves-effect wave-light btn comment-submit" style="float: right;margin: 10px -80px">确认</button>
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
/* 评论 */
function addComments(){
	$.ajax({
		url:'<%=basePath%>goods/addComments',
		type:'POST',
		data:$('#addCommentForm').serialize(),// 序列化表单值  
		dataType:'json',
		success:function(json){
			// alert("您已评论成功~");
		},
		error:function(){
			// alert('请求超时或系统出错!');
		}
	});
	alert("您已评论成功~")
	window.location.reload();
}
</script>
</html>