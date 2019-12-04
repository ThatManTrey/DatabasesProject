<!DOCTYPE html>
<html>

   <head>
      <title>Add New item into the inventory</title>
   </head>

<?php
	  
	require("queryfunx.php"); 
	require("dbconnect.php");            
        
  $storenum = $_POST['storenum'];
  $SKU = $_POST['SKU'];
	$no_item = $_POST['no_item'];
			
	echo " <br> Inventory before adding to it<br>";
	showInventory($conn, $store);
   
    $sql = "INSERT INTO Inventory "."(storenum,SKU, no_item) "."VALUES ".
               "('$storenum','$SKU','$no_item')";
            
    $retval = mysqli_query($conn, $sql); // procedural execution of query
         
    if(! $retval ) {
        die('Could not enter data: ' . mysqli_error($conn));
    }
         
    echo "Entered data successfully\n";
			
	echo " <br>  Inventory after adding to it<br>";
	showInventory($conn, $store);
			
    mysqli_close($conn);    

?>
   <hr width="50">
<a href="Frontpage.html" style="color:red;font-weight:bold;">Home</a>
<hr width="50">
   </div>
</body>
</html>
