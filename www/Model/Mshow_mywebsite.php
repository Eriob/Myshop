<?php

function show_mywebsite($pseudo) {

	$sql = "SELECT shop FROM users WHERE pseudo = '$pseudo'";
	$request = mysql_query($sql) or die(mysql_error());

	$name = mysql_fetch_assoc($request);

	return $name;
}

?>