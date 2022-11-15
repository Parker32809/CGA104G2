<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Mail: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>IBM Mail: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Mail: Home</p>

<h3>��Ƭd��:</h3>
	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllMail.jsp'>List</a> all Mails.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="mail.do" >
        <b>��J���s�� (�p1):</b>
        <input type="text" name="member_Id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="mailSvc" scope="page" class="com.mail.model.MailService" />
 
</ul>


<h3>���u�޲z</h3>

<ul>
  <li><a href='addMail.jsp'>Add</a> a new MaiL.</li>
</ul>

</body>
</html>