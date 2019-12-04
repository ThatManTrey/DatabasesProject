<?php
	/*Contains all functions for performing queries*/
	function showInventory($conn, $store)
	{
		$sql = "SELECT SKU, p_name, p_type, price, p_size, no_item FROM inventory NATURAL JOIN products WHERE storenum = ?";
		$statement = $conn->prepare($sql);
		$statement->bind_param("i", $store);
		$statement->execute();

		$result = $statement->get_result();
		
		if ($result->num_rows > 0) {
			
			echo "<br><h3>Inventory for store ".$store."<h3><br>";
			
			echo '<table border>';
			echo '<thead><tr>';
			echo '<th>SKU</th><th>Name</th><th>Type</th><th>Price</th><th>p_size</th><th>no_item</th>';
			echo '</tr></thead>';
			echo '<tbody>';

			while($row = $result->fetch_assoc()) {
				echo '<tr>';
				echo "<td>".$row["SKU"]."</td>";
				echo "<td>".$row["p_name"]."</td>";
				echo "<td>".$row["p_type"]."</td>";
				echo "<td>".$row["price"]."</td>";
				echo "<td>".$row["p_size"]."</td>";
				echo "<td>".$row["no_item"]."</td>";
				echo '</tr>';
			}
			
			echo '</tbody>';
			echo '</table>';
		} 
		else {
			echo "0 results";
		}
	}
	
	function showOrders($conn, $store)
	{
		$sql = "SELECT ordernum, dist_ID, SKU, no_item FROM orders NATURAL JOIN order_amount WHERE storenum = ?";
		$statement = $conn->prepare($sql);
		$statement->bind_param("i", $store);
		$statement->execute();

		$result = $statement->get_result();
		
		if ($result->num_rows > 0) {
			
			echo "<br><h3>Orders for store ".$store."<h3><br>";
			
			echo '<table border>';
			echo '<thead><tr>';
			echo '<th>ordernum</th><th>dist_ID</th><th>SKU</th><th>no_item</th>';
			echo '</tr></thead>';
			echo '<tbody>';

			while($row = $result->fetch_assoc()) {
				echo '<tr>';
				echo "<td>".$row["ordernum"]."</td>";
				echo "<td>".$row["dist_ID"]."</td>";
				echo "<td>".$row["SKU"]."</td>";
				echo "<td>".$row["no_item"]."</td>";
				echo '</tr>';
			}
			
			echo '</tbody>';
			echo '</table>';
		} 
		else {
			echo "0 results";
		}
	}
	
	function makeOrderItem($conn, $store, $order, $d_id, $sku, $amnt)
	{
		if ($order=='none')
		{
			do
			{
				$order = rand(00000,99999);
				$sql = "SELECT COUNT(1) FROM orders WHERE ordernum = '".$order."'";
				$result = $conn->query($sql);
			} while ($result == "1");
			$sql = "INSERT INTO orders VALUES (".$order.",".$d_id.",".$store.")";
			$conn->query($sql);
		}
		$sql = "INSERT INTO order_amount VALUES (".$order.",".$sku.",".$amnt.")";
		$conn->query($sql);
	}
?>
