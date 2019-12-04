<!DOCTYPE html>
<html>
 
   <head>
      <title>Delete an item from an inventory</title>
   </head>
 
   <body>
   <div>
 
<?php
     
    require("tableshow.php");
    require("queryfunx.php");            
       
 
    $storenum = $_POST['storenum'];
	$SKU = $_POST['SKU'];
 
           
    echo " <br> Inventory before deletion <br>";
    showInventory($conn, $store);
   
    $sql = "DELETE FROM inventory WHERE storenum = $storenum AND SKU = $SKU";
           
            //mysqli_select_db($conn,'university');
    $retval = mysqli_query($conn, $sql); // procedural execution of query
         
    if(! $retval ) {
        die('Could not enter data: ' . mysqli_error($conn));
    }
         
    echo "Entered data successfully\n";
           
    echo " <br> Inventory after deletion <br>";
    showInventory($conn, $store);
           
    mysqli_close($conn);    
 
?>
   <hr width="50">
<a href="Frontpage.html" style="color:red;font-weight:bold;">Home</a>
<hr width="50">
   </div>
</body>
</html>
