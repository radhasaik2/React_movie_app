<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile</title>
</head>
<body>
<form action="profile">
<h1>Welcome to Your Profile</h1>
<c:if test="${not empty error}">
    <p>${error}</p>
</c:if>
<c:if test="${not empty user}">
    <p>User ID: ${user.sid}</p>
    <p>Email: ${user.email}</p>
    <p>First Name: ${user.first_name}</p>
    <p>Last Name: ${user.last_name}</p>
    <p>Mobile: ${user.mobile}</p>
</c:if>
</form>
<a href="/">Index</a>
</body>
</html>
