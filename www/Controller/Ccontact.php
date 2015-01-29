<?php

if($_GET['index'] == "valid_contact") {
	if (isset($_POST['lastname']) || isset($_POST['firstname']) || isset($_POST['email']) || isset($_POST['message'])) {
		if (!empty($_POST['lastname']) && !empty($_POST['firstname']) && !empty($_POST['email']) && !empty($_POST['message'])) {
			 // Plusieurs destinataires
		     $to  = 'webmaster@myshop.itinet.fr';

		     // Sujet
		     if (isset($_POST['firstname'])) {
		     	$subject = "Message de ".$_POST['firstname'];
		     }else {
		     	$subject = "Message d'un membre";
		     }

		     // message
		     $message = '
		     <html>
		      <head>
		       <title>Un utilisateur a un message pour vous</title>
		      </head>
		      <body>
		       <p>'.$_POST['message'].'</p>
		      </body>
		     </html>
		     ';

		     // Pour envoyer un mail HTML, l'en-tête Content-type doit être défini
		     $headers  = 'MIME-Version: 1.0' . "\r\n";
		     $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

		     // En-têtes additionnels
		     $headers .= 'To: webmaster <webmaster@myshop.itinet.fr>' . "\r\n";
		     $headers .= 'From: form_contact <webmaster@myshop.itinet.fr>' . "\r\n";

		     // Envoi
		     mail($to, $subject, $message, $headers);
			
		}else{
		
			$msg = "Vous n'avez pas rempli tous les champs";
			header('location: index.php');
		}
	}
}else{
	include('./Viewer/Vcontact.php');
}

?>