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
    <title>发布商品</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
    <link rel="stylesheet" href="<%=basePath%>css/user.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
   <!-- bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <!-- 图片上传即使预览插件 -->
    <link rel="stylesheet" href="<%=basePath%>css/fileinput.min.css">
    <script type="text/javascript" src="<%=basePath%>js/fileinput.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/zh.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/first-swx-css.css" />
    <style>
        .container{padding-top:10px}
    </style>
</head>
<body style="overflow-x:hidden">
<div class="pre-2 visible-sm visible-md visible-lg" id="big_img">
    <img src="http://findfun.oss-cn-shanghai.aliyuncs.com/images/head_loading.gif" class="jcrop-preview jcrop_preview_s">
</div>
<div id="cover" style="min-height: 639px;" class="visible-sm visible-md visible-lg">
    <div id="user_area">
        <div id="home_header">
            <a href="<%=basePath%>user/home">
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

	            描述：发布物品
        -->
        <div id="user_content">
            <div class="basic">
                <form:form action="../goods/publishGoodsSubmit" method="post" role="form" enctype="multipart/form-data">
                    <h1 style="margin-left: 210px;">发布物品</h1><hr />
                    <div class="changeinfo">
                        <span>物品名：</span>
                        <input class="in_info" type="text" name="name" placeholder="请输入物品名"/>
                        <span>(*必填)</span>
                    </div>
                    <div class="changeinfo">
                        <span>租金：￥/天</span>
                        <input class="in_info" type="text" name="price" placeholder="请输入租用价格"/>
                        <span>(*必填)</span>
                    </div>
                    <div class="changeinfo">
                        <span>押金：</span>
                        <input class="in_info" type="text" name="realPrice" placeholder="请输入抵押价格"/>
                        <!--<span id="checkphone">(*必填)</span>--><span>(*必填)</span>
                    </div>
                    <div class="changeinfo">
                        <span>物品类别：</span>
                        <select class="in_info" name="catelogId">
                            <option value="1">A区宿舍</option>
                            <option value="2">B区宿舍</option>
                            <option value="3">C区宿舍</option>
                            <option value="4">青年公寓</option>
                        </select>
                    </div>
                    <div class="changeinfo" id="dir">
                        <span>商品描述：</span>
                        <div class="sha">
                            <div class="publ">
                                <div class="pub_con">
                                    <div class="text_pu">
                                        <input style="margin-left: -10px" type="text" name="describle" class="emoji-wysiwyg-editor"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <hr />
                    <div class="changeinfo">
                        <span>商品图片：</span>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-6 col-sm-offset-1">
                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <input type="file" name="myfile" data-ref="imgUrl" class="col-sm-10 myfile" value=""/>
                                            <input type="hidden" name="imgUrl" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="setting-save" value="点击发布" style="margin-top: 20px;margin-left: 300px;background-color: coral;"/>
                </form:form>
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
<%--我的收藏内容--%>
<div class="swx-xs-12 visible-xs">
    <div class="row">
        <div style="margin-top: 70px">
            <div class="share" style="margin-left: -50px;">
                <form:form action="../goods/publishGoodsSubmit" method="post" role="form" enctype="multipart/form-data">
                    <h1 style="margin-left: 230px">发布物品</h1><hr />
                    <div class="changeinfo">
                        <span>物品名：</span>
                        <input  class="in_info" type="text" name="name" placeholder="请输入物品名"/>
                        <span>(*必填)</span>
                    </div>
                    <div class="changeinfo">
                        <span>租金：￥/天</span>
                        <input class="in_info" type="text" name="price" placeholder="请输入租用价格"/>
                        <span>(*必填)</span>
                    </div>
                    <div class="changeinfo">
                        <span>押金：</span>
                        <input class="in_info" type="text" name="realPrice" placeholder="请输入抵押价格"/>
                        <!--<span id="checkphone">(*必填)</span>--><span>(*必填)</span>
                    </div>
                    <div class="changeinfo">
                        <span>物品类别：</span>
                        <select class="in_info" name="catelogId">
                            <option value="1">A区宿舍</option>
                            <option value="2">B区宿舍</option>
                            <option value="3">C区宿舍</option>
                            <option value="4">青年公寓</option>
                        </select>
                    </div>
                    <div class="changeinfo" id="dir">
                        <span>商品描述：</span>
                        <div class="sha" style="margin-left: 60px">
                            <div class="publ">
                                <div class="pub_con">
                                    <div class="text_pu">
                                        <input style="margin-left: -10px" type="text" name="describle" class="emoji-wysiwyg-editor"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <hr />
                    <div class="changeinfo" style="width: 500px;height:340px;margin-left: 50px">
                        <span style="margin-left: 20px;margin-top: -10px">商品图片：</span>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-6 col-sm-offset-1">
                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <input type="file" name="myfile" data-ref="imgUrl" class="col-sm-10 myfile" value=""/>
                                            <input type="hidden" name="imgUrl" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input  type="submit" class="setting-save" value="点击发布" style="margin-top: 40px;margin-left:240px;background-color: coral;"/>
                </form:form>
            </div>
        </div>
    </div>
</div>
<script>
    $(".myfile").fileinput({
        uploadUrl:"<%=basePath%>goods/uploadFile",//上传的地址
        uploadAsync:true, //默认异步上传
        showUpload: false, //是否显示上传按钮,跟随文本框的那个
        showRemove : false, //显示移除按钮,跟随文本框的那个
        showCaption: true,//是否显示标题,就是那个文本框
        showPreview : true, //是否显示预览,不写默认为true
        dropZoneEnabled: true,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
        //minImageWidth: 50, //图片的最小宽度
        //minImageHeight: 50,//图片的最小高度
        //maxImageWidth: 1000,//图片的最大宽度
        //maxImageHeight: 1000,//图片的最大高度
        //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
        //minFileCount: 0,
        maxFileCount: 3, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
        validateInitialCount:true,
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        allowedFileTypes: ['image'],//配置允许文件上传的类型
        allowedPreviewTypes : [ 'image' ],//配置所有的被预览文件类型
        allowedPreviewMimeTypes : [ 'jpg', 'png', 'gif' ],//控制被预览的所有mime类型
        language : 'zh'
    })
    //异步上传返回结果处理
    $('.myfile').on('fileerror', function(event, data, msg) {
        console.log("fileerror");
        console.log(data);
    });
    //异步上传返回结果处理
    $(".myfile").on("fileuploaded", function (event, data, previewId, index) {
        console.log("fileuploaded");
        var ref=$(this).attr("data-ref");
        $("input[name='"+ref+"']").val(data.response.imgUrl);
    });

    //同步上传错误处理
    $('.myfile').on('filebatchuploaderror', function(event, data, msg) {
        console.log("filebatchuploaderror");
        console.log(data);
    });

    //同步上传返回结果处理
    $(".myfile").on("filebatchuploadsuccess", function (event, data, previewId, index) {
        console.log("filebatchuploadsuccess");
        console.log(data);
    });

    //上传前
    $('.myfile').on('filepreupload', function(event, data, previewId, index) {
        console.log("filepreupload");
    });
</script>
</body>
</html>