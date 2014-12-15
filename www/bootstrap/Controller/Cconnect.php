<?php
	include ('/Model/MconnectBDD.php');

	if (isset($_POST['pseudo'],$_POST['password'])) {
			$_SESSION['pseudo'] = $_POST['pseudo'];
			sleep(1);
			header('location: index.php');
	} else {
		//MAUVAIS MDP
	}

?>