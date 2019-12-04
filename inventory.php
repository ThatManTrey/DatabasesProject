<!DOCTYPE html>
<html>
<body>

<h1>Store Inventory</h1>

<?php
	require("dbconnect.php");
	require("queryfunx.php");
	showInventory($conn, $_COOKIE["store"]);
?>

<a href="landing.html">Home</a>

</body>
</html>
