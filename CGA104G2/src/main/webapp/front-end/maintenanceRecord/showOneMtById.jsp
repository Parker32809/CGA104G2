<%@page import="com.maintenanceRecord.model.*"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.getAttribute("maintenanceRecordVO");
%>

<html>
<head>
<style>
#header {
	border: 2px solid black;
	border-collapse: collapse;
}

table, tr, th, td {
	border: 2px solid black;
}

form {
	margin: 0px;
	display: inline;
	padding: 10px;
}
</style>
<meta charset="UTF-8">
<title>我的公設維修頁面</title>
</head>

<body>

	<div id="header">
		<h1 id="test">您好，這裡是公設維修頁面！</h1>
	</div>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/maintenanceRecord/maintenanceRecordServlet.do">
		<b>請選擇: </b> <select name="maintenanceStatus">
			<option value="1"
				${(maintenanceRecordVO.maintenanceStatus == 1) ? 'selected' : '' }>瀏覽已完成維修</option>
			<option value="0"
				${(maintenanceRecordVO.maintenanceStatus == 0) ? 'selected' : '' }>瀏覽未完成維修</option>
		</select> <input type="hidden" name="action" value="getAllSelected"> <input
			type="submit" value="確定">
	</form>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/maintenanceRecord/maintenanceRecordServlet.do">
		<b> 依表單編號查詢: </b><input type="text" name="maintenanceId"> <input
			type="hidden" name="memberAc" value="EreYea1"> <input
			type="hidden" name="action" value="getOneMtById2"> <input
			type="submit" value="送出">
	</form>

	<a
		href="<%=request.getContextPath()%>/front-end/maintenanceRecord/showMt.jsp">
		<button>返回所有維修列表</button>
	</a>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/maintenanceRecord/maintenanceRecordServlet.do">
		<input type="hidden" name="action" value="toMaintain"><input
			type="hidden" name="memberAc" value="EreYea1"> <input
			type="submit" value="我要提報維修" style="width: 100px; height: 50px;">
	</form>

	<div id='select'>
		<table id="MtTable" style='border: 1px solid black'>
			<caption>
				<h2>我的所有維修列表</h2>
			</caption>
			<tr>
				<th>編號</th>
				<th>住戶名稱</th>
				<th>時間</th>
				<th>表單內容</th>
				<th>內容附圖</th>
				<th>狀態</th>
				<th>回覆內容</th>
				<th>回覆內容附圖</th>
				<th>回覆時間</th>
			</tr>
			<tr>
				<td>${maintenanceRecordVO.maintenanceId}</td>
				<td>${maintenanceRecordVO.memberName}</td>
				<td>${maintenanceRecordVO.maintenanceTime}</td>
				<td>${maintenanceRecordVO.maintenanceContent}</td>
				<c:choose>
					<c:when test="${empty maintenanceRecordVO.maintenancePic}">
						<td>無附圖</td>
					</c:when>
					<c:otherwise>
						<td><img
							src="<%=request.getContextPath()%>/back-end/maintenanceRecord/maintenancePicServlet.do?action=showMemberPic&maintenanceId=${maintenanceRecordVO.maintenanceId}"
							width="100px" /></td>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${maintenanceRecordVO.maintenanceStatus == 1}">
						<td>已結案</td>
					</c:when>
					<c:otherwise>
						<td>未結案</td>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${empty maintenanceRecordVO.replyOfMaintenance}">
						<td><font color="red"><b>管理員尚未回覆!</b></td>
					</c:when>
					<c:otherwise>
						<td>${maintenanceRecordVO.replyOfMaintenance}</td>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when
						test="${(empty maintenanceRecordVO.replyPic) and maintenanceRecordVO.maintenanceStatus == 0}">
						<td><font color="red"><b>管理員尚未回覆!</b></td>
					</c:when>
					<c:when
						test="${(empty maintenanceRecordVO.replyPic) and maintenanceRecordVO.maintenanceStatus == 1}">
						<td>無附圖</td>
					</c:when>
					<c:otherwise>
						<td><img
							src="<%=request.getContextPath()%>/back-end/maintenanceRecord/maintenancePicServlet.do?action=showPic&maintenanceId=${maintenanceRecordVO.maintenanceId}"
							width="300px" /></td>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when
						test="${(empty maintenanceRecordVO.replyOfMaintenanceTime) and maintenanceRecordVO.maintenanceStatus == 0}">
						<td><font color="red"><b>管理員尚未回覆!</b></td>
					</c:when>
					<c:otherwise>
						<td>${maintenanceRecordVO.replyOfMaintenanceTime}</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
	</div>

</body>

</html>