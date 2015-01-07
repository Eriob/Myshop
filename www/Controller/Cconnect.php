<?php
	include ('/Model/Mconnect.php');

	// On vérifie si la combinaison pseudo/pwd est correct
	if (isset($_POST['pseudo'],$_POST['password']))
	{		
			$connect = connect($_POST['pseudo'],$_POST['password'])
	
	if ($_POST['password'] == $connect['password'])
	{
		$_SESSION['pseudo'] = $connect['pseudo'];
		$_SESSION['id'] = $connect['id'];
			
			sleep(1);
			header('location: index.php');
	}


	else
	{
		echo Mauvais mot de passe;
		sleep(1);
		header('location: index.php');		
	}
	
	}

?>