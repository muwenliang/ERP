<%@page import="com.jiubo.erp.rygl.vo.QueryFamilyResult"%>
<%@page import="com.jiubo.erp.rygl.vo.QueryResult"%>
<%@page import="com.jiubo.erp.rygl.bean.DepartmentBean"%>
<%@page import="com.jiubo.erp.rygl.bean.ProjectDataBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<!--   <meta charset="UTF-8"> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
<link rel="stylesheet" href="<%=path%>/css/employee.css">
<link rel="stylesheet" href="<%=path%>/js/vue.min.js">
<link rel="stylesheet" href="<%=path%>/js/vue.js">
<script src="<%=path%>/js/jquery.min.js"></script>
<script src="<%=path%>/js/bootstrap.js"></script>
<script src="<%=path%>/js/employee.js"></script>
<title>hello</title>
</head>
<body>
	<div>
		<form id="ryForm" action="search/export" method="post">
			<table>
				<tr>
					<td colspan="2" align="center"><input type="button"
						onclick="textMothod" value="导出到Excel1" /> <input
						type="button" onclick="exportExcel1(2)" value="导出到Excel2" /></td>
				</tr>
			</table>
		</form>
	</div>

</body>
<script type="text/javascript">
	function textMothod() {
		$.ajax({
			
			type : "POST",
			url : "/kqgl/departKQList",
			data : $('#ryForm').serialize(),//获取表单值
			dataType : "json",
			success : function(data) {
				alert(data)

			},
			error : function(jqXHR) {
				$("#test").html("发生错误:" + jqXHR.status);
			}
		})

	}

	$("#btn-export").click(
			function() {
				var exportExcel = "export_excel";
				dataParams[exportExcel] = 1;
				var params = $.param(dataParams);
				var url = "search/export" + "&" + params;
				$('<form method="post" action="' + url + '"></form>').appendTo(
						'body').submit().remove();
				delete dataParams[exportExcel];
			});
	function exportExcel1(index) {
		var index = 1;

		window.location.href = "${pageContext.request.contextPath}/search/export?index="
				+ index;
	}
	function exportExcel(index) {
		$.ajax({
			type : "POST",
			url : "kqgl/departKQList",
			data : $('#ryForm').serialize(),//获取表单值
			dataType : "json",
			success : function(data) {
				alert(data)

			},
			error : function(jqXHR) {
				$("#test").html("发生错误:" + jqXHR.status);
			}
		})

	}

	/* $(document).ready(function () {
	 $.ajax({
	 type : "POST",
	 url : "search/ryAllList",
	 data :$('#ryForm').serialize(),//获取表单值
	 dataType : "json",
	 success : function(data) {
	 for (var i = 0; i < 3; i++) {
	 var id = data[i].id;
	 var name = data[i].name;
	 var tbBody = "";
	   tbBody += "<tr><td>"+data[i].id+"</td>"
	 +"<td>"+data[i].name+"</td></tr>";
	             $("#datas").append(tbBody); 
	 alert(id+"-"+name);
	 }
	
	 },
	 error : function(jqXHR) {
	 $("#test").html("发生错误:" + jqXHR.status);
	 }
	 });
	 $.ajax({
	 type : "GET",
	 url : "search/newDate",
	 dataType : "json",
	 success : function(data) {
	 alert(data)
	 },
	 error : function(jqXHR) {
	 $("#test").html("发生错误:" + jqXHR.status);
	 }
	 });
	 }); */
	function checkWorkers() {
		var state = "1";
		var projectId = "1";
		var departName = "";

		$.ajax({
			type : "POST",
			url : "search/ryAllList",
			data : {
				"state" : state,
				"projectId" : projectId,
				"departName" : departName
			},
			dataType : "json",
			success : function(data) {
				alert(data);
				for (var i = 0; i < data.length; i++) {
					var id = data[i].id;
					var name = data[i].name;
					alert(id + name);
				}
				$("#test").html("验证未通过:" + data.msg);
			},
			error : function(jqXHR) {
				$("#test").html("发生错误:" + jqXHR.status);
			}
		});
	};
	function postBtn() {
		$.ajax({
			type : "POST",
			url : "search/ryAllList",
			data : {
				username : $("#username").val(),
				password : $("#password").val(),
			},
			dataType : "json",
			success : function(data) {
				alert(data);
				$("#test").html("验证未通过:" + data.msg);
			},
			error : function(jqXHR) {
				$("#test").html("发生错误:" + jqXHR.status);
			}
		});
	};
	/*$.each(data,function(i,result){
	alert(result.id);
	item="<tr><td>"+result['id']+"</td><td>"
	+result['JobNum']+"</td><td>"
	+result['name']+"</td><td>"
	+result['sex']+"</td><td>"
	+result['departName']+"</td><td>"
	+result['postionName']+"</td><td>"
	+result['ERPAaccount']+"</td><td>"
	+result['birth']+"</td><td>"
	+result['entryData']+"</td><td>"
	+result['PositiveDate']+"</td><td>"
	+result['ResignDate']+"</td><td>"
	+result['State']+"</td><td>";
	$('.ry_table').append(item);
	)};
	//标准post请求，对象解析
	function postBtn() {
	$.ajax({
		type : "POST",
		url : "search/ryAllList",
		data : {
			username : $("#username").val(),
			password : $("#password").val(),
		},
		dataType : "json",
		success : function(data) {
			alert(data);
			$("#test").html("验证未通过:" + data.msg);
		},
		error : function(jqXHR) {
			$("#test").html("发生错误:" + jqXHR.status);
		}
	});
	};*/
</script>

</html>