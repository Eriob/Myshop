<?php

include ('./Model/MconnectBDD.php');

	if (isset($_GET['index'])) {
		if ($_GET['index'] == "subscribe") {
			$_POST['name'] = $_POST['nom'];
			include('./Viewer/Vsubscribe.php');
		}elseif ($_GET['index'] == "valid_subscribe") {
			if(isset($_POST['name']) || isset($_POST['pseudo']) || isset($_POST['email']) || isset($_POST['firstname']) || isset($_POST['lastname']) || isset($_POST['password']) ||
 			isset($_POST['password2']) || isset($_POST['phone']) || isset($_POST['plan'])){
 
				if(!empty ($_POST['name']) && !empty ($_POST['pseudo']) && !empty ($_POST['email']) && !empty($_POST['firstname']) && !empty ($_POST['lastname']) && !empty($_POST['password']) &&
				!empty ($_POST['password2']) && !empty($_POST['phone']) && !empty($_POST['plan'])){
			
					if ($_POST['password'] != $_POST['password2']){
						echo "Votre mot de passe n'est pas identique dans les deux champs";
					} else {
						include ('./Model/Msubscribe.php');
						/*SCRIPTS SHELLS*/
						include ('./Server/manage_users.sh');
						include ('./Server/manage_documentRoot.sh');
						include ('./Server/manage_fileDNS.sh');
						include ('./Server/manage_mail.sh');

						$mdp=md5($_POST['password']);
						/*CREATION DU MEMBRE DANS LA BASE DE DONNEES */
						$user = create_user($_POST['pseudo'], $mdp, $_POST['mail'], $_POST['nom'], $_POST['prenom'], $_POST['daten'], $_POST['adresse'], $_POST['ville'], $_POST['cp'], $_POST['question'], $_POST['reponse'], $_POST['telephone']);
						/*CREATION DE L'UTILISATEUR SUR LE SERVEUR */
						$user = create_userUnix($_POST['pseudo'], $_POST['password']);
						$user = create_documentRoot($_POST['name']);
						$user = create_mailDirectory($_POST['pseudo'], $_POST['password']);
						$user = addline_fileDNS($_POST['name']);
						include ('./Controller/Cindex.php');
					}
				}else{
					echo "Vous n'avez pas rempli tous les champs";
				}
			}else{
				echo "Erreur d'inscription";
			}
		}else{
			include('./Viewer/Vsubscribe.php');
			echo "Erreur de redirection";
		}
?>