<%@page import="com.jiubo.erp.kqgl.vo.KqInfoResult"%>
<%@page import="java.util.List"%>
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
    <link rel="stylesheet" href="<%=path %>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path %>/css/attendance.css">
    <title>考勤管理</title>
</head>
<body>
    <div class="container-fluid">
        <div class="row my-panel-nav clear-mp">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h2>考勤查询</h2>
                <!-- 考勤查询 -->
                <div class="dropdown my-dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="true">
                        考勤查询
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li><a href="#">公司出勤明细</a></li>
                        <li><a href="#">部门出勤统计</a></li>
                        <li><a href="#">个人出勤明细</a></li>
                        <li><a href="#">个人出勤统计</a></li>
                    </ul>
                </div>
                <!-- 排班管理 -->
                <div class="dropdown my-dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="true">
                        排班管理
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li><a href="#">公司出勤明细</a></li>
                        <li><a href="#">部门出勤统计</a></li>
                        <li><a href="#">个人出勤明细</a></li>
                        <li><a href="#">个人出勤统计</a></li>
                    </ul>
                </div>
                <!-- 参数设置 -->
                <div class="dropdown my-dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="true">
                        参数设置
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li><a href="#">公司出勤明细</a></li>
                        <li><a href="#">部门出勤统计</a></li>
                        <li><a href="#">个人出勤明细</a></li>
                        <li><a href="#">个人出勤统计</a></li>
                    </ul>
                </div>
                <!-- 请假倒休 -->
                <div class="dropdown my-dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="true">
                        请假倒休
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li><a href="#">公司出勤明细</a></li>
                        <li><a href="#">部门出勤统计</a></li>
                        <li><a href="#">个人出勤明细</a></li>
                        <li><a href="#">个人出勤统计</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- end -->
        <div class="row my-table">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class=".table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">姓名</th>
                                <th class="text-center">工号</th>
                                <th class="text-center">部门</th>
                                <th class="text-center">职位</th>
                                <th class="text-center">班次</th>
                                <th class="text-center">出勤班次日期</th>
                                <th class="text-center">第一次打卡时间</th>
                                <th class="text-center">最后一次打卡时间</th>
                                <th class="text-center">上班</th>
                                <th class="text-center">下班</th>
                                <th class="text-center">状态</th>
                            </tr>
                        </thead>
                        <tbody>
                         <%
		                   List<KqInfoResult> result=(List<KqInfoResult>)request.getAttribute("list");
		                   for(KqInfoResult data:result){
                          %>
                            <tr>
                                <td><%=data.getName() %></td>
                                <td><%=data.getJobNum() %></td>
                                <td><%=data.getDepartname() %></td>
                                <td><%=data.getPositionName() %></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <%
		                       }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="<%=path %>/js/jquery.min.js"></script>
<script src="<%=path %>/js/bootstrap.js"></script>
</html>