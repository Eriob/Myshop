<?php

function get_informations($id) {
	$sql = "SELECT pseudo, email, shop FROM users WHERE id = '$id'";
	$request = mysql_query($sql) or die(mysql_error());

	$informations = mysql_fetch_array($request)

	return $informations;
}