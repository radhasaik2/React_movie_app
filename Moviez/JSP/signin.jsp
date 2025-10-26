<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="signindata" method="post">
<c:if test="${not empty error}">
   <p>${error}</p>
</c:if>
Email<br><input type="email" name="email" required placeholder="example@gmail.com"><br>
Password<br><input type="password" name="password" required><br>
<button>Login</button>
</form>
</body>
</html>
