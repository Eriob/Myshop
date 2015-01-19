<?php
	include ('./Model/Mconnect.php');

	// On vérifie si la combinaison name/pwd est correct
	if (isset($_POST['name'],$_POST['password'])) {		
		$password = md5($_POST['password']);
		$connect = connect($_POST['name'],$password);
	
		if ($password == $connect['password']) {
			$_SESSION['name'] = $connect['shop'];
			$_SESSION['id'] = $connect['id'];
				
			sleep(1);
		
		function curPageURL() {
			$pageURL = strstr ( $_SERVER['HTTP_REFERER'] , '/');
			return $pageURL;
		}
		
		$page = curPageURL();
		
		if(isset($page)){
			header('location: '.$page);
		}else{		
			header('location: index.php');
		}
		
		}else{
			$msg = "Mauvais mot de passe";
			sleep(1);
			header('location: index.php');		
		}	
	}

?>