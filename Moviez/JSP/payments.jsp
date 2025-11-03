<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>Payment</title></head>
<body>
<h3>Payment</h3>
Card: <input type="text" value="4111 1111 1111 1111"><br>
Expiry: <input type="text" value="12/25"><br>
CVV: <input type="text" value="123"><br>
<button onclick="pay()">Pay ₹200</button>

<script>
function pay() {
    alert("Payment Completed!");
    window.location.href = "index.jsp";
}
</script>
</body>
</html>
