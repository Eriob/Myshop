<?php

function show_mywebsite($name) {

	$sql = "SELECT shop FROM users WHERE shop = '$name'";
	$request = mysql_query($sql) or die(mysql_error());

	$name = mysql_fetch_assoc($request);

	return $name['shop'];
}

?>