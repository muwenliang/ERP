<%@page import="com.jiubo.erp.rygl.vo.QueryFamilyResult"%>
<%@page import="com.jiubo.erp.rygl.vo.QueryResult"%>
<%@page import="com.jiubo.erp.rygl.bean.DepartmentBean"%>
<%@page import="com.jiubo.erp.rygl.bean.ProjectDataBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%String path=request.getContextPath(); %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <!--   <meta charset="UTF-8"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/css/employee.css">
    <link rel="stylesheet" href="<%=path%>/css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="<%=path%>/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="<%=path%>/js/bootstrap-datetimepicker.js">
    <link rel="stylesheet" href="<%=path%>/js/bootstrap-datetimepicker.min.js">
    <script type="text/javascript">
</script>
    <title>员工管理</title>
</head>
<body>
    <div class="container user-container" id="employee-app">
        <div class="row">
            <div class="col-md-12 col-lg-12 main-title">
                <h2>人员管理</h2>
            </div>
        </div>
      <form id="ryForm" action="<%=path%>/search/ryList" method="post">
        <div class="row">
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                <div class="col-md-2 col-lg-2" style="padding: 0; line-height: 34px;">
                    <p>项目：</p>
                </div>
                <div class="col-md-10 col-lg-10">
                    <select class="form-control" name="projectId" >
                        <option value="" selected="selected">全部</option>
                        <%
                        List<ProjectDataBean> prolist=(List<ProjectDataBean>)request.getAttribute("project");
                          for(ProjectDataBean bean:prolist){	 
                        %>
                           <option value="<%=bean.getProjectID()%>"><%=bean.getProjectName()%></option>
                        <%
                          } %>
                    </select>
                </div>
            </div>
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                <div class="col-md-2 col-lg-2" style="padding: 0; line-height: 34px;">
                    <p>状态：</p>
                </div>
                <div class="col-md-10 col-lg-10">
                    <select class="form-control" name="state">
                        <option value="" selected="selected" onchange="">全部</option>
                        <option value="1">在职</option>
                        <option value="2">离职</option>
                    </select>
                </div>
            </div>
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                <div class="col-md-2 col-lg-2" style="padding: 0; line-height: 34px;">
                    <p>部门：</p>
                </div>
                <div class="col-md-10 col-lg-10">
                    <select class="form-control" name="departName">
                        <option value="" selected="selected" >九博健康管理有限公司</option>
                        <%
                        List<DepartmentBean>  dplist=(List<DepartmentBean>)request.getAttribute("depart");
                          for(DepartmentBean bean:dplist){	 
                        %>
                          <option value="<%=bean.getName()%>"><%=bean.getName()%></option>
                        <%
                           }
                        %>
                    </select>
                </div>
            </div>
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for..." name="searchContent">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit">搜索</button>
                    </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-lg-12 user-btn-group">
                <button type="submit" class="btn btn-warning" onclick="">条件重置</button>
                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModalQuery">高级查询</button>
                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModalFamily">家庭成员</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalJoin">员工入职</button>
                <button type="button" class="btn btn-primary" id="exportButton" name="exportButton">导出</button>
            </div>
        </div>
       </form> 
        <div class="row">
            <div class="col-md-12 col-lg-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover user-table" id="ryTable">
                        <thead>
                            <tr>
                                <th class="text-center">序号</th>
                                <th class="text-center">工号</th>
                                <th class="text-center">姓名</th>
                                <th class="text-center">性别</th>
                                <th class="text-center">部门</th>
                                <th class="text-center">职位</th>
                                <th class="text-center">ERP账号</th>
                                <th class="text-center">出生日期</th>
                                <th class="text-center">入职日期</th>
                                <th class="text-center">转正日期</th>
                                <th class="text-center">离职日期</th>
                                <th class="text-center">状态</th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- 人员数据 -->
                          <%
                            List<QueryResult> rylist=(List<QueryResult>)request.getAttribute("empData");
	                        for(QueryResult bean:rylist){	 
	                        	String sinf="";
                                if(bean.getState().equals("1")){
                               	 sinf="在职";
                                }else{
                               	 sinf="离职";
                                }
	                      %>
                            <tr>
                                <td><%=bean.getId() %></td>
                                <td><%=bean.getJobNum() %></td>
                                <td><%=bean.getName() %></td>
                                <td><%=bean.getSex() %></td>
                                <td><%=bean.getDepartName() %></td>
                                <td><%=bean.getPositionName() %></td>
                                <td><%=bean.getERPAaccount() %></td>
                                <td><%=bean.getBirth() %></td>
                                <td><%=bean.getEntryDate()%></td>
                                <td><%=bean.getPositiveDate() %></td>
                                <td><%=bean.getResignDate() %></td>                               
                                <td><%=sinf%></td>
                            </tr>
                             <%}%>
                        </tbody>
                        <!-- 分页信息 -->
                        <%
	                        int totalnfo=(int)request.getAttribute("totalnfo");
                        %>
                    </table>
                        共<%=totalnfo%>记录
                </div>
            </div>
        </div>
        </div>
        
        <div class="row">
            <!-- 高级查询 -->
            <form id="ryForm" action="<%=path%>/search/ryList" method="post">
            <div class="modal fade" id="myModalQuery">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">高级查询</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="col-md-1 col-lg-1 clear-mp" style="line-height: 34px;">
                                        <label>类别：</label>
                                    </div>
                                    <div class="col-md-4 col-lg-4 clear-mp">
                                        <select class="form-control" name="searchType">
                                            <option value="0">全部</option>
                                            <option value="1">入职日期</option>
                                            <option value="2">转正日期</option>
                                            <option value="3">离职日期</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row add-mt">
                                <div class="form-inline col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="firstTime" class="control-label">时间：</label>
                                        <div class="input-group">
                                            <input type="date" class="form-control" id="firstTime" name="startDate">
                                            <div class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-inline col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="secondTime" class="control-label">至：</label>
                                        <div class="input-group">
                                            <input type="date" class="form-control" id="secondTime" name="endDate">
                                            <div class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row add-mt">
                                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2">
                                    <div class="col-md-3 col-lg-3 clear-mp" style="line-height: 34px;"><label>查看生日在：</label></div>
                                    <div class="col-md-7 col-lg-7 clear-mp">
                                        <select class="form-control" name="birth">
                                            <option value="0">全部</option>
                                            <option value="01">1</option>
                                            <option value="02">2</option>
                                            <option value="03">3</option>
                                            <option value="04">4</option>
                                            <option value="05">5</option>
                                            <option value="06">6</option>
                                            <option value="07">7</option>
                                            <option value="08">8</option>
                                            <option value="09">9</option>
                                            <option value="10">10</option>
                                            <option value="$("#cyname").val()">$("#cyname").val()</option>
                                            <option value="12">12</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2 col-lg-2 clear-mp" style="line-height: 34px; text-align: right"><label>月份员工</label></div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary" >查询</button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
            <!-- 家庭成员 -->
            <div class="modal fade" id="myModalFamily" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-family">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">家庭成员</h4>
                        </div>
                        <div class="modal-body">
                        <!-- 家庭成员检索开始 <form action="<%=path%>/search/ryList" method="post">-->
                        <form action="<%=path%>/search/ryList" method="post">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="ygname" class="col-md-3 control-label nopad">员工姓名</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" 
                                                    placeholder="输入工号,姓名查询..." name="empName" id="empName" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="ygname" class="col-md-3 control-label nopad">成员姓名</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" 
                                                    placeholder="" name="chName" id="chName">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="date" class="col-md-3 control-label nopad">生日月份</label>
                                            <div class="col-md-9">
                                                <select class="form-control" name="shBirth" id="shBirth">
                                                    <option value="0">全部</option>
                                                    <option value="01">1</option>
                                                    <option value="02">2</option>
                                                    <option value="03">3</option>
                                                    <option value="04">4</option>
                                                    <option value="05">5</option>
                                                    <option value="06">6</option>
                                                    <option value="07">7</option>
                                                    <option value="08">8</option>
                                                    <option value="09">9</option>
                                                    <option value="10">10</option>
                                                    <option value="$("#cyname").val()">$("#cyname").val()</option>
                                                    <option value="12">12</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 col-md-offset-1">
                                        <button type="button" class="btn btn-primary" onclick="fm_info()">查询</button>
                                        <button type="button" class="btn btn-primary">导出</button>
                                    </div>
                                </div>
                            </div>
                           </form>
                            <div class="row">
                                <div class="col-md-12 table-responsive text-center martop">
                                    <table class="table table-bordered table-hover" id="fmLists">
                                        <thead>
                                            <tr>
                                                <th class="text-center">工号</th>
                                                <th class="text-center">员工姓名</th>
                                                <th class="text-center">称谓</th>
                                                <th class="text-center">成员姓名</th>
                                                <th class="text-center">出生日期</th>
                                                <th class="text-center">工作单位</th>
                                                <th class="text-center">职务</th>
                                                <th class="text-center">电话</th>
                                                <th class="text-center">微信</th>
                                                <th class="text-center">家庭住址</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                        List<QueryFamilyResult> fmlist=(List<QueryFamilyResult>)request.getAttribute("fmyData");
					                        for(QueryFamilyResult bean:fmlist){	 
	                                     %>
                                            <tr>
                                                <td><%=bean.getJobnum() %></td>
                                                <td><%=bean.getName()%></td>
                                                <td><%=bean.getAppellation() %></td>
                                                <td><%=bean.getChname() %></td>
                                                <td><%=bean.getBirth() %></td>
                                                <td><%=bean.getWorkadress() %></td>
                                                <td><%=bean.getPosition() %></td>
                                                <td><%=bean.getPhone() %></td>
                                                <td><%=bean.getWechat() %></td>
                                                <td><%=bean.getFamAddress()%></td>
                                            </tr>
                                            <%
					                          }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
            <!--员工入职弹出-->
            <div class="modal fade" id="myModalJoin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog staff_t">
                <form action="<%=path%>/search/uBaseInfo" method="post">
                    <div class="modal-content">
                        <div class="modal-header"><button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
                            <h4 id="myModalLabel" class="modal-title">员工入职</h4>
                        </div>
                        <div class="modal-body">
                            <ul class="nav nav-tabs martop">
                                <li class="active"><a href="#basic" data-toggle="tab">基本信息</a></li>
                                <li><a href="#detailed" data-toggle="tab">详细信息</a></li>
                                <li><a href="#family" data-toggle="tab">家庭成员</a></li>
                                <li><a href="#record" data-toggle="tab">调动记录</a></li>
                            </ul>
                            <!-- 基本信息 -->
                            <div class="tab-content" style=" height:600px; overflow-y:scroll;">
                            
                                <div class="tab-pane fade in active martop" id="basic">
                                    
                                        <div class="form-group clearfix">
                                            <label for="cyname" class="col-md-2 control-label text-right nopad">成员姓名：</label>
                                            <div class="col-md-5">
                                                <input type="text" class="form-control" id="uName" placeholder="" name="uName" value="穆文亮">
                                            </div>
                                            <div class="col-md-3 text-danger linhet">已离职</div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label for="sex" class="col-md-2 control-label text-right nopad">性别：</label>
                                            <div class="col-md-5">
                                                <input type="text" class="form-control" id="uSex" placeholder="" name="uSex" value="男">
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">出生年月：</label>
                                            <div class="col-md-5 input-group date form_date">
                                                <input type="date" class="form-control" id="uBirth" value="" name="uBirth">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label for="gh" class="col-md-2 control-label text-right nopad">工号：</label>
                                            <div class="col-md-5">
                                                <input type="text" class="form-control" id="uJobNum" placeholder="" name="uJobNum">
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label for="erpzh" class="col-md-2 control-label text-right nopad">ERP账号：</label>
                                            <div class="col-md-5">
                                                <input type="text" class="form-control" id="uAccount" placeholder="" name="uAccount">
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">部门：</label>
                                            <div class="col-md-5">
                                                <select class="form-control" id="uDepartment_id" name="uDepartment_id">
                                                    <option selected="selected"  value="运维组">九博健康管理有限公司</option>
				                        <%
				                        List<DepartmentBean>  uDepartment_id=(List<DepartmentBean>)request.getAttribute("depart");
				                          for(DepartmentBean bean:dplist){	 
				                        %>
				                          <option value="<%=bean.getName()%>"><%=bean.getName()%></option>
				                        <%
				                           }
				                        %> 
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">职位：</label>
                                            <div class="col-md-5">
                                                <select class="form-control" id="positionId" name="positionId">
                                                    <option value="">超级管理员</option>
                                                    <option value="">技术</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">入职日期：</label>
                                            <div class="col-md-5 input-group date form_date">
                                                <input type="date" class="form-control" value="" id="uEntryDte" name="uEntryDte">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">转正日期：</label>
                                            <div class="col-md-5 input-group date form_date">
                                                <input type="date" class="form-control" value="" id="uPositiveDate" name="uPositiveDate">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                            <div class="col-md-3 text-primary linhet">非转正员工</div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">离职日期：</label>
                                            <div class="col-md-5 input-group date form_date">
                                                <input type="date" class="form-control" value="" id="uResignDate" name="uResignDate">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">离职类型：</label>
                                            <div class="col-md-5">
                                                <select class="form-control" id="uResignType" name="uResignType">
                                                    <option value="">辞退</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">状态：</label>
                                            <div class="col-md-5">
                                                <select class="form-control" id="uState" name="uState">
                                                    <option value="">离职</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">备注：</label>
                                            <div class="col-md-5">
                                                <textarea class="form-control" rows="3" id="uRemark" name="uRemark"></textarea>
                                            </div>
                                        </div>
                                    
                                </div>
                                <!-- 详细信息 -->
                                <div class="tab-pane fade" id="detailed">
                                  
                                    <div class="martop1 clearfix">
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">身份证号码：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" id="uIdNum" name="uIdNum">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">政治面貌：</label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="uPloitical" name="uPloitical">
                                                    <option value="">团员</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">籍贯：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" id="uHomeTown" name="uHomeTown">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">民族：</label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="uNationality" name="uNationality">
                                                    <option value="">汉族</option>
                                                    <option value="">蒙古族</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">户口性质：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" id="uAccountProp" name="uAccountProp">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">户籍所在地：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" id="uDomicile" name="uDomicile">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">婚姻状况：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" id="uMarital" name="uMarital">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">家庭住址：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" id="uHomeAddress" name="uHomeAddress">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">现住址：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" id="uCurrentAddress" name="uCurrentAddress">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="martop1 clearfix">
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">毕业院校：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" id="uSchools" name="uSchools">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">最高学历：</label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="uEducation" name="uEducation">
                                                    <option value="">博士</option>
                                                    <option value="">硕士</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">所学专业：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" id="uProfession" name="uProfession">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">毕业时间：</label>
                                            <div class="col-md-8 input-group date form_date">
                                                <input type="date" class="form-control" value="" id="uGraduation" name="uGraduation">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">是否在学：</label>
                                            <div class="col-md-8">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" id="uAtSchool" name="uAtSchool">是
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    
                                    </div>
					
                                    <div class="martop1 clearfix">
                                        <div class="col12 clearfix">
                                            <div class="form-group col-md-6 clearfix">
                                                <label class="col-md-4 control-label text-right nopad">联系方式：</label>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control" placeholder="" id="uPloitical" name="uPloitical">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">紧急联络人：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" id="uContact" name="uContact">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">紧急联系方式：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" id="uEmergencyContact" name="uEmergencyContact">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="martop1 clearfix">
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">驾龄：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="" id="uDrivingExpe" name="uDrivingExpe">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">驾照类型：</label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="uLicenseType" name="uLicenseType">
                                                    <option value="">无</option>
                                                    <option value="">C1</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                   
                                    <!--</div>-->
                                    <!--</div>-->
                                </div>
                                
                                <!--家庭成员-->
                                <div class="tab-pane fade" id="family">
                                    <div class="col-md-2 col-md-offset-10 clearfix martop">
                                        <button type="button" class="btn btn-warning">添加</button>
                                    </div>
                                    <div class="col-md-12 clearfix nopad addbord martop">
                                        <table class="table table-bordered table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>称谓</th>
                                                    <th>姓名</th>
                                                    <th>出生日期</th>
                                                    <th>工作单位</th>
                                                    <th>职务</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>父亲</td>
                                                    <td>薛小城</td>
                                                    <td>1966-6-6</td>
                                                    <td></td>
                                                    <td>技工</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <!-- 添加家庭成员 -->
                                        <div class="col-md-8 col-md-offset-2">
                                          
                                        </div>
                                    </div>
                                </div>
                                <!--调动记录-->
                                <div class="tab-pane fade" id="record">
                                    <table class="table table-bordered table-responsive">
                                        <thead>
                                            <tr>
                                                <th>原部门</th>
                                                <th>原职位</th>
                                                <th>现部门</th>
                                                <th>现职位</th>
                                                <th>调动类型</th>
                                                <th>调动日期</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>成都运营</td>
                                                <td>外推</td>
                                                <td>成都运营</td>
                                                <td>竞价</td>
                                                <td></td>
                                                <td>2018-12-1</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            
                        </div>
                        <div class="modal-footer">
                            <!--按钮-->
                            <div class="col-md-12">
                                <div class="col-md-8">
                                    <button type="button" class="btn btn-info btn-sm">初始化密码</button>
                                    <button type="button" class="btn btn-info btn-sm">转正</button>
                                    <button type="button" class="btn btn-info btn-sm">恢复</button>
                                    <button type="button" class="btn btn-info btn-sm">删除</button>
                                </div>
                                <button type="button" class="btn btn-info" onclick="uBaseInfo()">确认</button>
                                <button type="button" data-dismiss="modal" class="btn btn-info">返回</button>
                            </div>
                        </div>
                    </div>
                  </form>
                </div>
            </div>
            <!-- 员工信息修改 -->
            <div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog staff_t">
                    <div class="modal-content">
                        <div class="modal-header"><button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
                            <h4 id="myModalLabel" class="modal-title">员工信息修改</h4>
                        </div>
                        <div class="modal-body">
                            <ul class="nav nav-tabs martop">
                                <li class="active"><a href="#updatebasic" data-toggle="tab">基本信息</a></li>
                                <li><a href="#updatedetailed" data-toggle="tab">详细信息</a></li>
                                <li><a href="#updatefamily" data-toggle="tab">家庭成员</a></li>
                                <li><a href="#updaterecord" data-toggle="tab">调动记录</a></li>
                            </ul>
                            <div class="tab-content" style=" height:600px; overflow-y:scroll;">
                                <div class="tab-pane fade in active martop" id="updatebasic">
                                    <form action="">
                                        <div class="form-group clearfix">
                                            <label for="cyname" class="col-md-2 control-label text-right nopad">成员姓名：</label>
                                            <div class="col-md-5">
                                                <input type="text" class="form-control" id="cyname" v-model="updateName">
                                            </div>
                                            <template>
                                                <div class="col-md-3 text-danger linhet" v-if="updateState == 2">已离职</div>
                                            </template>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label for="sex" class="col-md-2 control-label text-right nopad">性别：</label>
                                            <div class="col-md-5">
                                                <input type="text" class="form-control" id="sex">
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">出生年月：</label>
                                            <div class="col-md-5 input-group date form_date">
                                                <input type=" date" class="form-control" v-model="updateBirth">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label for="gh" class="col-md-2 control-label text-right nopad">工号：</label>
                                            <div class="col-md-5">
                                                <input type="text" class="form-control" id="gh" v-model="updateJobNum" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label for="erpzh" class="col-md-2 control-label text-right nopad">ERP账号：</label>
                                            <div class="col-md-5">
                                                <input type="text" class="form-control" id="erpzh" v-model="updateAccount" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">部门：</label>
                                            <div class="col-md-5">
                                                <select class="form-control" v-model="updateDepartment" disabled>
                                                    <template v-for="item in departmentList">
                                                        <option v-bind:value="item.name">{{item.name}}</option>
                                                    </template>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">职位：</label>
                                            <div class="col-md-5">
                                                <select class="form-control" v-model="updatePosition" disabled>
                                                    <option v-bind:value="item.position_Name" v-for="(item, index) in positionList">{{item.position_Name}}</option>
                                                </select>
                                            </div>
                                            <button type="button" class="btn btn-warning">岗位调动</button>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">入职日期：</label>
                                            <div class="col-md-5 input-group date form_date">
                                                <input type="date" class="form-control" v-model="updateEntryDate">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">转正日期：</label>
                                            <div class="col-md-5 input-group date form_date">
                                                <input type="date" class="form-control" v-model="updatePositiveDate">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                            <template>
                                                <div class="col-md-3 text-primary linhet" v-if="updatePositiveDate == ''">非转正员工</div>
                                            </template>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">离职日期：</label>
                                            <div class="col-md-5 input-group date form_date">
                                                <input type="date" class="form-control" v-model="updateResignDate">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">离职类型：</label>
                                            <div class="col-md-5">
                                                <select class="form-control" v-model="updateResignType">
                                                    <option value="辞职">辞职</option>
                                                    <option value="辞退">辞退</option>
                                                    <option value="其他">其他</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">状态：</label>
                                            <div class="col-md-5">
                                                <select class="form-control" v-model="updateState">
                                                    <option value="1">在职</option>
                                                    <option value="2">离职</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label class="col-md-2 control-label text-right nopad">备注：</label>
                                            <div class="col-md-5">
                                                <textarea class="form-control" rows="3"></textarea>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!-- 详细信息 -->
                                <div class="tab-pane fade" id="updatedetailed">
                                    <div class="martop1 clearfix">
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">身份证号码：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" v-model="updateIDNum">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">政治面貌：</label>
                                            <div class="col-md-8">
                                                <select class="form-control" v-model="updatePloitical">
                                                    <option value="团员">团员</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">籍贯：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" v-model="updateHomeTown">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">民族：</label>
                                            <div class="col-md-8">
                                                <select class="form-control" v-model="updateNationality">
                                                    <option v-for="item in nationList" v-bind:value="item.nation">{{item.nation}}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">户口性质：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" v-model="updateAccountProp">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">户籍所在地：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" v-model="updateDomicile">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">婚姻状况：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" v-model="updateMarital">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">家庭住址：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" v-model="updateHomeAddress">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">现住址：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" v-model="updateCurrentAddress">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="martop1 clearfix">
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">毕业院校：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" v-model="updateSchools">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">最高学历：</label>
                                            <div class="col-md-8">
                                                <select class="form-control" v-model="updateEducation">
                                                    <option value="学士">学士</option>
                                                    <option value="博士">博士</option>
                                                    <option value="硕士">硕士</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">所学专业：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" v-model="updateProfession">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">毕业时间：</label>
                                            <div class="col-md-8 input-group date form_date">
                                                <input type="datetime" class="form-control" v-model="updateGraduation">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">是否在学：</label>
                                            <div class="col-md-8">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" v-model="updateAtSchool">是
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="martop1 clearfix">
                                        <div class="col12 clearfix">
                                            <div class="form-group col-md-6 clearfix">
                                                <label class="col-md-4 control-label text-right nopad">联系方式：</label>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control" v-model="updateContact">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">紧急联络人：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" v-model="updateEmergencyContact">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">紧急联系方式：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" v-model="updateEmergencyPhone">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="martop1 clearfix">
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">驾龄：</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" v-model="updateDrivingExpe">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6 clearfix">
                                            <label class="col-md-4 control-label text-right nopad">驾照类型：</label>
                                            <div class="col-md-8">
                                                <select class="form-control" v-model="updateLicenseType">
                                                    <option value="">无</option>
                                                    <option value="">C1</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <!--</div>-->
                                    <!--</div>-->
                                </div>
                                <!--家庭成员-->
                                <div class="tab-pane fade" id="updatefamily">
                                    <div class="col-md-2 col-md-offset-10 clearfix martop">
                                        <button type="button" class="btn btn-warning">添加</button>
                                    </div>
                                    <div class="col-md-12 clearfix nopad addbord martop">
                                        <table class="table table-bordered table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>称谓</th>
                                                    <th>姓名</th>
                                                    <th>出生日期</th>
                                                    <th>工作单位</th>
                                                    <th>职务</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="(item,index) in FamilyNumList" v-on:dblclick="updateEmployeeFamily(item.account_ID)">
                                                    <td>{{item.appellation}}</td>
                                                    <td>{{item.name}}</td>
                                                    <td>{{timeInit(item.birthday)}}</td>
                                                    <td>{{item.workaddress}}</td>
                                                    <td>{{item.position}}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="col-md-8 col-md-offset-2">
                                            <div class="form-group clearfix">
                                                <label class="col-md-3 control-label text-right nopad">称谓：</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" v-model="updateAppellation">
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label class="col-md-3 control-label text-right nopad">姓名：</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" v-model="updateFamilyName">
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label class="col-md-3 control-label text-right nopad">出生日期：</label>
                                                <div class="col-md-6 input-group date form_date">
                                                    <input type="datetime" class="form-control" v-model="updateBirthday">
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label class="col-md-3 control-label text-right nopad">工作单位：</label>
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control" v-model="updateWorkaddress">
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label class="col-md-3 control-label text-right nopad">职务：</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" v-model="updateFamilyPosition">
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label class="col-md-3 control-label text-right nopad">联系电话：</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" v-model="updatePhone">
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label class="col-md-3 control-label text-right nopad">微信：</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" v-model="updateWechat">
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label class="col-md-3 control-label text-right nopad">家庭住址：</label>
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control" v-model="updateAddress">
                                                </div>
                                            </div>
                                            <!--确认添加按钮-->
                                            <div class="col-md-2 col-md-offset-8"><button type="button" class="btn btn-warning" v-on:click="">确认</button></div>
                                            <div class="col-md-2"><button type="button" class="btn btn-warning">取消</button></div>
                                        </div>
                                    </div>
                                </div>
                                <!--调动记录-->
                                <div class="tab-pane fade" id="updaterecord">
                                    <table class="table table-bordered table-responsive">
                                        <thead>
                                            <tr>
                                                <th>原部门</th>
                                                <th>原职位</th>
                                                <th>现部门</th>
                                                <th>现职位</th>
                                                <th>调动类型</th>
                                                <th>调动日期</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>成都运营</td>
                                                <td>外推</td>
                                                <td>成都运营</td>
                                                <td>竞价</td>
                                                <td></td>
                                                <td>2018-12-1</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!--</div>-->
                        </div>
                        <div class="modal-footer">
                            <!--按钮-->
                            <div class="col-md-12">
                                <div class="col-md-8">
                                    <button type="button" class="btn btn-info btn-sm">初始化密码</button>
                                    <button type="button" class="btn btn-info btn-sm">转正</button>
                                    <button type="button" class="btn btn-info btn-sm">恢复</button>
                                    <button type="button" class="btn btn-info btn-sm">删除</button>
                                </div>
                                <button type="button" class="btn btn-info" v-on:click="updateEmployeeInfo">确认</button>
                                <button type="button" data-dismiss="modal" class="btn btn-info">返回</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   
</body>
<script src="<%=path%>/js/jquery.min.js"></script>
<script src="<%=path%>/js/bootstrap.js"></script>
<script src="<%=path%>/vueFile/employee.js"></script>
<script>
        // 使用outerHTML属性获取整个table元素的HTML代码（包括<table>标签），然后包装成一个完整的HTML文档，设置charset为urf-8以防止中文乱码
        var html = "<html><head><meta charset='utf-8' /></head><body>" + document.getElementsByTagId("ryTable")[0].outerHTML + "</body></html>";
        // 实例化一个Blob对象，其构造函数的第一个参数是包含文件内容的数组，第二个参数是包含文件类型属性的对象
        var blob = new Blob([html], { type: "application/vnd.ms-excel" });
        var a = document.getElementsByTagName("a")[0];
        // 利用URL.createObjectURL()方法为a元素生成blob URL
        a.href = URL.createObjectURL(blob);
        // 设置文件名
        a.download = "学生成绩表.xls";
    </script>

<script type="text/javascript">
$("#btn-export").click(function(){
    var exportExcel = "export_excel";
    dataParams[pa] = 1;
    var params = $.param(dataParams);
    var url = host+"&"+params;
    $('<form method="post" action="' + url + '"></form>').appendTo('body').submit().remove();
    delete dataParams[exportExcel];
});

$(document).ready(function () {
	$.ajax({
		type : "POST",
		url : "newDate",
		dataType : "json",
		success : function(data) {
			alert(data)
		},
		error : function(jqXHR) {
			$("#test").html("发生错误:" + jqXHR.status);
		}
	});
});

function fm_info()
{
	var empName = $("#empName").val();
	var chName = $("#chName").val();
	var shBirth = $("#shBirth option:selected").val();
	$.ajax({
		type : "POST",
		url : "fmList",
		data : {
			empName: empName,
			chName:chName,
			shBirth:shBirth,
		},//获取表单值
		dataType : "json",
		success : function(data) {
			$("#fmLists  tr:not(:first)").empty("");//清空表格
			for (var i = 0; i < data.length; i++) {
				var tbBody = "";
				  tbBody += "<tr><td>"+data[i].jobnum+"</td>"
						+"<td>"+data[i].name+"</td>"
						+"<td>"+data[i].appellation+"</td>"
						+"<td>"+data[i].chname+"</td>"
						+"<td>"+data[i].birth+"</td>"
						+"<td>"+data[i].workadress+"</td>"
						+"<td>"+data[i].position+"</td>"
						+"<td>"+data[i].phone+"</td>"
						+"<td>"+data[i].wechat+"</td>"
						+"<td>"+data[i].famAddress+"</td></tr>";
				            $("#fmLists").append(tbBody); 
			}
			
		},
		error : function(jqXHR) {
			$("#test").html("发生错误:" + jqXHR.status);
		}
	});
}
function uBaseInfo()
{
	
	var uName = $("#uName").val();
	var uSex = $("#uSex").val();
	var uDepartment_id = $("#uDepartment_id").val();
	
	var uJobNum=$("#uJobNum").val();
	var uBirth=$("#uBirth").val();
	var positionId=$("#positionId option:selected").val();
	var uEntryDte=$("#uEntryDte").val();
	var uPositiveDate=$("#uPositiveDate").val();
	var uResignDate=$("#uResignDate").val();
	var uPhoto=$("#uPhoto").val();
	var uIsDelete=$("#uIsDelete").val();
	var uState=$("#uState option:selected").val();
	var uAccount=$("#uAccount").val();
	var uParent_ID=$("#uParent_ID").val();
	var uResignType=$("#uResignType option:selected").val();
	var uResignReason=$("#uResignReason").val();
	//相同参数
	var uCreateDate=$("#uCreateDate").val();
	var uUpdateDate=$("#uUpdateDate").val();
	var uCreateUser=$("#uCreateUser").val();
	var uRemark=$("#uRemark").val();
	
	//详细信息
	var uEmployeeBasicID=$("#uEmployeeBasicID").val();
	var uIdNum=$("#uIdNum").val();
	var uPloitical=$("#uPloitical").val();
	var uContact=$("#uContact").val();
	var uHomeTown=$("#uHomeTown").val();
	var uNationality=$("#uNationality").val();
	var uMarital=$("#uMarital").val();
	var uHomeAddress=$("#uHomeAddress").val();
	var uCurrentAddress=$("#uCurrentAddress").val();
	var uSchools=$("#uSchools").val();
	var uEducation=$("#uProfession").val();
	var uProfession=$("#uRemark").val();
	var uGraduation=$("#uGraduation").val();
	var uEmergencyContact=$("#uEmergencyContact").val();
	var uEmergencyphone=$("#uEmergencyphone").val();
	var uBloodType=$("#uBloodType").val();
	var uLicenseType=$("#uLicenseType").val();
	var uDrivingExpe=$("#uDrivingExpe").val();
	var uDomicile=$("#uDomicile").val();
	var uAccountProp=$("#uAccountProp").val();
	var uAtSchool=$("#uAtSchool").val();
	
	
	$.ajax({
		type : "POST",
		url : "uBaseInfo",
		data : {
			uName: uName,
			uSex:uSex,
			uDepartment_id:uDepartment_id,
			uJobNum:uJobNum,
			uBirth:uBirth,
			positionId:positionId,
			uEntryDte:uEntryDte,
			uPositiveDate:uPositiveDate,
			uResignDate:uResignDate,
			uPhoto:uPhoto,
			uIsDelete:uIsDelete,
			uState:uState,
			uAccount:uAccount,
			uParent_ID:uParent_ID,
			uResignType:uResignType,
			uResignReason:uResignReason,
			uCreateDate:uCreateDate,
			uUpdateDate:uUpdateDate,
			uCreateUser:uCreateUser,
			uRemark:uRemark,
			uEmployeeBasicID:uEmployeeBasicID,
			uIdNum:uIdNum,
			uPloitical:uPloitical,
			uContact:uContact,
			uHomeTown:uHomeTown,
			uNationality:uNationality,
			uMarital:uMarital,
			uHomeAddress:uHomeAddress,
			uCurrentAddress:uCurrentAddress,
			uSchools:uSchools,
			uEducation:uEducation,
			uProfession:uProfession,
			uGraduation:uGraduation,
			uEmergencyContact:uEmergencyContact,
			uEmergencyphone:uEmergencyphone,
			uBloodType:uBloodType,
			uLicenseType:uLicenseType,
			uDrivingExpe:uDrivingExpe,
			uDomicile:uDomicile,
			uAccountProp:uAccountProp,
			uAtSchool:uAtSchool,
			
		},//获取表单值
		dataType : "json",
		success : function(data) {
			alert(data[0])
		
		},
		error : function(jqXHR) {
			$("#test").html("发生错误:" + jqXHR.status);
		}
	});
}




</script>
</html>