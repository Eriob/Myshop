<?php

function get_informations($name) {
	
	$sql = "SELECT name, email, shop FROM users WHERE name = '$name'";
	$request = mysql_query($sql) or die(mysql_error());

	$informations = mysql_fetch_array($request);

	return $informations;
}