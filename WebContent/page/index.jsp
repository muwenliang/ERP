<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=path%>/css/common.css">
    <title>人员管理首页</title>
</head>
<body>
	
    <div class="container-fluid clear-mp" id="Odiv">
        <div class="row clear-mp">
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 my-aside clear-mp" id="Adiv">
                <div class="aside-logo">
                    <h2 class="clear-mp">ERP系统</h2>
                </div>
                <ul id="aside-menu">
                    <li>
                        <i class="fa fa-university" aria-hidden="true"></i>人员及权限<i class="fa fa-sort-desc item-down"
                            aria-hidden="true"></i>
                    </li>
                    <!-- 二级菜单 -->
                    <ul class="second-menu">
	                    <c:if test="${user.status==1}">
	                        <li class="li-active"><i class="fa fa-circle" aria-hidden="true"></i>人员管理</li>
	                        <li><i class="fa fa-table" aria-hidden="true"></i>考勤管理</li>
	                    </c:if>
	                    <c:if test="${user.status==0}">
	                      <li><i class="fa fa-table" aria-hidden="true"></i>考勤管理</li>
	                    </c:if>
                    </ul>
                    <li><i class="fa fa-area-chart" aria-hidden="true"></i>item</li>
                    <li><i class="fa fa-area-chart" aria-hidden="true"></i>item</li>
                </ul>
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 my-content clear-mp" id="Cdiv">
                <nav class="navbar navbar-default my-navbar">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a class="navbar-brand my-navbar-brand" href="#">
                                <!-- <img alt="Brand" src="..."> -->
                                <i class="fa fa-home fa-2x"></i>
                            </a>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-right my-signed">
                                <li>
                                    <a href="#"><i class="fa fa-user fa-fw"></i>${user.account_name}</a>
                                </li>
                                <li><a href="#">个人中心</a></li>
                                <li><a href="<%=path%>/ErpLogin/exit">退出</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="embed-responsive embed-responsive-16by9 my-main">
                    <iframe class="embed-responsive-item" id="common-iframe" src="<%=path%>/search/ryList"></iframe>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="<%=path%>/js/jquery.min.js"></script>
<script src="<%=path%>/js/bootstrap.js"></script>
<script src="<%=path%>/js/common.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		var menuArray = $("#aside-menu>li")
	    var secondMenuArray = $(".second-menu")
	    var secondMenuItems = $(".second-menu>li")
	    var commonIframe = $("#common-iframe")
	
	    for (var i = 0; i < secondMenuItems.length; i++) {
	        $(secondMenuItems[i]).on("click", function () {
	            console.log(2)
	            clearClass()
	            $(this).addClass("li-active")
	        })
	    }
	
	    function clearClass() {
	        $("#aside-menu .li-active").removeClass("li-active")
	    }
	
	    $(menuArray[0]).on("click", function () {
	        $(secondMenuArray[0]).slideToggle();
	    })
	
	    $(secondMenuItems[0]).on("click", function () {
	        commonIframe.attr({
	            src: "<%=path%>/search/ryList"
	        })
	    })
	    $(secondMenuItems[1]).on("click", function () {
	        commonIframe.attr({
	            src: "<%=path%>/kqgl/kqInfo"
	        })
	    })
	});
</script>
</html>