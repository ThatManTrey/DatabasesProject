<?php
	require("dbconnect.php");
	setcookie("store", $_POST['s_ID'], time()+(86400*30), "/");
	setcookie("employee", $POST['e_ID'], time()+(86400*30), "/");
	header("Location: landing.html");
?>
