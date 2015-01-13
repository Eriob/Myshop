<?php

if (isset($_SESSION['pseudo'])) {
	include('./Model/MconnectBDD.php');
	include('./Model/Mshow_mywebsite.php');

	$name = show_mywebsite($_SESSION['pseudo']);
	header('location: http://'.$name.'.myshop.itinet.fr');

}

?>