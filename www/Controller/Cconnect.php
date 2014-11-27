<?php
	include ('/Model/MconnectBDD.php');

	// On vérifie si la combinaison pseudo/pwd est correct
	if (isset($_POST['pseudo'],$_POST['password'])) {
			$_SESSION['pseudo'] = $_POST['pseudo'];
			sleep(1);
			header('location: index.php');
	} else {
		//MAUVAIS MDP
	}

?>