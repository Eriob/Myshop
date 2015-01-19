<?php
function connect($name, $password)
{
	
	//CONNEXION A MYSQL
	mysql_connect('localhost', 'root', 'admin')
	or die ('ERROR TO CONNECT WITH DATABASE');

	//SELECTION DE LA BDD
	mysql_select_db('myshop')
	or die ('ERROR NAME DATABASE');
	
	$sql = 'SELECT id, name, password FROM users WHERE name = \''.$name.'\' AND password = \''.$password.'\';';
	
	$request = mysql_query($sql) or die (mysql_error());
	$result = mysql_fetch_array($request);
	return $result;
}
?>