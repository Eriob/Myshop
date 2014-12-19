<?php

function create_user($name, $pseudo, $email, $firstname, $lastname, $mdp, $telephone) {

$date = "0";

/*ID, FIRSTNAME, LASTNAME, PSEUDO, PASSWORD, EMAIL, SHOP, ADRESSE, DATE INSCRIPTION, PHONE, AVATAR, BAN, ADMIN, TEAM, STATUS, ZIP_CODE*/

$sql = 'INSERT INTO users VALUES("", "'.$firstname.'", "'.$lastname.'", "'.$pseudo.'","'.$mdp.'","'.$email.'", "'.$name.'","'.$date.'", "'.$telephone.'", "", "0", "0", "", "", "")';
	
$request = mysql_query($sql) or die (mysql_error());

echo "Compte enregistré";
	
}	

?>
