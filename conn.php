<?php
	$servername = "localhost";
	$dbname = "indeorum";
	//$username = "username";
	//$password = "password";

	// Create connection
	$conn = new mysqli($servername,$dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 
	echo "Connected successfully";
?>

