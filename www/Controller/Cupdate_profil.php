<?php

include('./Model/Mupdateprofil.php');
$def = '';
if(isset ($_POST['password']))
{
$password = md5($_POST['password']);

if (isset($_POST['new_pseudo'])&& ($_POST['new_pseudo']!= '')){
	update_pseudo($_SESSION['id'], $_POST['new_pseudo'], $password);
	}
	
if (isset($_POST['new_email'])&& ($_POST['new_email']!= '')){
	update_email($_SESSION['id'], $_POST['new_email'], $password);
	}
	
/*if (isset($_POST['new_address'])&& ($_POST['new_address']!= '')){
	update_address($_SESSION['id'], $_POST['new_address'], $password);
	} */
	
if (isset($_POST['new_zipcode'])&& ($_POST['new_zipcode']!= '')){
	update_zipcode($_SESSION['id'], $_POST['new_zipcode'], $password);
	}

if (isset($_POST['new_phone'])&& ($_POST['new_phone']!= '')){
	update_phone($_SESSION['id'], $_POST['new_phone'], $password);
}
/*
if isset($_POST['new_avatar']){
	
	} */
}

if (isset($_POST['new_password'])&& ($_POST['new_password']!= '')){
	$new_password = md5($_POST['new_password']);
	update_password($_SESSION['id'], $new_password, $password);
	}

else
{
	$msg = "Veuillez saisir votre mot de passe actuel dans le champ prévu à cet effet";
}

include('./viewer/Vprofil.php');

	

	