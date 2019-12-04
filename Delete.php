<!DOCTYPE html>
<html>
 
   <head>
      <title>Delete an item from an inventory</title>
   </head>
 
   <body>
   <div>
 
<?php
     
    require("dbconnect.php");
    require("queryfunx.php");            
       
 
    $storenum = $_COOKIE['store'];
	$SKU = $_GET['SKU'];
 
           
    echo " <br> Inventory before deletion <br>";
    showInventory($conn, $storenum);
   
    $sql = "DELETE FROM inventory WHERE storenum = $storenum AND SKU = $SKU";
           
            //mysqli_select_db($conn,'university');
    $retval = mysqli_query($conn, $sql); // procedural execution of query
         
    if(! $retval ) {
        die('Could not enter data: ' . mysqli_error($conn));
    }
         
    echo "Entered data successfully\n";
           
    echo " <br> Inventory after deletion <br>";
    showInventory($conn, $storenum);
           
    mysqli_close($conn);    
 
?>
<a href="landing.html">Home</a>
</body>
</html>
