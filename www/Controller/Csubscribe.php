<?php

if ($_GET['index'] == "subscribe") {

	include('./Viewer/Vsubscribe.php');

}elseif ($_GET['index'] == "valid_subscribe") {
	
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
				$nom = explode(".", $_POST['name']);
				$nom = $nom[0];
				/*CREATION DU MEMBRE DANS LA BASE DE DONNEES */
				$user = create_user($nom, $_POST['pseudo'], $_POST['email'], $_POST['firstname'], $_POST['lastname'], $mdp, $_POST['telephone']);
					
				/*CREATION DATABASE USER*/
				$database = install_prestashop($nom, $_POST['password']);

				/*CREATION DE L'UTILISATEUR SUR LE SERVEUR */
				$name = escapeshellarg($nom);
				$pseudo = escapeshellarg($_POST['pseudo']);
				$pass = escapeshellarg($_POST['password']);
				$mail = escapeshellarg($_POST['email']);

				$exec_fileDNS = sprintf('sudo /var/www/Myshop/www/Server/add_fileDNS.sh %s', $name);
				$exec_mailDirectory = sprintf('sudo /var/www/Myshop/www/Server/add_mailDirectory.sh %s %s', $pseudo, $pass);
				$exec_webUser = sprintf('sudo /var/www/Myshop/www/Server/add_webUser.sh %s %s %s', $pseudo, $pass, $name);
				$exec_prestashop = sprintf('sudo /var/www/Myshop/www/Server/install_prestashop.sh %s %s %s', $name, $pass, $mail);

				// Execution des commande
				exec($exec_fileDNS);
				exec($exec_mailDirectory);
				exec($exec_webUser);
				exec($exec_prestashop);

				$msg = "Compte enregistré";
				include ('./Controller/Cindex.php');
			}
		}else{
			echo "Vous n'avez pas rempli tous les champs";
		}
	}else{
		echo "Erreur d'inscription";
	}
}else{
	echo "Erreur de redirection";
}

?>