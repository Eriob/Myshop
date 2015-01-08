<?php

if($_GET['index'] == "contact") {
	if (isset($_POST['lastname']) || isset($_POST['firstname']) || isset($_POST['email'] || isset($_POST['message']))) {
		if (!empty($_POST['lastname']) && !empty($_POST['firstname']) && !empty($_POST['email']) && !empty($_POST['message'])) {
			# code...
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