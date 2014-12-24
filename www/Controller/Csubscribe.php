<?php

if ($_GET['index'] == "subscribe") {

	include('./Viewer/Vsubscribe.php');

}elseif ($_GET['index'] == "subscribe_step1") {
	
	if(isset($_POST['name']) || isset($_POST['pseudo']) || isset($_POST['email']) || isset($_POST['firstname']) || isset($_POST['lastname']) || isset($_POST['password']) ||
 	isset($_POST['password2']) || isset($_POST['phone']) || isset($_POST['plan'])){
		
		if(!empty ($_POST['pseudo']) && !empty ($_POST['email']) && !empty($_POST['firstname']) && !empty ($_POST['lastname']) && !empty($_POST['password']) &&
		!empty ($_POST['password2']) && !empty($_POST['phone']) && !empty($_POST['plan'])){
			
			if ($_POST['password'] != $_POST['password2']){
				echo "Votre mot de passe n'est pas identique dans les deux champs";
			} else {
				include ('./Model/Msubscribe.php');
				/*SCRIPTS SHELLS*/

				$mdp=md5($_POST['password']);
				
				$name = explode(".", $_POST['name']);
				$name = $name[0];

				/*CREATION DU MEMBRE DANS LA BASE DE DONNEES */
				$user = create_user($name, $_POST['pseudo'], $_POST['email'], $_POST['firstname'], $_POST['lastname'], $mdp, $_POST['telephone']);
				
				/*CREATION DE L'UTILISATEUR SUR LE SERVEUR */
				$name = escapeshellarg($name);
				$pseudo = escapeshellarg($_POST['pseudo']);
				$pass = escapeshellarg($_POST['password']);
				$mail = escapeshellarg($_POST['email']);

				$exec_fileDNS = sprintf('sudo /var/www/Myshop/www/Server/add_fileDNS.sh %s', $name);
				$exec_mailDirectory = sprintf('sudo /var/www/Myshop/www/Server/add_mailDirectory.sh %s %s', $pseudo, $pass);
				$exec_webUser = sprintf('sudo /var/www/Myshop/www/Server/add_webUser.sh %s %s %s', $pseudo, $pass, $name);
				
				// Execution des commande
				exec($exec_fileDNS);
				exec($exec_mailDirectory);
				exec($exec_webUser);


				$msg = "Compte enregistré";
				include ('./Viewer/Vsubscribe_step2.php');
			}
		}else{
			echo "Vous n'avez pas rempli tous les champs";
		}
	}else{
		echo "Erreur d'inscription";
	}
}else if ($_GET['index'] == "subscrice_step2") {
	
	//$name = escapeshellarg($name);
	//$pass = escapeshellarg($_POST['password']);
	//$mail = escapeshellarg($_POST['email']);

	//$exec_prestashop = sprintf('sudo /var/www/Myshop/www/Server/install_prestashop.sh %s %s %s', $name, $pass, $mail);
	//exec($exec_prestashop);

	$msg = "Base de données enregistré";
	include ('./Viewer/Vsubscribe_step3')
}else if ($_GET['index'] == "subscribe_step3") {
	
	//CODE
	
}
}else{
	echo "Erreur de redirection";
}

?>