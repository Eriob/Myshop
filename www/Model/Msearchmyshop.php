<?php
function search_shop($query) {

//CONNEXION A MYSQL
mysql_connect('localhost', 'root', 'admin')
or die ('ERROR TO CONNECT WITH DATABASE');

//SELECTION DE LA BDD
mysql_select_db('myshop')
or die ('ERROR NAME DATABASE');

$date = date('Y-m-d');

$sql = 'SELECT shops.id, shops.name, shops.description, user.pseudo, user.email, user.zip_code FROM shops JOIN users ON shops.id = users.shop WHERE name LIKE '.$query.'\'%';
	
$request = mysql_query($sql) or die (mysql_error());
}

?>