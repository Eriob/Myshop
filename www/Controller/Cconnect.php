<?php
	include ('/Model/Mconnect.php');

	// On vérifie si la combinaison pseudo/pwd est correct
	if (isset($_POST['pseudo'],$_POST['password']))
	{		$password = md5($_POST['password']);
			$connect = connect($_POST['pseudo'],$password)
	
	if ($password == $connect['password'])
	{
		$_SESSION['pseudo'] = $connect['pseudo'];
		$_SESSION['id'] = $connect['id'];
			
			sleep(1);
			/* header('location: index.php');*/
			
	/*LIGNES DE TEST*/
	echo $_SESSION['pseudo'];
	echo $_SESSION['id'];
	
	}


	else
	{
		echo Mauvais mot de passe;
		sleep(1);
		/*header('location: index.php');*/		
	}
	
	}

?>