<!DOCTYPE html>
<html>

   <head>
      <title>Add New item into the inventory</title>
   </head>

<?php
	  
	require("queryfunx.php"); 
	require("dbconnect.php");            
        
	$storenum = $_COOKIE['store'];
	$SKU = $_GET['SKU'];
	$no_item = $_GET['no_item'];
			
	echo " <br> Inventory before adding to it<br>";
	showInventory($conn, $storenum);
   
    $sql = "INSERT INTO Inventory "."(storenum,SKU, no_item) "."VALUES ".
               "('$storenum','$SKU','$no_item')";
            
    $retval = mysqli_query($conn, $sql); // procedural execution of query
         
    if(! $retval ) {
        die('Could not enter data: ' . mysqli_error($conn));
    }
         
    echo "Entered data successfully\n";
			
	echo " <br>  Inventory after adding to it<br>";
	showInventory($conn, $storenum);
			
    mysqli_close($conn);

?>

<a href="landing.html">Home</a>
   </div>
</body>
</html>
