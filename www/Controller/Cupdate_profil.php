<?php

include('./Model/Mupdateprofil.php');

if(isset ($_POST['password']))
{
$password = md5($_POST['password']);

if (isset($_POST['new_pseudo'])&& ($_POST['new_pseudo']!= '')){
	update_pseudo($_SESSION['id'], $_POST['new_pseudo'], $password);
	}
	
if (isset($_POST['new_email'])&& ($_POST['new_email']!= '')){
	update_email($_SESSION['id'], $_POST['new_email'], $password);
	}
	
if (isset($_POST['new_phone'])&& ($_POST['new_phone']!= '')){
	update_phone($_SESSION['id'], $_POST['new_phone'], $password);
}
/*
if isset($_POST['new_avatar']){
	
	} */
}

if (isset($_POST['new_password']) && isset($_POST['new_pass_confirm']) && ($_POST['new_password']!= '')){
	if ($_POST['new_password'] == $_POST['new_pass_confirm']){
		$new_password = md5($_POST['new_password']);
		update_password($_SESSION['id'], $new_password, $password);
		}
	else{
		$msg = "Veuillez saisir deux nouveaux mots de passe identiques";
		}
	}

else
{
	$msg = "Veuillez saisir votre mot de passe actuel dans le champ pr�vu � cet effet";
}

include('./Viewer/Vprofil.php');

	

	