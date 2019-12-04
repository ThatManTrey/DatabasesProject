<!DOCTYPE html>
<html>
<body>

<h1>Order from Distributor</h1>

<?php
	require("dbconnect.php");
	require("queryfunx.php");
	showOrders($conn, $_COOKIE["store"]);
	
	makeOrderItem($conn, $_COOKIE["store"], $_GET["order"], $_GET["d_id"], $_GET["sku"], $_GET["amnt"]);
	
	showOrders($conn, $_COOKIE["store"]);
?>

<a href="landing.html">Home</a>

</body>
</html>