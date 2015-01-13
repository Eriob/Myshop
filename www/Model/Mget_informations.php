<?php

function get_informations($pseudo) {
	
	$sql = "SELECT pseudo, email, shop FROM users WHERE pseudo = '$pseudo'";
	$request = mysql_query($sql) or die(mysql_error());

	$informations = mysql_fetch_array($request);

	return $informations;
}