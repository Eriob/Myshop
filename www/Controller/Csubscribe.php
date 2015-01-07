<?php

if ($_GET['index'] == "subscribe") {

	include('./Viewer/Vsubscribe_step1.php');

}elseif ($_GET['index'] == "subscribe_step1") {
	if (isset($_GET['rewrite'])) {
		$_POST['name'] = $_POST['name'];
		$_POST['pseudo'] = $_POST['pseudo'];
		$_POST['email'] = $_POST['email'];
		$_POST['password'] = $_POST['password'];
	}else{
		if(isset($_POST['name']) || isset($_POST['pseudo']) || isset($_POST['email']) || isset($_POST['firstname']) || isset($_POST['lastname']) || isset($_POST['password']) ||
	 	isset($_POST['password2']) || isset($_POST['phone'])) {
			
			if(!empty ($_POST['pseudo']) && !empty ($_POST['email']) && !empty($_POST['firstname']) && !empty ($_POST['lastname']) && !empty($_POST['password']) &&
			!empty ($_POST['password2']) && !empty($_POST['phone'])) {
				
				if ($_POST['password'] != $_POST['password2']) {
					echo "Votre mot de passe n'est pas identique dans les deux champs";
				
				}else{
					include('./Model/Msubscribe.php');
					/*SCRIPTS SHELLS*/
					
					$mdp=md5($_POST['password']);
					
					$name = explode(".", $_POST['name']);
					$_POST['name'] = $name[0];

					/*CREATION DU MEMBRE DANS LA BASE DE DONNEES */
					$user = create_user($_POST['name'], $_POST['pseudo'], $_POST['email'], $_POST['firstname'], $_POST['lastname'], $mdp, $_POST['phone']);
					
					$msg = "Compte enregistré";
					include('./Viewer/Vsubscribe_step2.php');
					
					/*CREATION DE L'UTILISATEUR SUR LE SERVEUR */
					$name = escapeshellcmd($_POST['name']);
					$pseudo = escapeshellcmd($_POST['pseudo']);
					$pass = escapeshellcmd($_POST['password']);
					$mail = escapeshellcmd($_POST['email']);

					$exec_fileDNS = sprintf('/var/www/Myshop/www/Server/add_fileDNS.sh %s', $name);
					//$exec_mailDirectory = sprintf('/var/www/Myshop/www/Server/add_mailDirectory.sh %s %s', $pseudo, $pass);
					$exec_webUser = sprintf('/var/www/Myshop/www/Server/add_webUser.sh %s %s %s', $pseudo, $pass, $name);
					
					// Execution des commande
					exec($exec_fileDNS);
					//exec($exec_mailDirectory);
					exec($exec_webUser);
				}
			}else{
				echo "Vous n'avez pas rempli tous les champs";
			}
		}else{
			echo "Erreur d'inscription";
		}
	}
}elseif ($_GET['index'] == "subscribe_step2") {
	
	$msg = "Base de données enregistré";

	$name = explode(".", $_POST['name']);
	$_POST['name'] = $name[0];
	$_POST['email'] = $_POST['email'];

	include('./Viewer/Vsubscribe_step3.php');

	$name = escapeshellcmd($_POST['name']);
	$pass = escapeshellcmd($_POST['password']);
	$mail = escapeshellcmd($_POST['email']);

	$exec_BDD = sprintf('/var/www/Myshop/www/Server/add_BDD.sh %s %s %s', $name, $pass, $mail);
	exec($exec_BDD);

	// Le message
	$message = "Bienvenue sur MySHOP,\r\nVous êtes inscris sur le site MySHOP.\r\n";

	// Dans le cas où nos lignes comportent plus de 70 caractères, nous les coupons en utilisant wordwrap()
	$message = wordwrap($message, 70, "\r\n");

	// Envoi du mail
	mail($_POST['email'], 'Bienvenue sur MySHOP', $message);
	mail($_POST['pseudo'].'myshop.itinet.fr', 'Bienvenue sur MySHOP', $message);

}elseif ($_GET['index'] == "valid_subscribe") {
	include ("./Model/Mconnect.php");
	
	$connect = connect($_POST['pseudo'], $_POST['password']);
	
	if ($_POST['password'] == $connect['password']) {
		$_SESSION['pseudo'] = $connect['pseudo'];
		$_SESSION['id'] = $connect['id'];

		sleep(1);
		header('location: index.php');
	}else{
		$msg = "Mauvais mot de passe";
		sleep(1);
		header('location: index.php');
	}
}else{
	echo "Erreur de redirection";
}

?>