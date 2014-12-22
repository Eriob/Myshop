<?php

function create_user($name, $pseudo, $email, $firstname, $lastname, $mdp, $telephone) {

//CONNEXION A MYSQL
mysql_connect('localhost', 'root', 'admin')
or die ('ERROR TO CONNECT WITH DATABASE');

//SELECTION DE LA BDD
mysql_select_db('myshop')
or die ('ERROR NAME DATABASE');

$date = "0";

/*ID, FIRSTNAME, LASTNAME, PSEUDO, PASSWORD, EMAIL, SHOP, ADRESSE, DATE INSCRIPTION, PHONE, AVATAR, BAN, ADMIN, TEAM, STATUS, ZIP_CODE*/

$sql = 'INSERT INTO users VALUES("", "'.$firstname.'", "'.$lastname.'", "'.$pseudo.'","'.$mdp.'","'.$email.'", "'.$name.'", "", "'.$date.'", "'.$telephone.'", "", "0", "0", "", "", "")';
	
$request = mysql_query($sql) or die (mysql_error());
	
}

function install_prestashop($name, $password) {

//CONNEXION A MYSQL
mysql_connect('localhost','root', 'admin')
or die ('ERROR TO CONNECT WITH DATABASE');

$createdb = 'CREATE DATABASE '$name;
$createuser = 'CREATE USER '$name'@localhost';
//$createpwd = 'SET password FOR "'.$name.'"@localhost = password("'.$password.'")';
//$createprivilege = 'GRANT ALL ON "'.$name.'".* TO "'.$name.'"@localhost';

$request1 = mysql_query($createdb) or die(mysql_error());
$request2 = mysql_query($createuser) or die(mysql_error());
//$request3 = mysql_query($createdpwd) or die(mysql_error());
//$request4 = mysql_query($createprivilege) or die(mysql_error());

}

?>
