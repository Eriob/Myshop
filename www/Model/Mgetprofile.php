<?php
function get_profile($id)
{

	//CONNEXION A MYSQL
	mysql_connect('localhost', 'root', 'admin')
	or die ('ERROR TO CONNECT WITH DATABASE');

	//SELECTION DE LA BDD
	mysql_select_db('myshop')
	or die ('ERROR NAME DATABASE');

	$date = date('Y-m-d');

	$sql = "SELECT * FROM users WHERE id = $id;";
	
	$request = mysql_query($sql) or die (mysql_error());
	$result = mysql_fetch_array($request);
	return $result;
}
?>