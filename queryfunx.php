<?php
	/*Contains all functions for performing queries*/
	function showInventory($conn, $store)
	{
		$sql = "SELECT SKU, p_name, p_type, price, p_size, no_item FROM inventory NATURAL JOIN product WHERE storenum = ?";
		$statement = $conn->prepare($sql);
		$statement->bind_param("i", $store);
		$statement->execute();

		$result = $statement->get_result();
		
		if ($result->num_rows > 0) {
			
			echo "<br><h3>Inventory<h3> <br>";
			
			echo '<table border>';
			echo '<thead><tr>';
			echo '<th>'."SKU".'</th>'.'<th>'."Name".'</th>'.'<th>'."Type".'</th>'.'<th>'."Price".'</th>'.'<th>'."p_size".'</th>'.'<th>'."no_item".'</th>';
			echo '</tr></thead>';
			echo '<tbody>';

			while($row = $result->fetch_assoc()) {
				echo '<tr>';
				echo "<td>".$row["SKU"]. "</td>";
				echo "<td>".$row["p_name"]. "</td>";
				echo "<td>".$row["p_type"]. "</td>";
				echo "<td>".$row["price"]. "</td>";
				echo "<td>".$row["p_size"]. "</td>";
				echo "<td>".$row["no_item"]. "</td>";
				echo '</tr>';
			}
			
			echo '</tbody>';
			echo '</table>';
		} 
		else {
			echo "0 results";
		}
	}
?>
