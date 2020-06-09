<?php include "head.php";
	session_start();
	if(!isset($_SESSION['Eid']))
		header('location:login.php');
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "supermarket";
	$Eid = $_SESSION['Eid'];

	echo "<br><br><h1><center>All Godowns</center></h1>";
	$conn = new mysqli($servername, $username, $password, $dbname);
	if ($conn->connect_error) {
	    die("Connection failed: " . $conn->connect_error);
	}

	$sql = "SELECT * FROM godown join employee on godown.Manager_ID = employee.Employee_ID order by Godown_ID";
	// echo $sql;
	$result = $conn->query($sql);

	//$Gid_String = (string)$Gid;
	$perm_sql = "SELECT Read_Access FROM Access_Matrix WHERE Employee_ID = $Eid AND Objects_ID='godowns'";
	$permission = $conn->query($perm_sql);

	if($permission->fetch_assoc()['Read_Access']){
		if ($result->num_rows > 0) {
			echo "<table class = 'table table-hover table-striped'><tr><th>Godown ID</th><th>Godown Location</th><th>Manager Name</th></tr>";
	
			while($row = $result->fetch_assoc()) {
				echo "<tr><td>" . $row["Godown_ID"]. "<a href='godown.php?Gid=".$row["Godown_ID"]."'><img src='img/1.png' style='width:30px; height30px; margin-left:20%;'></a></td><td>" . $row["Godown_Location"]. "</td><td>" . $row["Employee_Name"]. "</td></tr>";
			}
			echo "</table>";
		} else {
			echo "0 results";
		}

	}else{
		echo"<center>
		<h3>You don't have access to this data</h3>
		</center><br><hr>";
	}
	
	$conn->close();
?>

<div class = "container-fluid row padding" >
    <div class="col-lg-4 col-md-6 col-sm-6" >
        <h1 style = "padding-left: 15%"><br>Add<br> Godowns : </h1>
    </div>

    <div class="col-lg-8 col-md-6 col-sm-6" >

		<form method="post" id="godowns_putter">
			<label>Location</label>
			<br>
			<input type="text" name="loc" required>
			<br><br>
			<label>Manager-ID</label>
			<br>
			<select name="Mid">
			<?php
				$sqlSelect="SELECT * FROM employee";
				$result = $mysqli-> query ($sqlSelect);
				while ($row = mysqli_fetch_array($result)) {
					$rows[] = $row;
				}
				foreach ($rows as $row) {
					print "<option value='" . $row['Employee_ID'] . "'>" .$row['Employee_ID']."(". $row['Employee_Name'] . ")</option>";
				}
			?>
			</select>
			<br><br>
			<button type="submit" name="button1">Add</button>
		</form>

		<?php
			$mysqli = new mysqli($servername, $username, $password, $dbname);
			$Eid = $_SESSION['Eid'];

			$perm_sql = "SELECT Write_Access FROM Access_Matrix WHERE Employee_ID = '$Eid' AND Objects_ID='godowns' ";
			$permissions = $mysqli->query($perm_sql);
			if($permissions->fetch_assoc()['Write_Access'] == false)
			{
				echo"<script type='text/javascript'>
					var form = document.getElementById('godowns_putter');
					form.style.display = 'none';
				</script>";

				echo"<center>
                    <h3>You don't have the clearance to Add Godowns</h3>
                </center>";
			}
		?>
	</div>
</div>

<?php
	if(isset($_POST['button1']) )//&& $_SESSION['Eid'] == 1
	{
		$Mid = $_POST['Mid'];
		$loc = $_POST['loc'];
		$Eid = $_SESSION['Eid'];
		$q = "select * from godown where Godown_Location = '$loc' and Manager_ID = '$Mid'";

		$con = mysqli_connect("127.0.0.1","root","");
		mysqli_select_db($con, "supermarket");
		
		$result = mysqli_query($con, $q);

		$n = mysqli_num_rows($result);

		if($n != 0)
		{
			echo "Godown exists!!";
		}
		else
		{
			$q = "INSERT INTO `godown`(`Godown_Location`, `Manager_ID`) VALUES ('$loc', $Mid)";

			if(mysqli_query($con, $q))
			{
				/*------------------------------------------
				Adding the new godown into the access matrix
				--------------------------------------------*/
				$get_gid = "select Godown_ID from godown where Godown_Location = '$loc' and Manager_ID = '$Mid'";
				$gid_added = mysqli_query($con, $get_gid);
				$gid_added_str = (string)$gid_added;

				$access_add = "INSERT INTO `Access_Matrix`(`Employee_ID`, `Objects_ID`, `Read_Access`, `Write_Access`, `Owner`) 
				VALUES ($Eid, $gid_added_str, 'true', 'true', 'true')";

				echo "Godown Added Successfully!!";
				header('location:godowns.php');
			}
			else
			{
				echo "Godown cannot be added!! Check Manager ID";
			}

		}
	}
	// else if($_SESSION['Eid'] != 1)
	// {
	// 	echo "You are not permitted to add Godown!!";
	// }
?>
<br>
<center><h3><a href='home.php' style = "color : white; font-weight : bold; padding-left : 50px; text-decoration: underline">Back</a></h3></center>
<br><br><br>

</body>
</html>
