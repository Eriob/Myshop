<?php

if (isset($_SESSION['name'])) {
	include('./Model/MconnectBDD.php');
	include('./Model/Mshow_mywebsite.php');

	$name = show_mywebsite($_SESSION['name']);
	header('location: http://'.$name.'.myshop.itinet.fr');

}

?>