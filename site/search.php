<!DOCTYPE html>
<html>
<body>

<h1>Search Results</h1>

<?php
	require("dbconnect.php");
	require("queryfunx.php");
	showSearch($conn, $_COOKIE["store"], $_GET['sku']);
?>

<a href="landing.html">Home</a>

</body>
</html>