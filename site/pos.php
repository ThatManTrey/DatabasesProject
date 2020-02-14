<!DOCTYPE html>
<html>
<body>

<h1>Point of Sale</h1>

<?php
	require("dbconnect.php");
	require("queryfunx.php");
	
	sellItem($conn, $_COOKIE["store"], $_GET["SKU"]);
	showInventory($conn, $_COOKIE["store"]);
	
?>

<a href="landing.html">Home</a>

</body>
</html>