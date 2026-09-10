<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Welcome Page</title>
</head>
<body>
<%
    String username = request.getParameter("uname");
    session.setAttribute("user", username);
%>
<h2>Login Successful</h2>
Welcome,
<b>
<%= session.getAttribute("user") %>
</b>
</body>
</html>
