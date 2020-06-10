<?php
	session_start();

	if(!isset($_SESSION['Eid']))
		header('location:login.php');
?>


<html>
<body>

<?php include "head.php"; ?>
<!-- <a href="logout.php">LOGOUT</a> -->

<br><br>
<div class="container">
	<?php 
		$servername = "localhost";
		$username = "root";
		$password = "";
		$dbname = "supermarket";
		$Eid = $_SESSION['Eid'];

		$mysqli = new mysqli($servername, $username, $password, $dbname);
		$sqlSelect="SELECT Employee_Name FROM employee where Employee_ID = $Eid";
		$result = $mysqli-> query ($sqlSelect);
		
		print'<center><h1> Welcome'.mysqli_fetch_array($result)[0].'</h1></center>';


		/*-------------------------------------------------
		Fetching and displaying all the access matrix entries
		under the current user
		--------------------------------------------------*/
		echo'<br><br><hr>';
		echo'<h2>
		<center>Your Access Rights</center>
		</h2><br><br>';
		$access_sql = "SELECT * FROM Access_Matrix where Employee_ID = $Eid";
		$result = $mysqli->query($access_sql);
		if ($result->num_rows > 0) {
			echo "<table class = 'table table-hover table-striped'>
			<tr>
				<th>Object ID</th>
				<th>Read Access</th>
				<th>Write Access</th>
				<th>Owner</th>
			</tr>";
		
			while($row = $result->fetch_assoc()) {
				echo "<tr>
					<td>".$row["Objects_ID"]."</td>
					<td>".$row["Read_Access"]."</td>
					<td>".$row["Write_Access"]."</td>
					<td>".$row["Owner"]."</td>
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

<!-- ---------------------------------------------------------
User can change the rights given to others only for those
objects which the User is the Owner for.
-------------------------------------------------------------->

<div class="container">
<center><h1>Objects you Own</h1></center>
<?php

	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "supermarket";
	$Eid = $_SESSION['Eid'];

	$mysqli = new mysqli($servername, $username, $password, $dbname);

	$access_sql = "SELECT * FROM Access_Matrix where Employee_ID = $Eid AND Owner=1";
	$result = $mysqli->query($access_sql);
	if ($result && $result->num_rows > 0) {
		echo "<table class = 'table table-hover table-striped'>
		<tr>
			<th>Object ID</th>
			<th>Read Access</th>
			<th>Write Access</th>
			<th>Owner</th>
		</tr>";
	
		while($row = $result->fetch_assoc()) {
			echo "<tr>
				<td>".$row["Objects_ID"]."</td>
				<td>".$row["Read_Access"]."</td>
				<td>".$row["Write_Access"]."</td>
				<td>".$row["Owner"]."</td>
			</tr>";
		}
		echo "</table>";

	} 
	else {
		echo "0 results";
	}

?>
</div>


<div class = "container-fluid row padding" >
    <div class="col-lg-3 col-md-6 col-sm-6" >
        <h1 style = "padding-left: 15%"><br>Modify Access Rights : </h1>
    </div>

    <div class="col-lg-9 col-md-6 col-sm-6" >
		<form method="post" id='purchase_putter'>
			<br>
			<label><h5>Object ID</h5></label>
			<br>
			<select name="Object">
			<?php
				$mysqli = new mysqli($servername, $username, $password, $dbname);
				$sqlSelect="SELECT Objects_ID FROM Access_Matrix where Employee_ID = $Eid AND owner=1";
				$result = $mysqli-> query ($sqlSelect);
				while ($row = mysqli_fetch_array($result)) {
					$rows[] = $row;
				}
				// $rows[] = ['items', 'suppliers', 'godowns', 'purchase'];
				foreach ($rows as $row) {
					echo "$row";
					print "<option value='" . $row['Objects_ID'] . "'>" .$row['Objects_ID']."</option>";
				}
			?>
			</select>
			<br><br>
			<label><h5>Employee ID</h5></label>
			<br>
			<select name="Employees">
			<?php
				$mysqli = new mysqli($servername, $username, $password, $dbname);
				$sqlSelect="SELECT Employee_ID FROM Employee";
				$result = $mysqli-> query ($sqlSelect);
				while ($row = mysqli_fetch_array($result)) {
					$rows1[] = $row;
				}
				foreach ($rows1 as $row) {
					print "<option value=" . (int)$row['Employee_ID'] . ">" .$row['Employee_ID']. "</option>";
				}
			?>
			</select>
			<br><br>
			<label><h5>Read Access</h5></label>
			<br>
			<select name="Read_Access">
			<?php
				$mysqli = new mysqli($servername, $username, $password, $dbname);
				$sqlSelect="SELECT Read_Access FROM Access_Matrix";
				$result = $mysqli-> query ($sqlSelect);
				while ($row = mysqli_fetch_array($result)) {
					$rows1[] = $row;
				}
				// foreach ($rows1 as $row) {
				// 	print "<option value='" . $row['Read_Access'] . "'>" .$row['Read_Access']. "</option>";
				// }
				print "<option value=0>" . 0 . "</option>";
				print "<option value=1>" . 1 . "</option>";
			?>
			</select>
			<br><br>
			<label><h5>Write Access</h5></label>
			<br>
			<select name="Write_Access">
			<?php
				$mysqli = new mysqli($servername, $username, $password, $dbname);
				$sqlSelect="SELECT Write_Access FROM Access_Matrix";
				$result = $mysqli-> query ($sqlSelect);
				while ($row = mysqli_fetch_array($result)) {
					$rows1[] = $row;
				}
				print "<option value=0>" . 0 . "</option>";
				print "<option value=1>" . 1 . "</option>";
		?>
			</select>
			<br><br>
			<button type="submit" name="button1">Add</button>
		</form>
	</div>
</div>



<?php
	
	if(isset($_POST['button1']))
	{
		$Obj_id = $_POST['Object'];
		$Emp_id = $_POST['Employees'];
		$Read_Access = $_POST['Read_Access'];
		$Write_Access = $_POST['Write_Access'];
	
		$q = "select * from Access_Matrix where Employee_ID = $Emp_id and Objects_ID = '$Obj_id' ";

		$con = mysqli_connect("127.0.0.1","root","");
		mysqli_select_db($con, "supermarket");
		
		$result = mysqli_query($con, $q);

		$n = mysqli_num_rows($result);

		if(true)
		{

			$servername = "localhost";
			$username = "root";
			$password = "";
			$dbname = "supermarket";

			$conn = new mysqli($servername, $username, $password, $dbname);
			if ($conn->connect_error) {
				die("Connection failed: " . $conn->connect_error);
			}
			$sql = "SELECT * from Acess_Matrix WHERE Employee_ID=$Emp_id AND Objects_ID='$Obj_id'"; 
			$result = $conn->query($sql);
			
			// print_r($result);
			if($n == 1)
				$sql = "UPDATE Access_Matrix SET Read_Access=$Read_Access, Write_Access=$Write_Access 
			WHERE Employee_ID=$Emp_id AND Objects_ID='$Obj_id'";
			else
				$sql = "INSERT INTO `access_matrix`(`Employee_ID`, `Objects_ID`, `Read_Access`, `Write_Access`, `Owner`) VALUES ($Emp_id, '$Obj_id', $Read_Access, $Write_Access, 0)";
			// print_r($sql);
			$result = $conn->query($sql);

			if ($result) {
				echo "<center>
				<h3>Access Rights Update Successful</h3>
				</center>";

			} else {
				echo "<center>
				<h3>Unable to update Access Rights</h3>
				</center>";
			}

		}
		else
		{
			echo "<center>
				<h3>Error : Invalid Inputs!!</h3>
				</center>";
			
		}


	}
	
?>

</body>
</html>