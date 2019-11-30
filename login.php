<?php
	/*Creates 2 cookies for later retrieval
	Might need functions to verify credentials if
		we're that ambitious
	Otherwise, we don't need to connect to database here*/
	require("dbconnect.php");
	setcookie("store", $_POST['s_ID'], time()+(86400*30), "/");
	setcookie("employee", $POST['e_ID'], time()+(86400*30), "/");
	header("Location: landing.html");
?>
