<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
</head>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/matrix-style.css" />
<link rel="stylesheet" href="<%=basePath%>css/matrix-media.css" />
<link rel="stylesheet" href="<%=basePath%>font-awesome/css/font-awesome.css" />

<body  style="background-color: white;">
	<!--Header-part-->
	<div id="headers" >
	   	<div style="height:50px;background-color: rgba(52,172,209,.5);">
	   		<h1 style="text-align:center;margin-top: 10px;margin-bottom: 0px;color: honeydew">校园电动车共享系统后台</h1>
	   	</div>
	</div>
	<!-- 实现左边动画 -->
	<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
	<script src="<%=basePath%>js/matrix.js"></script>
</body>
</html>
