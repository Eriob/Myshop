<?php

if ($_GET['index'] == "subscribe") {
	include("./Model/Msubscribe.php");

	if (isset($_POST['name'])) {

		$find = find_shop($_POST['name']);

		if ($_POST['name'] == $find['shop']) {
			$msg = "boutique déjà prise";
			header('location: index.php');
		}else{
			include("./Viewer/Vsubscribe.php");
		}
	}else{
		$msg = "Erreur de redirection";
		header('location: index.php');
	}

}elseif ($_GET['index'] == "subscribe_step1") {
	if(isset($_POST['name']) || isset($_POST['email']) || isset($_POST['firstname']) || isset($_POST['lastname']) || isset($_POST['password']) ||
	 	isset($_POST['password2']) || isset($_POST['phone'])) {
			
		if(!empty ($_POST['email']) && !empty($_POST['firstname']) && !empty ($_POST['lastname']) && !empty($_POST['password']) &&
			!empty ($_POST['password2']) && !empty($_POST['phone'])) {
				
			if ($_POST['password'] != $_POST['password2']) {
				$msg = "Votre mot de passe n'est pas identique dans les deux champs";
				$name = explode(".", $_POST['name']);
				$_POST['name'] = $name[0];
				include('./Viewer/Vsubscribe.php');
			}else{
				
				$msg = "Compte enregistré";
				include('./Viewer/Vsubscribe_step1.php');
			}
		}else{
			$msg = "Vous n'avez pas rempli tous les champs";
			header('location: index.php');
		}
	}else{
		$msg = "Erreur d'inscription";
		header('location: index.php');
	}

}elseif ($_GET['index'] == "subscribe_step2") {
	
	$msg = "Base de données enregistré";

	include('./Model/Msubscribe.php');					
		
		$mdp=md5($_POST['password']);
					
		$name = explode(".", $_POST['name']);
		$_POST['name'] = $name[0];
		$create_mailuser = $_POST['name']."@myshop.itinet.fr";

		/*CREATION DU MEMBRE DANS LA BASE DE DONNEES */
		$user = create_user($_POST['name'], $_POST['email'], $_POST['firstname'], $_POST['lastname'], $mdp, $_POST['phone']);
		$mail = add_mails($_POST['name'], $create_mailuser);
	
		include('./Viewer/Vsubscribe_step2.php');

		/*CREATION DE L'UTILISATEUR SUR LE SERVEUR */
		$name = escapeshellcmd($_POST['name']);
		$pass = escapeshellcmd($_POST['password']);
		$mail = escapeshellcmd($_POST['email']);

		$exec_fileDNS = sprintf('/var/www/Myshop/www/Server/add_fileDNS.sh %s', $name);
		$exec_mailDirectory = sprintf('/var/www/Myshop/www/Server/add_mailDirectory.sh %s %s', $name, $pass);
		$exec_webUser = sprintf('/var/www/Myshop/www/Server/add_webUser.sh %s %s %s', $name, $pass, $name);
		$exec_BDD = sprintf('/var/www/Myshop/www/Server/add_BDD.sh %s %s %s', $name, $pass, $mail);
					
		// Execution des commande
		exec($exec_fileDNS);
		exec($exec_mailDirectory);
		exec($exec_webUser);
		exec($exec_BDD);

		// Le message
		$message = "Bienvenue sur MySHOP,\r\nVous êtes inscris sur le site MySHOP.\r\n";

		// Dans le cas où nos lignes comportent plus de 70 caractères, nous les coupons en utilisant wordwrap()
		$message = wordwrap($message, 70, "\r\n");

		// Envoi du mail
		mail($_POST['email'], 'Bienvenue sur MySHOP', $message);
		mail($_POST['name'].'myshop.itinet.fr', 'Bienvenue sur MySHOP', $message);

}elseif ($_GET['index'] == "valid_subscribe") {
	include ("./Model/Mconnect.php");

	$name = explode(".", $_POST['name']);
	$_POST['name'] = $name[0];
	$_POST['email'] = $_POST['email'];
	$_POST['password'] = $_POST['password'];

	if (isset($_POST['name'],$_POST['password'])) {  
	$password = md5($_POST['password']);
	$name = $_POST['name'];
	
	$connect = connect($name,$password);
			
		if ($password == $connect['password']) {
			$_SESSION['name'] = $connect['shop'];
			$_SESSION['id'] = $connect['id'];
				
		sleep(1);
		include('./Controller/Cindex.php');
	}else{
		$msg = "Mauvais mot de passe";
		sleep(1);
		header('location: index.php');
	}
	}else{
		$msg = "ERREUR//";
		header('location: index.php');
	}
}else{
	$msg = "Erreur de redirection";
	header('location: index.php');

}

?>