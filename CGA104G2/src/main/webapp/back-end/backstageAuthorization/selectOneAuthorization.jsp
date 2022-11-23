<%@page import="com.backstageAuthorization.model.*"%>
<%@page import="com.backstageAccount.model.*"%>
<%@page import="com.backstageCapabilities.model.*"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
BackstageAuthorizationService backstageAuthorizationSvc2 = new BackstageAuthorizationService();
List<BackstageAuthorizationVO> list3 = backstageAuthorizationSvc2.getBmIdAndBmName();
pageContext.setAttribute("list3", list3);

Integer bmId = (Integer)request.getAttribute("bmId");
BackstageAuthorizationService backstageAuthorizationSvc3 = new BackstageAuthorizationService();
List<BackstageAuthorizationVO> list4 = backstageAuthorizationSvc3.getSelectedAuthorization(bmId);
pageContext.setAttribute("list4", list4);

BackstageAuthorizationService test = new BackstageAuthorizationService();
BackstageAuthorizationVO backstageAuthorizationVO = test.getOneBmName(bmId);
pageContext.setAttribute("backstageAuthorizationVO", backstageAuthorizationVO);
%>
<html>
<head>
<meta charset="UTF-8">
<title>個人權限功能</title>
</head>
<body bgcolor="lightYellow">

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.do">
		<div>
			<input type="hidden" name="action" value="BackstageLogOut"> <input
				type="submit" value="登出" style="float: right">
		</div>
	</form>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/backstageAuthorization/listAllAuthorization.jsp">
		<div>
			<input type="submit" value="返回上一頁">
		</div>
	</form>

	<table id="backstageInfo" border="2">
		<tr>
			<h4>
				<a
					href="<%=request.getContextPath()%>/back-end/backstageAccount/backstageIndex.jsp">回首頁</a>
			</h4>

			<ul>

				<li>
					<FORM METHOD="get"
						ACTION="<%=request.getContextPath()%>/back-end/backstageAuthorization/BackstageAuthorization.do">
						<b>選擇管理員姓名:</b> <select name="selectedBmId">
						
							<c:forEach var="backstageAuthorizationVO" items="${list3}">
								<option value="${backstageAuthorizationVO.bmId}"
								<c:if test="${backstageAuthorizationVO.bmId == selectedBmId}">selected</c:if>>${backstageAuthorizationVO.bmName}
								</option>
							</c:forEach>
						</select> 
						
						<input type="hidden" name="action" value="selectOneAuthorization"> <input
							type="submit" value="送出">
					</FORM>
				</li>

			</ul>
			<caption>
				<h2>所有管理員權限功能</h2>
				<div>
					<FORM METHOD="get"
						ACTION="<%=request.getContextPath()%>/back-end/backstageAuthorization/addAuthorization.jsp"
						style="margin-bottom: 0px;">
						<input type="submit" value="新增權限" style="float: right"> <input
							type="hidden" name="action" value="insert">
					</FORM>
				</div>
			</caption>
		</tr>
		<c:forEach var="backstageAuthorizationVO" items="${list4}">

			<tr>
				<th>管理員編號</th>
				<th>管理員姓名</th>
				<th>權限功能編號</th>
				<th>權限功能名稱</th>
				<th>權限功能內容</th>
				<th>刪除</th>

			</tr>
			<tr>
				<th>${backstageAuthorizationVO.bmId}</th>
				<th>${backstageAuthorizationVO.bmName}</th>
				<th>${backstageAuthorizationVO.bmCapabilitiesId}</th>
				<th>${backstageAuthorizationVO.bmCapabilitiesName}</th>
				<th>${backstageAuthorizationVO.bmCapabilitiesContent}</th>
				<td>
					<FORM METHOD="get"
						ACTION="<%=request.getContextPath()%>/back-end/backstageAuthorization/BackstageAuthorization.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="bmId" value="${backstageAuthorizationVO.bmId}"> <input
							type="hidden" name="bmCapabilitiesId"
							value="${backstageAuthorizationVO.bmCapabilitiesId}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>