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
    <!DOCTYPE html>
<html lang="en">
    <head>
        <base target="_self">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache,must-ridate">
        <meta http-equiv="expires" content="0">
        <title>
           ERP操作系统
        </title>
		<link rel="stylesheet" href="css/tree.css" />
        <link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/font-awesome.min.css">
		<link rel="stylesheet" href="css/attendance.css">
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/treescroll.min.js"></script>
		<script type="text/javascript" src="js/jquery.min.js"></script> 
		<script type="text/javascript" src="js/kalendar.js"></script>
		<script type="text/javascript" src="js/echarts.js"></script>
		<link type="text/css" rel="stylesheet" href="css/kalendar.css" />

    </head>

    <body>
        <!-- tab标签 -->
		
        <ul id="myTab" class="nav nav-tabs">
		<h2 class="col-lg-2" id="tresult">考勤管理</h2>
			<li class="col-lg-1 pull-right">
			<div class="dropdown my-dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="true">
                        请假倒休
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li class="ac"><a href="#qjgl" data-toggle="tab">请假管理</a></li>
                        <li class="ac"><a href="#" data-toggle="tab">调休管理</a></li>
                        <li class="ac"><a href="#" data-toggle="tab">漏打卡管理</a></li>
                    </ul>
                </div>
			</li>
			 <li class="col-lg-1 pull-right">
               <div class="dropdown my-dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="true">
                        参数设置
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li class="ac"><a href="#jqzlgl" data-toggle="tab">假期种类管理</a></li>
                        <li class="ac"><a href="#cqgzgl" data-toggle="tab">出勤规则管理</a></li>
                        <li class="ac"><a href="#pbgzgl" data-toggle="tab">排班规则管理</a></li>
                        <li class="ac"><a href="#bzgl" data-toggle="tab">班组管理</a></li>
						<li class="ac"><a href="#bmgl" data-toggle="tab">部门管理</a></li>
						<li class="ac"><a href="#zwgl" data-toggle="tab">职务管理</a></li>	
						<li class="ac"><a href="#gwlxgl" data-toggle="tab">岗位类型管理</a></li>						
                    </ul>
                </div>
            </li>
			<li class="col-lg-1 pull-right">
                <div class="dropdown my-dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="true">
                        排班管理
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li class="ac"><a href="#rypbjh" data-toggle="tab">人员排班计划</a></li>
                        <li class="ac"><a href="#pbjhsc" data-toggle="tab">排班计划删除</a></li>
                        <li class="ac"><a href="#pbjhdr" data-toggle="tab">排班计划导入</a></li>
                    </ul>
                </div>
            </li>
			<li class="col-lg-1 pull-right">
               <div class="dropdown my-dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="true">
                        考勤查询
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li class="ac"><a href="#gscqmx" data-toggle="tab">公司出勤明细</a></li>
                        <li class="ac"><a href="#bmcqmx" data-toggle="tab">部门出勤统计</a></li>
                        <li class="ac"><a href="#grcqmx" data-toggle="tab">个人出勤明细</a></li>
                        <li class="ac"><a href="#gscqtj" data-toggle="tab">个人出勤统计</a></li>
						<li class="ac"><a href="#kqbb" data-toggle="tab">考勤报表</a></li>
						<li class="ac"><a href="#kqtjbb" data-toggle="tab">考勤统计报表</a></li>
                    </ul>
                </div>
            </li>
        </ul>
		
        <!-- 每个tab页对应的内容 -->
        <div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="gscqmx">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="table-responsive">
					<div class="col-lg-9 mtr_a">
						<span>部门：</span>
						<span class="com-sel"><select class="">
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select></span>
						<span>职位：</span>
						<span class="com-sel"><select class="">
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select></span>
						<span>姓名：</span>
						<span><input type="text" value="" class="form-control" /></span>
						<span>工号：</span>
						<span><input type="text" value="" class="form-control" /></span>
						<span class="search pull-right"><button class="btn btn-primary">导出</button></span>
						<span class="search pull-right"><button class="btn btn-warning">查询</button></span>
					</div>
					
					<div class="col-lg-11 mtr_a">
					<span>时间：</span>
						<span><input type="date" value="" id="time_start" /></span>
						<span>&nbsp;&nbsp;&nbsp;至：</span>
						<span><input type="date" value="" id="time_over" /></span>
					</div>
					
					<div class="col-lg-11 mtr_a">
					<span>注：</span>
					<span style="color:#FF0000; margin-right:10px;">旷工</span>
					<span style="color:#CD853F; margin-right:10px;">迟到/早退</span>
					<span style="color:#000000; margin-right:10px;">正常</span>
					<span style="color:#9370DB; margin-right:10px;">休息</span>
					<span style="color:#006400; margin-right:10px;">请假</span>
					<span style="color:#00679D; margin-right:10px;">倒休</span>
					<span style="color:#FF7F50; margin-right:10px;">打卡异常</span>
					<span style="color:#87CEFA; margin-right:10px;">加班</span>
					<span style="color:#D2B48C; margin-right:10px;">漏打卡</span>
					</div>
					
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
                            <tr>
                                <td>{{index}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>	
			<div class="tab-pane fade" id="bmcqmx">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="table-responsive">
					<div class="col-lg-8 mtr_a">
						<span>部门：</span>
						<span class="com-sel"><select>
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select></span>
						<span>时间：</span>
						<span><input type="date" value="" class="form-control" /></span>
						<span>&nbsp;&nbsp;&nbsp;至：</span>
						<span><input type="date" value="" class="form-control" /></span>
						<span class="search"><button class="btn btn-primary">导出</button></span>
						<span class="search"><button class="btn btn-warning">查询所有</button></span>
						<span class="search"><button class="btn btn-warning">查询</button></span>
						
					</div>
					
					<div class="col-lg-11 mtr_a">
					<span>注：</span>
					<span style="color:#FF0000; margin-right:10px;">旷工</span>
					<span style="color:#CD853F; margin-right:10px;">迟到</span>
					<span style="color:#000000; margin-right:10px;">正常</span>
					<span style="color:#9370DB; margin-right:10px;">休息</span>
					<span style="color:#006400; margin-right:10px;">请假</span>
					<span style="color:#00679D; margin-right:10px;">倒休</span>
					<span style="color:#FF7F50; margin-right:10px;">打卡异常</span>
					<span style="color:#87CEFA; margin-right:10px;">加班</span>
					<span style="color:#D2B48C; margin-right:10px;">漏打卡</span>
					</div>
					
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
                            <tr>
                                <td>{{index}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
			<div class="tab-pane fade" id="grcqmx">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="table-responsive">
					<div class="col-lg-8 mtr_a">
						<span>时间：</span>
						<span><input type="date" value="" /></span>
						<span>&nbsp;&nbsp;&nbsp;至：</span>
						<span><input type="date" value="" /></span>
						<span class="search"><button class="btn btn-primary">导出</button></span>
						<span class="search"><button class="btn btn-warning">查询</button></span>
						
					</div>
					
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
                            <tr>
                                <td>{{index}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
			<div class="tab-pane fade" id="gscqtj">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="table-responsive">
					<div class="col-lg-10 mtr_a">
						<span>部门：</span>
						<span class="com-sel"><select>
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select></span>
						<span>职位：</span>
						<span class="com-sel"><select>
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select></span>
						<span>姓名：</span>
						<span><input type="text" value="" id="" /></span>
						<span>工号：</span>
						<span><input type="text" value="" id="" /></span>
						<span class="search"><button class="btn btn-primary">导出</button></span>
						<span class="search"><button class="btn btn-warning">查询所有</button></span>
						<span class="search"><button class="btn btn-warning">查询</button></span>
					</div>
					
					<div class="col-lg-11 mtr_a">
					<span>时间：</span>
						<span><input type="date" value="" /></span>
						<span>&nbsp;&nbsp;&nbsp;至：</span>
						<span><input type="date" value="" /></span>
					</div>
					
					<div class="col-lg-11 mtr_a">
					<span>注：</span>
					<span style="color:#FF0000; margin-right:10px;">旷工</span>
					<span style="color:#CD853F; margin-right:10px;">迟到</span>
					<span style="color:#000000; margin-right:10px;">正常</span>
					<span style="color:#9370DB; margin-right:10px;">休息</span>
					<span style="color:#006400; margin-right:10px;">请假</span>
					<span style="color:#00679D; margin-right:10px;">倒休</span>
					<span style="color:#FF7F50; margin-right:10px;">打卡异常</span>
					<span style="color:#87CEFA; margin-right:10px;">加班</span>
					<span style="color:#D2B48C; margin-right:10px;">漏打卡</span>
					</div>
					
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
                            <tr>
                                <td>{{index}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
			<div class="tab-pane fade" id="kqbb">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="table-responsive">
					<div class="col-lg-10 mtr_a">
						<span><input type="radio" name="xm" /></span>
						<span>部门：</span>
						<span class="com-sel"><select>
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select></span>
						<span>职位：</span>
						<span class="com-sel"><select>
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select></span>
						<span>姓名：</span>
						<span><input type="text" value="" id="" /></span>
						<span>工号：</span>
						<span><input type="text" value="" id="" /></span>
						<span class="search"><button class="btn btn-primary">导出</button></span>
						<span class="search"><button class="btn btn-warning">查询所有</button></span>
						<span class="search"><button class="btn btn-warning">查询</button></span>
					</div>
					
					<div class="col-lg-11 mtr_a">
					<span><input type="radio" name="xm" /></span>
					<span>项目：</span>
						<span class="com-sel"><select>
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select></span>
					<span>时间：</span>
						<span><input type="date" value="" /></span>
						<span>&nbsp;&nbsp;&nbsp;至：</span>
						<span><input type="date" value="" /></span>
					</div>
					
					<div class="col-lg-11 mtr_a">
					<span>注：</span>
					<span style="color:#FF0000; margin-right:10px;">旷工</span>
					<span style="color:#CD853F; margin-right:10px;">迟到/早退</span>
					<span style="color:#000000; margin-right:10px;">正常</span>
					<span style="color:#9370DB; margin-right:10px;">休息</span>
					<span style="color:#006400; margin-right:10px;">请假</span>
					<span style="color:#00679D; margin-right:10px;">倒休</span>
					<span style="color:#FF7F50; margin-right:10px;">打卡异常</span>
					<span style="color:#87CEFA; margin-right:10px;">加班</span>
					<span style="color:#D2B48C; margin-right:10px;">漏打卡</span>
					</div>
					
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
                            <tr>
                                <td>{{index}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
			<div class="tab-pane fade" id="kqtjbb">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="table-responsive">
					<div class="col-lg-8 mtr_a">
						<span>部门：</span>
						<span class="com-sel"><select>
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select></span>
						<span>时间：</span>
						<span><input type="date" value="" /></span>
						<span>&nbsp;&nbsp;&nbsp;至：</span>
						<span><input type="date" value="" /></span>
						<span class="search"><button class="btn btn-primary">导出</button></span>
						<span class="search"><button class="btn btn-warning">查询</button></span>
					</div>
					
					<div class="col-lg-11 mtr_a">
					<span>姓名：</span>
						<span><input type="text" value="" id="" /></span>
						<span>工号：</span>
						<span><input type="text" value="" id="" /></span>
					
					</div>
					
					<div class="col-lg-11 mtr_a">
					<span>注：</span>
					<span style="color:#000000; margin-right:10px;">正常</span>
					<span style="color:#00FFFF; margin-right:10px;">其他</span>
					</div>
					
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
                            <tr>
                                <td>{{index}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
			
			<div class="tab-pane fade" id="rypbjh">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="position:inherit;">
            <div class="table-responsive col-xs-2 col-sm-2 col-md-2 col-lg-2">
					
                    <div class="centent">
		<div class="treebox">
			<div class="tree">
				<ul>
				
				
				<li><div class="close_menu top_menu"><span><img src="img/top_menu.jpg" width="24" height="24" /></span><a title="九博健康管理有限公司">九博健康管理有限公司</a></div>
					<ul class="bm_sun">
						<li>
						<div class="close_menu sun_menu"><span><img src="img/son_menu.jpg" width="24" height="24" /></span><a title="人力综合办">人力综合办</a></div>
						<ul class="sex">
							<li>
								<div class="close_menu unm"><span><input type="hidden" value="0" class="cc" /><img src="img/man.jpg" width="24" height="24" /></span><a title="李珊珊">李珊珊</a></div>
							</li>
							<li>
								<div class="close_menu unm"><span><input type="hidden" value="1" class="cc" /><img src="img/man.jpg" width="24" height="24" /></span><a title="王建军">王建军</a></div>
							</li>
						</ul>

				</li>
						<li>
						<div class="close_menu sun_menu"><span><img src="img/son_menu.jpg" width="24" height="24" /></span><a title="人力综合办">人力综合办</a></div>
						<ul class="sex">
							<li>
								<div class="close_menu unm"><span><input type="hidden" value="1" class="cc" /><img src="img/man.jpg" width="24" height="24" /></span><a title="李珊珊">李珊珊</a></div>
							</li>
							<li>
								<div class="close_menu unm"><span><input type="hidden" value="1" class="cc" /><img src="img/man.jpg" width="24" height="24" /></span><a title="王建军">王建军</a></div>
							</li>
						</ul>

				</li>
				</ul>
				</li>
				</ul>
			</div>
		</div>
		</div>
				
     </div>
		    <div class="table-responsive col-xs-9 col-sm-9 col-md-9 col-lg-9" style="position:relative; padding-bottom:30px;">
			<div class="col-lg-4 mtr_a clearfix">
						<span>查找：</span>
						<span><input type="text" name="" class="form-control" placeholder="输入姓名,快速查找..." style="width:200px;" /></span>
						<span><button class="btn btn-infor">查询</button></span>
					</div>
					<div class="col-lg-8 mtr_a big_font_size">
						<span><a href="#weekday" data-toggle="tab" aria-expanded="true">月</a></span> | <span>周</span> | <span>刷新</span>  | <span>&lt;</span> 000 <span>&gt;</span><font class="pull-right"> 员工:<span id="uname">未选择员工</span></font>
						
					</div>
                     
					 
					 
					 
					 
					 
					  <div id="main" style="width: 1000px;height:1000px; margin-bottom:30px; top:50px; position:static;"></div>
					 <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

       option = {
    title: {
    },
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : ''        // 默认为直线，可选为：'line' | 'shadow'
        },
        formatter: function (params) {
            var tar;
            if (params[1].value != '-') {
                tar = params[1];
            }
            else {
                tar = params[0];
            }
            return tar.name + '<br/>' + tar.seriesName + ' : ' + tar.value;
        }
    },
    legend: {
        data:[]
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis: {
        type : 'category',
        splitLine: {show:false},
        data : ['周一','周二','周三','周四','周五','周六','周日']
    },
    yAxis: {
        type : 'value'
    },
    series: [
        {
            name: '班次',
            type: 'bar',
            stack: '总量',
            itemStyle: {
                normal: {
                    barBorderColor: 'rgba(0,0,0,0)',
                    color: 'rgba(0,0,0,0)'
                },
                emphasis: {
                    barBorderColor: 'rgba(0,0,0,0)',
                    color: 'rgba(0,0,0,0)'
                }
				
            },
            data: [8.5,8.5,8.5,8.5,8.5,8.5,8.5]
        },
		
		
        {
            name: '班次',
            type: 'bar',
            stack: '总量',
            label: {
                normal: {
                    show: false,
                    position: 'top'
                }
            },
			
			data: [0-6,0-8,0-8,0-8,0-8,0-8,0-0]
        },
		{
            name: '班次',
            type: 'bar',
            stack: '总量',
            label: {
                normal: {
                    show: false,
                    position: 'top'
                }
            },
			
			data: [8,8,8,8,8,8,8]
        },
		
        
    ]
};

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
	
	
	
	
					 
                </div>
            </div>
			</div>

			<div class="tab-pane fade" id="weekday">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="position:inherit;">
            <div class="table-responsive col-xs-2 col-sm-2 col-md-2 col-lg-2">
					
                    <div class="centent">
		<div class="treebox">
			<div class="tree">
				<ul>
				
				
				<li><div class="close_menu top_menu"><span><img src="img/top_menu.jpg" width="24" height="24" /></span><a title="九博健康管理有限公司">九博健康管理有限公司</a></div>
					<ul class="bm_sun">
						<li>
						<div class="close_menu sun_menu"><span><img src="img/son_menu.jpg" width="24" height="24" /></span><a title="人力综合办">人力综合办</a></div>
						<ul class="sex">
							<li>
								<div class="close_menu unmn"><span><input type="hidden" value="0" class="cc" /><img src="img/man.jpg" width="24" height="24" /></span><a title="李珊珊">李珊珊</a></div>
							</li>
							<li>
								<div class="close_menu unmn"><span><input type="hidden" value="1" class="cc" /><img src="img/man.jpg" width="24" height="24" /></span><a title="王建军">王建军</a></div>
							</li>
						</ul>

				</li>
						<li>
						<div class="close_menu sun_menu"><span><img src="img/son_menu.jpg" width="24" height="24" /></span><a title="人力综合办">人力综合办</a></div>
						<ul class="sex">
							<li>
								<div class="close_menu unmn"><span><input type="hidden" value="1" class="cc" /><img src="img/man.jpg" width="24" height="24" /></span><a title="李珊珊">李珊珊</a></div>
							</li>
							<li>
								<div class="close_menu unmn"><span><input type="hidden" value="1" class="cc" /><img src="img/man.jpg" width="24" height="24" /></span><a title="王建军">王建军</a></div>
							</li>
						</ul>

				</li>
				</ul>
				</li>
				</ul>
			</div>
		</div>
		</div>
				
     </div>
		    <div class="table-responsive col-xs-9 col-sm-9 col-md-9 col-lg-9" style="position:relative; padding-bottom:30px;">
			<div class="col-lg-4 mtr_a clearfix">
						<span>查找：</span>
						<span><input type="text" name="" class="form-control" placeholder="输入姓名,快速查找..." style="width:200px;" /></span>
					</div>
					<div class="col-lg-8 mtr_a big_font_size">
						<span><a href="#weekday" data-toggle="tab" aria-expanded="true">月</a></span> | <span>周</span> | <span>刷新</span>  | <span>&lt;</span> 000 <span>&gt;</span><font class="pull-right"> 员工:<span id="unamen">未选择员工</span></font>
						
					</div>
					 <div class="wrap"></div>
                </div>
            </div>
			</div>
			
			
			
			
			
			
			<div class="tab-pane fade" id="pbjhsc">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="table-responsive">
					<div class="col-lg-8 mtr_a">
						<span>时间：</span>
						<span><input type="date" value="" /></span>
						<span>&nbsp;&nbsp;&nbsp;至：</span>
						<span><input type="date" value="" /></span>
						<span class="search"><button class="btn btn-warning">查询</button></span>
						<span class="search"><button class="btn btn-danger">删除</button></span>
						
					</div>
					
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">员工</th>
                                <th class="text-center">工号</th>
                                <th class="text-center">班次</th>
                                <th class="text-center">排班日期</th>
                                <th class="text-center">开始</th>
                                <th class="text-center">结束</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>{{index}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
			<div class="tab-pane fade" id="pbjhdr">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="table-responsive">
					<div class="col-lg-8 mtr_a">
						<span>排班计划：</span>
						<span><input class="" type="file" value="" id="" /></span>
<!--						<span class="search"><button>文件</button></span>
-->						
					</div>
					
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">员工</th>
                                <th class="text-center">工号</th>
                                <th class="text-center">班次</th>
                                <th class="text-center">排班日期</th>
                                <th class="text-center">开始</th>
                                <th class="text-center">结束</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>{{index}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
			<div class="tab-pane fade" id="jqzlgl">
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="position:relative;">
            <div class="table-responsive col-xs-6 col-sm-6 col-md-6 col-lg-6">
					<div class="col-lg-8 mtr_a">
						<span>假期种类：</span>
					</div>
					
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">名称</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center">清明</td>
                            </tr>
							 <tr>
                                <td class="text-center">元旦</td>
                            </tr>
							 <tr>
                                <td class="text-center">三八</td>
                            </tr>
							 <tr>
                                <td class="text-center">五一</td>
                            </tr>
							 <tr>
                                <td class="text-center">端午</td>
                            </tr>
							 <tr>
                                <td class="text-center">春节</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
			<button class="btn-primary btn pull-left" data-toggle='modal' data-target='#mymodal'>新增</button>
            </div>
        </div>
  				<div class="modal fade" id="mymodal">
    <div class="modal-dialog">
      <div class="modal-content"><!-- 模态弹出窗内容 -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4></h4>
        </div>
          <div class="modal-body clearfix">
            <div class="col-md-10 col-md-offset-1">
 				<p>假期种类：<input type="text" class="form-control" placeholder="输入假期类型" style="margin-top:20px;" /></p>
             </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">确认</button>
          </div>
      </div>
    </div>
  </div>
  			<div class="tab-pane fade" id="cqgzgl">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="position:relative;">
            <div class="table-responsive col-xs-10 col-sm-10 col-md-10 col-lg-10">
<!--					<div class="col-lg-8 mtr_a">
						<span>考勤规则管理：</span>
					</div>
-->					
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">名称</th>
							    <th class="text-center">最早时间</th>
								<th class="text-center">最晚时间</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center">打卡异常</td>
								<td class="text-center">11</td>
								<td class="text-center">11</td>
                            </tr>
							 <tr>
                                <td class="text-center">迟到</td>
								<td class="text-center">22</td>
								<td class="text-center">22</td>
                            </tr>
							 <tr>
                                <td class="text-center">早退</td>
								<td class="text-center">2</td>
								<td class="text-center">3</td>
                            </tr>
							 <tr>
                                <td class="text-center">旷工</td>
								<td class="text-center">1</td>
								<td class="text-center">3</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
			<button class="btn-primary btn pull-left" data-toggle='modal' data-target='#mygz'>新增</button>
            </div>
        </div>
  				<div class="modal fade" id="mygz">
    <div class="modal-dialog">
      <div class="modal-content"><!-- 模态弹出窗内容 -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4></h4>
        </div>
          <div class="modal-body clearfix">
            <div class="col-md-10 col-md-offset-1">
 				<div class="form-group">
                <div class="col-md-3 texr">
                  <label for="">名称：</label>
                </div>
                <div class="col-md-9">
                  <input class="form-control" type="text" name="" placeholder="输入规则"/>
                </div>
              </div>
			  <div class="form-group">
                <div class="col-md-3 texr">
                  <label for="">最早时间</label>
                </div>
                <div class="col-md-9">
                  <input class="form-control" type="date" name="" />
                </div>
              </div>
 				<div class="form-group">
                <div class="col-md-3 texr">
                  <label for="">最晚时间：</label>
                </div>
                <div class="col-md-9">
                  <input class="form-control" type="date" name="" />
                </div>
              </div>			  
             </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">确认</button>
          </div>
      </div>
    </div>
  </div>
			<div class="tab-pane fade" id="pbgzgl">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="position:relative;">
            <div class="table-responsive col-xs-12 col-sm-12 col-md-12 col-lg-12">
<!--					<div class="col-lg-8 mtr_a">
						<span>排班规则管理：</span>
					</div>
-->					
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">名称</th>
							    <th class="text-center">简称</th>
								<th class="text-center">开始时间</th>
                                <th class="text-center">结束时间</th>
							    <th class="text-center">类型</th>
								<th class="text-center">备注</th>								
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center">早班</td>
								<td class="text-center">早班</td>
								<td class="text-center">08:00</td>
								<td class="text-center">16:00</td>
								<td class="text-center">工作</td>
								<td class="text-center"></td>
                            </tr>
							 <tr>
                                <td class="text-center">早班</td>
								<td class="text-center">早班</td>
								<td class="text-center">08:00</td>
								<td class="text-center">16:00</td>
								<td class="text-center">工作</td>
								<td class="text-center"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
			<button class="btn-primary btn pull-left" data-toggle='modal' data-target='#mypbgzgl'>新增</button>
        </div>
  				<div class="modal fade" id="mypbgzgl">
    <div class="modal-dialog" style="position:relative;">
      <div class="modal-content"><!-- 模态弹出窗内容 -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4></h4>
        </div>
          <div class="modal-body clearfix">
            <div class="col-md-12" style="padding:0">
			<h2>编辑排班规则</h2>
			
 				<div class="form-group">
                <div class="col-md-2 text-right">
                  <label for="">名称：</label>
                </div>
                <div class="col-md-4">
                  <input class="form-control" type="text" name="" />
                </div>
				<div class="col-md-2 texr">
                  <label for="">简称：</label>
                </div>
                <div class="col-md-4">
                  <input class="form-control" type="text" name="" />
                </div>
              </div>
			  
			  <div class="form-group">
                <div class="col-md-2 texr">
                  <label for="">起始时间：</label>
                </div>
                <div class="col-md-4">
                  <input class="form-control" type="date" name="" />
                </div>
				 <div class="col-md-2 texr">
                  <label for="">结束时间：</label>
                </div>
                <div class="col-md-4">
                  <input class="form-control" type="date" name="" />
                </div>
              </div>
 				<div class="form-group">
                <div class="col-md-2 texr">
                  <label for="">类型：</label>
                </div>
                <div class="col-md-10">
                  <select class="com-opt">
				    <option>1</option>
				    <option>2</option>
				    <option>3</option>
				  </select>
                </div>
              </div>
			  <div class="form-group">
                <div class="col-md-2 texr">
                  <label for="">备注：</label>
                </div>
                <div class="col-md-10">
                 <textarea cols="50" rows="5" placeholder="备注"></textarea>
                </div>
              </div>
			  			  
             </div>
          </div>
          <div class="modal-footer">
		    <button type="submit" class="btn btn-primary">确认</button>
            <button type="submit" class="btn btn-danger">删除</button>
          </div>
      </div>
    </div>
  </div>
			<div class="tab-pane fade" id="bzgl">
            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" style="position:relative;">
            <div class="table-responsive col-xs-10 col-sm-10 col-md-10 col-lg-10">					
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">班组名称</th>
							    <th class="text-center">备注</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center">正常班组</td>
								<td class="text-center">正常班组</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
			<button class="btn-primary btn" data-toggle='modal' data-target='#mybzgl'>新增</button>
            </div>
        </div>
  				<div class="modal fade" id="mybzgl">
    <div class="modal-dialog">
      <div class="modal-content"><!-- 模态弹出窗内容 -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4></h4>
        </div>
          <div class="modal-body clearfix">
            <div class="col-md-10 col-md-offset-1">
 				<div class="form-group">
                <div class="col-md-3 texr">
                  <label for="">班组名称：</label>
                </div>
                <div class="col-md-9">
                  <input class="form-control" type="text" name="" placeholder="班组名称"/>
                </div>
              </div>
			  <div class="form-group">
                <div class="col-md-3 texr">
                  <label for="">备注：</label>
                </div>
                <div class="col-md-9">
                 	<textarea cols="50" rows="3" placeholder="备注"></textarea>
                </div>
              </div>
             </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">确认</button>
          </div>
      </div>
    </div>
  </div>
  			<div class="tab-pane fade" id="bmgl">
            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" style="position:relative;">
            <div class="table-responsive col-xs-10 col-sm-10 col-md-10 col-lg-10">
					<div class="col-lg-8 mtr_a">
						<span>部门信息管理：</span>
					</div>
					
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">部门名称</th>
							    <th class="text-center">上级部门</th>
								<th class="text-center">顺序号</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center">运维组</td>
								<td class="text-center">技术组</td>
								<td class="text-center">11</td>
                            </tr>
							 <tr>
                                <td class="text-center">优化组</td>
								<td class="text-center">品宣组</td>
								<td class="text-center">22</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
			<button class="btn-primary btn" data-toggle='modal' data-target='#mybmgl'>新增</button>
            </div>
        </div>
  				<div class="modal fade" id="mybmgl">
    <div class="modal-dialog">
      <div class="modal-content"><!-- 模态弹出窗内容 -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4></h4>
        </div>
          <div class="modal-body clearfix">
            <div class="col-md-10 col-md-offset-1">
			<h2>部门信息</h2>
 				<div class="form-group">
                <div class="col-md-3 texr">
                  <label for="">部门：</label>
                </div>
                <div class="col-md-9">
                  <input class="form-control" type="text" name="" />
                </div>
              </div>
			  <div class="form-group">
                <div class="col-md-3 texr">
                  <label for="">父级部门：</label>
                </div>
                <div class="col-md-9">
                 <select class="com-opt">
				 <option>1</option>
				 <option>2</option>
				 <option>3</option>
				 </select>
                </div>
              </div>
 				<div class="form-group">
                <div class="col-md-3 texr">
                  <label for="">顺序号：</label>
                </div>
                <div class="col-md-9">
                  <input class="form-control" type="text" name="" />
                </div>
              </div>			  
             </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">确认</button>
          </div>
      </div>
    </div>
  </div>
			<div class="tab-pane fade" id="zwgl">
            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" style="position:relative;">
            <div class="table-responsive col-xs-10 col-sm-10 col-md-10 col-lg-10">
					<div class="col-lg-8 mtr_a">
						<span>职位信息管理：</span>
					</div>
					
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">职位名称</th>
							    <th class="text-center">岗位类型</th>
								<th class="text-center">重点岗位</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center">超级管理员</td>
								<td class="text-center">基础岗位</td>
								<td class="text-center"></td>
                            </tr>
							 <tr>
                                <td class="text-center">运行项目主管</td>
								<td class="text-center">主管岗位</td>
								<td class="text-center"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
			<button class="btn-primary btn" data-toggle='modal' data-target='#myzwgl'>新增</button>
            </div>
        </div>
  				<div class="modal fade" id="myzwgl">
    <div class="modal-dialog" style="position:relative;">
      <div class="modal-content"><!-- 模态弹出窗内容 -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4></h4>
        </div>
        <div class="modal-body clearfix">
            <div class="col-md-10 col-md-offset-1">
			<h2>编辑职位信息</h2>
 				<div class="form-group">
                <div class="col-md-3 texr">
                  <label for="">岗位类型：</label>
                </div>
                <div class="col-md-9">
				<select class="com-opt">
				 <option>1</option>
				 <option>2</option>
				 <option>3</option>
				 </select>
                </div>
              </div>
			  <div class="form-group">
                <div class="col-md-3 texr">
                  <label for="">岗位名称：</label>
                </div>
                <div class="col-md-9">
                 <input class="form-control" type="text" name="" />
                </div>
              </div>
 				<div class="form-group">
                <div class="col-md-3 texr">
                  <label for="">重点岗位：</label>
                </div>
                <div class="col-md-9">
                  <input class="form-control" type="checkbox" name="" />是
                </div>
              </div>			  
             </div>
          </div>
      </div>
	  	<button type="submit" class="btn btn-primary mtbox">返回</button>
        <button type="submit" class="btn btn-primary">确认</button>
    </div>
  </div>
			<div class="tab-pane fade" id="gwlxgl">
            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" style="position:relative;">
            <div class="table-responsive col-xs-10 col-sm-10 col-md-10 col-lg-10">
					<div class="col-lg-8 mtr_a">
						<span>岗位类型管理：</span>
					</div>
					
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">ID</th>
							    <th class="text-center">类型名称</th>
								<th class="text-center">修改</th>
								<th class="text-center">删除</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center">1</td>
								<td class="text-center">基础岗位</td>
								<td class="text-center"><a data-toggle='modal' data-target='#mymodale' style="cursor:pointer;">修改</a></td>
								<td class="text-center"><a class="delet" style="cursor:pointer;">删除</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
			<button class="btn-primary btn" data-toggle='modal' data-target='#mygwlxgl'>新增</button>
            </div>
        </div>
  				<div class="modal fade" id="mymodale">
    <div class="modal-dialog" style="position:relative;">
      <div class="modal-content"><!-- 模态弹出窗内容 -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4></h4>
        </div>
          <div class="modal-body clearfix" style="padding-bottom:50px;">
            <div class="col-md-10 col-md-offset-1">
			<h2>编辑岗位类型</h2>
 				<div class="form-group">
                <div class="col-md-3 texr">
                  <label for="">岗位类型：</label>
                </div>
                <div class="col-md-9">
				<input class="form-control" type="text" name="" value="" />
                </div>
              </div>
             </div>
          </div>
      </div>
	  	<button type="submit" class="btn btn-primary mtbod">返回</button>
        <button type="submit" class="btn btn-primary">确认</button>
    </div>
  </div>
				<div class="modal fade" id="mygwlxgl">
    <div class="modal-dialog">
      <div class="modal-content"><!-- 模态弹出窗内容 -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4></h4>
        </div>
          <div class="modal-body clearfix" style="padding-bottom:50px;">
            <div class="col-md-10 col-md-offset-1">
			<h2>编辑岗位类型</h2>
 				<div class="form-group">
                <div class="col-md-3 texr">
                  <label for="">岗位类型：</label>
                </div>
                <div class="col-md-9">
				<input class="form-control" type="text" name="" value="" />
                </div>
              </div>
             </div>
          </div>
          <div class="modal-footer">
			<button type="submit" class="btn btn-primary mtbod">返回</button>
            <button type="submit" class="btn btn-primary">确认</button>
          </div>
      </div>
    </div>
  </div>
  
  
			<div class="tab-pane fade" id="qjgl">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="position:inherit;">
            <div class="table-responsive col-xs-3 col-sm-3 col-md-3 col-lg-3">
					<div class="col-lg-12 mtr_a clearfix">
						<span>查找：</span>
						<span><input type="text" name="" placeholder="输入姓名,快速查找..." style="width:200px;" /></span>
					</div>
										
                    <div class="centent">
		<div class="treebox">
			<div class="tree">
				<ul>
				
				
				<li><div class="close_menu"><span></span><a title="一级菜单">九博健康管理有限公司</a></div>
					<ul>
						<li>
						<div class="close_menu"><span></span><a title="一级菜单">人力综合办</a></div>
						<ul>
							<li>
								<div class="close_menu bc"><a title="二级菜单">李珊珊</a></div>
							</li>
							<li>
								<div class="close_menu bc"><a title="二级菜单">王蕊</a></div>
							</li>
						</ul>
					</li>
						<li>
						<div class="close_menu"><span></span><a title="一级菜单">财务部</a></div>
						<ul>
							<li>
								<div class="close_menu bc"><a title="二级菜单">马愔嫕</a></div>
									</li>
								</ul>
							</li>
						</ul>
				</li>
				</ul>
			</div>
		</div>
		</div>
				
     </div>
		    <div class="table-responsive col-xs-9 col-sm-9 col-md-9 col-lg-9" style="position:relative; padding-bottom:30px;">
					<div class="col-lg-12 mtr_a">
						<span>类型：</span>
						<span class="com-sel"><select class="com-opt">
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select></span>
						<span>时间：</span>
						<span><input class="com-opc" type="text" value="" id="time_startqjgl" /></span>
						<span>&nbsp;&nbsp;&nbsp;至：</span>
						<span><input class="com-opc" type="text" value="" id="time_overqjgl" /></span>
						<span class="search"><button class="btn btn-primary">导出</button></span>
						<span class="search"><button>全部</button></span>
						<span class="search"><button>查询</button></span>
						
					</div>
					
                     <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">姓名</th>
                                <th class="text-center">部门</th>
                                <th class="text-center">请假类别</th>
                                <th class="text-center">开始时间</th>
                                <th class="text-center">结束时间</th>
                                <th class="text-center">总计时间</th>
                                <th class="text-center">总计天数</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>{{index}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                            </tr>
							                            

                        </tbody>
                    </table>
					<p class="pull-left" id="user_name">未选择员工</p>
			<button class="btn-primary btn pull-left" data-toggle='modal' data-target='#myqjgl'>请假</button>
                </div>
            </div>
        </div>
  				<div class="modal fade" id="myqjgl">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4></h4>
        </div>
          <div class="modal-body clearfix">
            <div class="col-md-10 col-md-offset-1">
 				<p>假期种类：<input type="text" id="new_jqlx" placeholder="输入假期类型" /></p>
             </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">确认</button>
          </div>
      </div>
    </div>
  </div>
	
		
</div>
<script src="<%=path %>/js/jquery.min.js"></script>
<script src="<%=path %>/js/bootstrap.js"></script>

<script type="text/javascript">
$(".cc").each(function(){
	vals='';
	vals+=$(this).val();
	if(vals == 1){
			$(this).siblings().attr('src','img/men.jpg')
		}else{
			$(this).siblings().attr('src','img/man.jpg')
	}
});
 

$(document).on('mouseover',function(){
	$(".xiu").each(function(){
	valx='';
	valx+=$(this).text();
	if(valx == '公休'){
			$(this).css('color','red')
		}
});
	
})


</script>
<script type="text/javascript">
   $(".ac").click(function(){
   $("#tresult").text($(this).text());
  })

   $(".unm").click(function(){
   $("#uname").text($(this).text());
  })
	$(".unmn").click(function(){
   $("#unamen").text($(this).text());
  })

   $(".bc").click(function(){
   $("#user_name").text($(this).text());
  })
	
	$(".delet").click(function(){
		if(confirm("确定要删除?"))
     {
       return true;
     }else{
	   return false;
	 }  })

</script>
</body>
</html>