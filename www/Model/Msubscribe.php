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

function install_prestashop($name, $password) {

//CONNEXION A MYSQL
mysql_connect('localhost','root', 'admin')
or die ('ERROR TO CONNECT WITH DATABASE');


$create_db = "CREATE DATABASE ".$name;
$create_user = "CREATE USER '".$name."'@localhost";
$create_pwd = "SET password FOR '".$name."'@localhost = password('".$password."')";
$create_privilege = "GRANT ALL ON '".$name."'.* TO '".$name."'@localhost";

$modif_pwd = "UPDATE mysql.user SET password=PASSWORD('".$password."') where user='".$name;


echo $create_pwd;

$request_db = mysql_query($create_db);
$request_user = mysql_query($create_user);
$request_pwd = mysql_query($created_pwd);
$request_privilege = mysql_query($create_privilege);
$request_mpwd = mysql_query($modif_pwd);

}

?>
