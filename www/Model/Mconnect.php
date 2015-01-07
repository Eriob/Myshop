<?php
function connect($pseudo, $password)
{
	
	//CONNEXION A MYSQL
	mysql_connect('localhost', 'root', '')
	or die ('ERROR TO CONNECT WITH DATABASE');

	//SELECTION DE LA BDD
	mysql_select_db('myshop')
	or die ('ERROR NAME DATABASE');
	
	$sql = 'SELECT id, pseudo, password FROM users WHERE pseudo = \''.$pseudo.'\' AND password = \''.$password.'\';';
	
	$request = mysql_query($sql) or die (mysql_error());
	$result = mysql_fetch_array($request);
	return $result;
}
?>