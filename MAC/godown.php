<?php
	session_start();

	if(!isset($_SESSION['Eid']))
		header('location:login.php');
	$Gid = $_GET['Gid'];
?>
<?php include "head.php"; ?>

<!DOCTYPE html>
<html>
<body>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "supermarket";

$Eid = $_SESSION['Eid'];
$Clearance = $_SESSION['Clearance'];

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

echo "<h1><center>Items in Godown</center></h1>";

$sql = "SELECT * FROM godown_item_details natural join item where Godown_ID = $Gid";
$result = $conn->query($sql);

$Gid_String = (string)$Gid;
$perm_sql = "SELECT Clearance FROM access_matrix WHERE Objects_ID = $Gid_String";
$permission = $conn->query($perm_sql);

if($permission <= $Clearance){
    if ($result->num_rows > 0) {
        echo "<table class = 'table table-hover table-striped'><tr><th>Item ID</th><th>Item Name</th><th>Quantity</th><th>Price per unit</th><th>Total price</th></tr>";
    
        while($row = $result->fetch_assoc()) {
            echo "<tr><td>" . $row["Item_ID"]. "</td><td>" . $row["Item_Name"]. "</td><td>" . $row["Quantity"] . "</td><td>Rs." . $row["Item_Unit_Price"] . " per " . $row["Item_Units"] ."</td><td>" . $row["Item_Unit_Price"] * $row["Quantity"]. "</td></tr>";
        }
        echo "</table>";
    } else {
        echo "0 results";
    }

}else{
    echo"<center><br>
        <h3>You don't have access to this data</h3>
    </center><br><hr><br>";
}



echo "<br><br><h1><center>Purchase history</center></h1>";


$sql = "SELECT * FROM purchase natural join purchase_item_details natural join godown natural join item natural join supplier where Godown_ID = $Gid order by DOP";
$result = $conn->query($sql);

$purchase_id = (string)$Gid.'p';
$perm_sql = "SELECT Clearance FROM Access_Matrix WHERE Objects_ID=$purchase_id";
$permission = $conn->query($perm_sql);

if($permission <= $Clearance){
    if ($result->num_rows > 0) {
        echo "<table class = 'table table-hover table-striped'><tr><th>Date</th><th>Item ID</th><th>Item Name</th><th>Supplier ID</th><th>Supplier Name</th><th>Quantity</th><th>Price per unit</th><th>Total price</th></tr>";

        while($row = $result->fetch_assoc()) {
            echo "<tr><td>" . $row["DOP"]. "</td><td>" . $row["Item_ID"]. "</td><td>" . $row["Item_Name"]. "</td><td>" . $row["Supplier_ID"]. "</td><td>" . $row["Supplier_Name"]. "</td><td>" . $row["Quantity"] . "</td><td>Rs." . $row["Item_Unit_Price"] . " per " . $row["Item_Units"] ."</td><td>" . $row["Item_Unit_Price"] * $row["Quantity"]. "</td></tr>";
        }
        echo "</table>";
    } else {
        echo "0 results";
    }

}else{
    echo"<center><br>
        <h3>You don't have access to this data</h3>
    </center><br><hr><br>";
}



// echo "<br><br><h1><center>Restock history</center></h1>";


// $sql = "SELECT * FROM restock natural join restock_item_details natural join item natural join showroom where Godown_ID = $Gid order by DOR";
// $result = $conn->query($sql);

// if ($result->num_rows > 0) {
//     echo "<table class = 'table table-hover table-striped'><tr><th>Date</th><th>Item ID</th><th>Item Name</th><th>Showroom ID</th><th>Showroom Name</th><th>Quantity</th><th>Price per unit</th><th>Total price</th></tr>";

//     while($row = $result->fetch_assoc()) {
//         echo "<tr><td>" . $row["DOR"]. "</td><td>" . $row["Item_ID"]. "</td><td>" . $row["Item_Name"]. "</td><td>" . $row["Showroom_ID"]. "</td><td>" . $row["Showroom_Name"]. "</td><td>" . $row["Quantity"] . "</td><td>Rs." . $row["Item_Unit_Price"] . " per " . $row["Item_Units"] ."</td><td>" . $row["Item_Unit_Price"] * $row["Quantity"]. "</td></tr>";
//     }
//     echo "</table>";
// } else {
//     echo "0 results";
// }







$conn->close();
?>