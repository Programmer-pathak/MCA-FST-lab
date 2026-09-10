<%@ page language="java" %>
<html>
<head>
<title>User Details</title>
</head>
<body>
<%
String name=request.getParameter("username");
String age=request.getParameter("age");
String dept=request.getParameter("department");
%>
<h2>User Information</h2>

Name : <%=name%><br><br>
Age : <%=age%><br><br>
Department : <%=dept%>
</body>
</html>
