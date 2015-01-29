<?php

if($_GET['index'] == "contact") {
	if (isset($_POST['lastname']) || isset($_POST['firstname']) || isset($_POST['email']) || isset($_POST['message'])) {
		if (!empty($_POST['lastname']) && !empty($_POST['firstname']) && !empty($_POST['email']) && !empty($_POST['message'])) {
			// Le message
			$message = $_POST['firstname']." vous envoi un message sur MySHOP,\r\n".$_POST['message']."\r\n";

			// Dans le cas où nos lignes comportent plus de 70 caractères, nous les coupons en utilisant wordwrap()
			$message = wordwrap($message, 70, "\r\n");

			// Envoi du mail
			mail("webmaster@myshop.itinet.fr", "Message d'un membre MySHOP", $message);

		}else{
			$msg = "Vous n'avez pas rempli tous les champs";
			header('location: index.php');
		}

		$msg = "Erreur d'envoi";
		header('location: index.php');
	}else{
		include('./Viewer/Vcontact.php');
	}

}