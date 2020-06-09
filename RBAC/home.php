<?php
	session_start();

	if(!isset($_SESSION['Eid']))
		header('location:login.php');
?>

<?php include "head.php"; ?>
<!-- <a href="logout.php">LOGOUT</a> -->

<br><br>
<div class="container">
		<?php 
		$servername = "localhost";
		$username = "root";
		$password = "";
		$dbname = "supermarket_rbac";
		$Eid = $_SESSION['Eid'];
		$Role = $_SESSION['Role'];

		$mysqli = new mysqli($servername, $username, $password, $dbname);
		$sqlSelect="SELECT Employee_Name FROM employee where Employee_ID = $Eid";
		$result = $mysqli-> query ($sqlSelect);
		
		print'<center><h1> Welcome '.mysqli_fetch_array($result)[0].'</h1></center>';


		/*-------------------------------------------------
		Fetching and displaying all the access matrix entries
		under the current user
		--------------------------------------------------*/
		echo'<br><br><hr>';
		print'<center><h1> Your Role is: Level '.$Role.' Employee</h1></center>';
		echo'<br><h2>
		<center>Role-Based Access Matrix</center>
		</h2><br><br>';
		$access_sql = "SELECT * FROM Access_Matrix";
		$result = $mysqli->query($access_sql);
		if ($result->num_rows > 0) {
			echo "<table class = 'table table-hover table-striped'>
			<tr>
				<th>Role </th>
				<th>Object ID</th>
				<th>Read Access</th>
				<th>Write Access</th>
			</tr>";
		
			while($row = $result->fetch_assoc()) {
				echo "<tr>
					<td>Level ".$row["Roles"]." Employee</td>
					<td>".$row["Objects_ID"]."</td>
					<td>".$row["Read_Access"]."</td>
					<td>".$row["Write_Access"]."</td>
				</tr>";
			}
			echo "</table>";

		} 
		else {
			echo "0 results";
		}

		?>
	<br>
</div>





<!-- <img src = "img/superExterior.jpg" style = " display: block; margin-left: auto; margin-right: auto; width: 50%;" > -->


<!-- <a href="summary.php">Summary</a> -->

<!-- <a href="suppliers.php">Suppliers</a>

<a href="purchase.php">Purchase</a>

<a href="godowns.php">Godowns</a>

<a href="restock.php">Restock</a>

<a href="showrooms.php">Showrooms</a>

<a href="sale.php">Sale</a>

<a href="customers.php">Customers</a>

<br><br><a href="items.php">Items</a> -->