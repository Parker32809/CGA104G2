<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mail.model.*"%>

<%
MailVO mailVO = (MailVO) request.getAttribute("mailVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
<%-- --<%= mailVO==null %>--${mailVO.deptno}-- --%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>���u��ƭק� - update_mail_input.jsp</title>

<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
table#table-2{
	white-space:nowrap;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}
input{ 
 	width:150px; 
} 
table, th, td {
	border: 1px solid #CCCCFF;
	
}

th, td {
	padding: 1px;
	
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>���u��ƭק� - update_mail_input.jsp</h3>
			</td>
		</tr>
	</table>

	<h3>��ƭק�:</h3>

<!-- 	���~��C -->
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="mail.do" name="form1">
		<table id='table-2'>
			<tr>
				<td>�l��s��:</td>
				<td><input type="TEXT" name="mailId" size="45" value="<%=mailVO.getMailId()%>" /></td>
			</tr>
			
			<tr>
				<td>���s��:</td>
				<td><input type="TEXT" name="memberId" size="45" value="<%=mailVO.getMemberId()%>" /></td>
			</tr>

			<tr>
				<td>�l�󶵥�:</td>
				<td><input type="TEXT" name="mailType" size="45" value="<%=mailVO.getMailType()%>" /></td>
			</tr>

			<tr>
				<td>�l���F�ɶ�:</td>
				<td><input type="TEXT" id=mailDelTime name="mailDelTime" value='<%=mailVO.getMailDelTime()%>'></td>
			</tr>
			
			<tr>
				<td>�l����f���:</td>
				<td><input type="TEXT" id=mailPickupTime name="mailPickupTime" value='<%=(mailVO.getMailPickupTime() == null)? "" : mailVO.getMailPickupTime()%>'></td>
			</tr>
			
			<tr>
				<td>�l�󪬺A:</td>
				<td><input type="TEXT" name="mailState" size="45" value='<%=mailVO.getMailState()%>'></td>
			</tr>
		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="member_Id" value="<%=mailVO.getMemberId()%>">
		<button type="submit" value="�e�X�ק�">�e�X�ק�</button>
	</FORM>
</body>
<% 
  java.sql.Date mailDelTime = null;
  try {
	  mailDelTime = mailVO.getMailDelTime();
   } catch (Exception e) {
	   mailDelTime = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
//===========================================���~�P�_==========================================
	
	
//===========================================���=============================================
        $.datetimepicker.setLocale('zh');
        $('#mailDelTime').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=mailDelTime%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });

        $.datetimepicker.setLocale('zh');
        $('#mailPickupTime').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
</script>



</html>