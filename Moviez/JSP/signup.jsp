<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
</head>
<body>
<form action="signupdata" method="post">
<div class="register">
<c:if test="${not empty error}">
   <p>${error}</p>
</c:if>
Email<br><input type="email" name="email" required placeholder="example@gmail.com"><br>
First Name<br><input type="text" name="first_name" required placeholder="riya"><br>
Last Name<br><input type="text" name="last_name"><br>
Mobile<br><input type="tel" name="mobile" required placeholder="908*****09"><br>
Password<br><input type="password" name="password" required><br>
<button>Submit</button>
</div>
</form>
</body>
</html>
