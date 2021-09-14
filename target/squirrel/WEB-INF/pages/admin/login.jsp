<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh">

<head>
<title>Admin Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css"/>
<link rel="stylesheet" href="<%=basePath%>css/matrix-login.css"/>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap-responsive.min.css"/>
<link rel="stylesheet" href="<%=basePath%>font-awesome/css/font-awesome.css" />
	<link rel="stylesheet" href="<%=basePath%>/css/style1.css" />
</head>
<body>
	<div id="loginbox">
	<h1 style="text-align:center;">共享系统后台管理</h1>
		<form id="loginform" class="form-vertical" action="<%=basePath%>admin/index" method="post" role="form">
			<div class="control-group normal_text">
			</div>
			<div class="inputBox">
				<div class="controls">
					<div class="main_input_box">
						<span><i class="icon-user" style="color: white"></i> </span> <input
							type="text"  name="phone" id="phone"
							class="required" value="" placeholder="username" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span><i class="icon-lock" style="color: white"></i> </span> <input
							type="password" placeholder="password" name="password"
							id="password" />
					</div>
				</div>
			</div>
			<div class="form-actions">
				<input type="submit" class="btn btn-success" value="Login" style="width: 150px;color: white;border: 0;border-radius: 20px;background-image: linear-gradient(to right, #b8cbb8 0%, #b8cbb8 0%, #b465da 0%, #cf6cc9 33%, #ee609c 66%, #ee609c 100%);	/* 按钮颜色 */">
			</div>
		</form>

	</div>
	<script src="<%=basePath%>js/jquery.min.js"/>
	<script src="<%=basePath%>js/matrix.login.js" type="text/javascript" charset="utf-8" />
	<script src="<%=basePath%>js/jquery.validate.js"/>
	<script src="<%=basePath%>js/jquery.md5.js"/>
	<script type="text/javascript">
    $("#loginform").validate({
        rules: {
        	phone: "required",
            password: {
                required: true,
                minlength: 6
            },
        },
        messages: {
        	phone:  "请输入用户名",
            password: {
                required: "请输入密码",
                minlength: jQuery.format("密码不能小于{0}个字符")
            }
        }
    });
    
    function encrypt(){
    	/// var pwd = $.md5($("#password").val());
    	$("#password").val(pwd);
    	return true;
    };
</script>
</body>

</html>
