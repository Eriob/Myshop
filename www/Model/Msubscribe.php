<?php

function create_user($name, $pseudo, $email, $firstname, $lastname, $mdp, $telephone) {

//CONNEXION A MYSQL
mysql_connect('localhost', 'root', 'admin')
or die ('ERROR TO CONNECT WITH DATABASE');

//SELECTION DE LA BDD
mysql_select_db('myshop')
or die ('ERROR NAME DATABASE');

$date = date('Y-m-d');

/*ID, FIRSTNAME, LASTNAME, PSEUDO, PASSWORD, EMAIL, SHOP, ADRESSE, DATE INSCRIPTION, PHONE, AVATAR, BAN, ADMIN, TEAM, STATUS, ZIP_CODE*/

$sql = 'INSERT INTO users VALUES("", "'.$firstname.'", "'.$lastname.'", "'.$pseudo.'","'.$mdp.'","'.$email.'", "'.$name.'", "", "'.$date.'", "'.$telephone.'", "", "0", "0", "", "", "")';
	
$request = mysql_query($sql) or die (mysql_error());
	
}

function find_shop($name){

//CONNEXION A MYSQL
mysql_connect('localhost', 'root', 'admin')
or die ('ERROR TO CONNECT WITH DATABASE');

//SELECTION DE LA BDD
mysql_select_db('myshop')
or die ('ERROR NAME DATABASE');

$sql = "SELECT shop FROM users WHERE shop ='$name'";
$request = mysql_query($sql) or die (mysql_error());

$result = mysql_fetch_assoc($request);

return $result;
}

?>
