<?php

include ('./Model/MconnectBDD.php');
include ('./Model/Mdelete_shop.php');

	$name = escapeshellcmd($_SESSION['name']);
	$pass = escapeshellcmd($_POST['password']);
	$mail = escapeshellcmd($_POST['email']);

	$exec_fileDNS = sprintf('/var/www/Myshop/www/Server/delete_fileDNS.sh %s', $name);
	$exec_mailDirectory = sprintf('/var/www/Myshop/www/Server/delete_mailDirectory.sh %s', $name);
	$exec_webUser = sprintf('/var/www/Myshop/www/Server/delete_webUser.sh %s %s', $name, $name);
					
	// Execution des commande
	exec($exec_fileDNS);
	exec($exec_mailDirectory);
	exec($exec_webUser);

	delete_shop($_POST['name']);
	session_destroy();

	header('location:index.php');


?>