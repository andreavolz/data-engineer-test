<?php
	$servername = "localhost";
	$dbname = "indeorum";
	$username = "root";
	$password = "12345";

	// Create connection
	$conn = new mysqli($servername,$username,$password,$dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 

?>

