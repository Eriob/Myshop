<?php

include('./Model/MconnectBDD.php');

if (isset($_SESSION['pseudo'])) {
	include('./Model/Mget_informations.php');

	$my_informations = get_informations($_SESSION('id'));

	include('./Viewer/Vget_informations.php');
	
}else{
	$msg = "Problème de redirection";
	header('location: index.php');
}

?>