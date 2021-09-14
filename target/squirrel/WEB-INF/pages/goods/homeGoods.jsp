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
    <title>校园电动车电动车共享系统</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>css/index.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery.js" ></script>
    <script type="text/javascript" src="<%=basePath%>js/materialize.min.js" ></script>
    <script type="text/javascript" src="<%=basePath%>js/index.bundle.js" ></script>
    <link rel="stylesheet" href="<%=basePath%>css/materialize-icon.css" />
    <link rel="stylesheet" href="<%=basePath%>css/user.css" />
    <link rel="stylesheet" href="<%=basePath%>css/first-swx-css.css" />
    <style>
        .footer{min-width: 1500px;border:none;border-top:2px solid #d9d9d9;margin-top: 50px;background-color: white;}  .footer a,p{color: #999;font: 15px helvetica;text-decoration: none;margin-left: 10px;}  .footer > .bt2{margin-top: 30px;}  .footer .m3{float: right;margin-right: 300px;margin-top: -5px;}  .footer .bottom1{margin-top: 5px;margin-left: 300px;}  .footer .m4{margin: 5px 0 0 750px;}  .footer a:hover{background-color: #d9d9d9;}
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

        $(document).ready(function(){
            //异步验证
            $("#phone").blur(function(){
              var phone=$(this).val();
              $.ajax({
    				url:'<%=basePath%>user/register',
    				type:'POST',
    				data:{phone:phone},
    				dataType:'json',
    				success:function(json){
    					if(json.flag){
    						 $("#errorPhone").html("账号已被注册，请重新输入!");
    						 $("#register").attr("disabled",true);
    					}else{
    						 $("#errorPhone").empty();
    						 $("#register").attr("disabled",false);
    					}
    				},
    				error:function(){
    					alert('请求超时或系统出错!');
    				}
    			});

            });
        });
    </script>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<body ng-view="ng-view">
<!--
    描述：顶部导航栏
-->
<div ng-controller="headerController" class="header stark-components navbar-fixed ng-scope navbar-header visible-lg visible-md visible-sm">
    <nav class="white nav1">
        <div class="nav-wrapper" style="min-width: 1350px">
            <a href="<%=basePath%>admin" class="logo">
                <em class="em1" style="font: 50px '华文彩云'; margin-left: -60px; color:orange">校园</em>
                <em class="em2">电动车共享系统</em>
            </a>
            <div class="nav-wrapper search-bar" style="position: absolute">
                <form class="ng-pristine ng-invalid ng-invalid-required" action="<%=basePath%>goods/search" style="margin-left: -210px;position: absolute" >
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
   登录模块
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

<!--更改用户名模块-->
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
<!--
    区域分类
-->
<div ng-controller="sidebarController" class="sidebar stark-components ng-scope visible-lg visible-md visible-sm" style="position: absolute;left: 582px;z-index: 0;margin-top: -36px;height: 400px" >
    <li ng-class="{true: 'active'}[isAll]" style="height: 75px;line-height: 75px">
        <a href="<%=basePath%>goods/catelog" class="index">
            <img src="<%=basePath%>img/index.png">
            <em style="font-size: 20px;position: absolute;top: 5px;left: 70px">最新发布</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isDigital]" style="height: 74px;line-height: 74px">
        <a href="<%=basePath%>goods/catelog/1" class="digital">
            <img src="<%=basePath%>img/digital.png"  />
            <em style="font-size: 20px;position: absolute;top: 5px;left: 70px">A区宿舍</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isRide]" style="height: 74px;line-height: 74px">
        <a href="<%=basePath%>goods/catelog/2" class="ride">
            <img src="<%=basePath%>img/ride.png"/>
            <em style="font-size: 20px;position: absolute;top: 5px;left: 70px">B区宿舍</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isCommodity]" style="height: 74px;line-height: 74px">
        <a href="<%=basePath%>goods/catelog/3" class="commodity">
            <img src="<%=basePath%>img/commodity.png"/>
            <em style="font-size: 20px;position: absolute;top: 5px;left: 70px">C区宿舍</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isBook]" style="height: 75px;line-height: 75px">
        <a href="<%=basePath%>goods/catelog/4" class="book">
            <img src="<%=basePath%>img/book.png"/>
            <em style="font-size: 20px;position: absolute;top: 5px;left: 70px">青年公寓</em>
        </a>
    </li>
</div>

<!--
    右侧显示部分
-->
<div class="main-content visible-lg visible-md visible-sm" style="min-width: 1245px">
    <!--

        描述：右侧banner（图片）部分
    -->
    <div class="slider-wapper" style="margin-right: 400px;width: 740px">
        <div class="slider" style="height: 440px; touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
            <ul class="slides" style="height: 400px;">
                <li class="active" style="opacity: 1;">
                        <div class="bannerimg" >
                        </div>
                </li>
            </ul>
        </div>
    </div>
    <!--

        描述：最新发布
    -->
    <div class="index-title visible-lg visible-md visible-sm">
        <a href="">最新发布</a>
        <hr class="hr1">
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row visible-lg visible-md visible-sm">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image">
                            <img src="<%=basePath%>upload/${item.images[0].imgUrl}" />
                        </div>
                        <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                        <div class="card-content item-name">
                            <p><c:out value="${item.goods.name}"></c:out></p>
                        </div>
                        <div class="card-content item-location">
                            <p>大学便利</p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <!--

        描述：A区宿舍
    -->
    <div class="index-title visible-lg visible-md visible-sm">
        <a href="">A区宿舍</a>
        <hr class="hr1">
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row visible-lg visible-md visible-sm">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods1}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image">
                            <img src="<%=basePath%>upload/${item.images[0].imgUrl}" />
                        </div>
                        <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                        <div class="card-content item-name">
                            <p><c:out value="${item.goods.name}"></c:out></p>
                        </div>
                        <div class="card-content item-location">
                            <p>大学便利</p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
    <!--

        描述：B区宿舍
    -->
    <div class="index-title visible-lg visible-md visible-sm">
        <a href="">B区宿舍</a>
        <hr class="hr1">
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row visible-lg visible-md visible-sm">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods2}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image">
                            <img src="<%=basePath%>upload/${item.images[0].imgUrl}" />
                        </div>
                        <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                        <div class="card-content item-name">
                            <p><c:out value="${item.goods.name}"></c:out></p>
                        </div>
                        <div class="card-content item-location">
                            <p>大学便利</p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="index-title visible-lg visible-md visible-sm">
        <a href="">C区宿舍</a>
        <hr class="hr1">
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row visible-lg visible-md visible-sm">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods3}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image">
                            <img src="<%=basePath%>upload/${item.images[0].imgUrl}" />
                        </div>
                        <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                        <div class="card-content item-name">
                            <p><c:out value="${item.goods.name}"></c:out></p>
                        </div>
                        <div class="card-content item-location">
                            <p>大学便利</p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="index-title visible-lg visible-md visible-sm">
        <a href="">青年公寓</a>
        <hr class="hr1">
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row visible-lg visible-md visible-sm">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods4}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image">
                            <img src="<%=basePath%>upload/${item.images[0].imgUrl}" />
                        </div>
                        <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                        <div class="card-content item-name">
                            <p><c:out value="${item.goods.name}"></c:out></p>
                        </div>
                        <div class="card-content item-location">
                            <p>大学便利</p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
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
<%--顶部显示区域--%>
<nav class="navbar navbar-default visible-xs" style="z-index: 9999;position: fixed;">
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
<%--轮播图--%>
<div id="carousel-example-generic" class="carousel slide visible-xs" data-ride="carousel">
    <!-- 指示器 -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- 轮播图片及说明文字 -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="<%=basePath%>img/findfun2.png" alt="First slide">

            <div class="carousel-caption">
            </div>
        </div>
        <div class="item">
            <img src="<%=basePath%>img/findfun2.png" alt="Second slide">
        </div>
        <div class="item">
            <img src="<%=basePath%>img/findfun2.png" alt="Second slide">
        </div>
    </div>


    <!-- 控制按钮：左右切换 -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<div class="first-swx visible-xs">
    <h1>最新发布</h1>
    <p></p>
</div>
<div class="row visible-xs">
    <div class="col-xs-6">
        <div class="thumbnail">
             <c:forEach var="item" items="${catelogGoods1}">
             <div class="card col third-swx">
                <a class="second-swx" href="<%=basePath%>goods/goodsId/${item.goods.id}">
                    <div class="card-image">
                        <img src="<%=basePath%>upload/${item.images[0].imgUrl}" />
                    </div>
                    <h4>租金：<c:out value="${item.goods.price}"></c:out>￥/天</h4>
                    <p>简介：<c:out value="${item.goods.name}"></c:out></p>
                    <p>上架时间：<c:out value="${item.goods.startTime}"></c:out></p>
                </a>
            </div>
            </c:forEach>
        </div>
    </div>
    <div class="col-xs-6">
        <div class="thumbnail">
            <c:forEach var="item" items="${catelogGoods2}">
                <div class="card col third-swx">
                    <a class="second-swx" href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image">
                            <img src="<%=basePath%>upload/${item.images[0].imgUrl}" />
                        </div>
                        <h4>租金：<c:out value="${item.goods.price}"></c:out>￥/天</h4>
                        <p>简介：<c:out value="${item.goods.name}"></c:out></p>
                        <p>上架时间：<c:out value="${item.goods.startTime}"></c:out></p>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>