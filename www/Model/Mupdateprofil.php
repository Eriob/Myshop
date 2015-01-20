<?php

function update_password($id, $new_password, $password)
{
	
	//CONNEXION A MYSQL
	mysql_connect('localhost', 'root', 'admin')
	or die ('ERROR TO CONNECT WITH DATABASE');

	//SELECTION DE LA BDD
	mysql_select_db('myshop')
	or die ('ERROR NAME DATABASE');

	$sql = 'UPDATE users SET password = \''.$new_password.'\' WHERE id = \''.$id.'\' AND password = \''.$password.'\'';
	
	$request = mysql_query($sql) or die (mysql_error());
}
	

function update_email($id, $new_email, $password)
{
	
	//CONNEXION A MYSQL
	mysql_connect('localhost', 'root', 'admin')
	or die ('ERROR TO CONNECT WITH DATABASE');

	//SELECTION DE LA BDD
	mysql_select_db('myshop')
	or die ('ERROR NAME DATABASE');

	$sql = 'UPDATE users SET email = \''.$new_email.'\' WHERE id = \''.$id.'\' AND password = \''.$password.'\'';
	
	$request = mysql_query($sql) or die (mysql_error());
}

/* function update_address($id, $new_address, $password)
{
	
	//CONNEXION A MYSQL
	mysql_connect('localhost', 'root', 'admin')
	or die ('ERROR TO CONNECT WITH DATABASE');

	//SELECTION DE LA BDD
	mysql_select_db('myshop')
	or die ('ERROR NAME DATABASE');

	$sql = 'UPDATE users SET address = \''.$new_address.'\' WHERE id = \''.$id.'\' AND password = \''.$password.'\'';
	
	$request = mysql_query($sql) or die (mysql_error());
} */

function update_zipcode($id, $new_zipcode, $password)
{
	
	//CONNEXION A MYSQL
	mysql_connect('localhost', 'root', 'admin')
	or die ('ERROR TO CONNECT WITH DATABASE');

	//SELECTION DE LA BDD
	mysql_select_db('myshop')
	or die ('ERROR NAME DATABASE');

	$sql = 'UPDATE users SET zip_code = \''.$new_zipcode.'\' WHERE id = \''.$id.'\' AND password = \''.$password.'\'';
	
	$request = mysql_query($sql) or die (mysql_error());
}

function update_avatar($id, $avatar_address, $password)
{
	
	//CONNEXION A MYSQL
	mysql_connect('localhost', 'root', 'admin')
	or die ('ERROR TO CONNECT WITH DATABASE');

	//SELECTION DE LA BDD
	mysql_select_db('myshop')
	or die ('ERROR NAME DATABASE');

	$sql = 'UPDATE users SET avatar = \''.$avatar_address.'\' WHERE id = \''.$id.'\' AND password = \''.$password.'\'';
	
	$request = mysql_query($sql) or die (mysql_error());
}

function update_phone($id, $phone, $password)
{
	
	//CONNEXION A MYSQL
	mysql_connect('localhost', 'root', 'admin')
	or die ('ERROR TO CONNECT WITH DATABASE');

	//SELECTION DE LA BDD
	mysql_select_db('myshop')
	or die ('ERROR NAME DATABASE');

	$sql = 'UPDATE users SET phone = \''.$phone.'\' WHERE id = \''.$id.'\' AND password = \''.$password.'\'';
	
	$request = mysql_query($sql) or die (mysql_error());
}

?>