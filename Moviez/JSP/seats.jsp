<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seats</title>
<style>
.seat {
width: 30px; 
height: 30px; 
margin: 2px; 
border: 1px solid black; 
display: inline-block; 
text-align: center; 
cursor: pointer;
}
</style>
</head>
<body>
<h2>Select Your Seats</h2>

<form action="seats" method="post">
<input type="hidden" id="selectedseat" name="selectedseat">
<% 
String[] rows = {"A", "B", "C"};
for(String row : rows) {
out.print("<div class='Row'>"+row+" ");
for(int i=1; i<=10; i++) {
String seatId = row + i;
out.print("<span class='seat' onclick='selectseat(\"" + seatId + "\")'>" + i + "</span>");
}
out.print("</div>");
}
%><br>
<div>Selected: <span id="display">None</span></div><br>	
</form>
<a href="payments" id="paymentLink" style="display:none;">Proceed to Payment</a>
<script>
let selectedseat = [];
function selectseat(seatId) {
const seat = event.target;
const index = selectedseat.indexOf(seatId);
if(index === -1) {
selectedseat.push(seatId);
seat.classList.add('selected');
} else {
selectedseat.splice(index, 1);
seat.classList.remove('selected');
}
document.getElementById('selectedseat').value = selectedseat.join(',');
document.getElementById('display').textContent = selectedseat.join(', ') || 'None';
document.getElementById('paymentLink').style.display = selectedseat.length > 0 ? 'inline' : 'none';
}
</script>
</body>
</html>
