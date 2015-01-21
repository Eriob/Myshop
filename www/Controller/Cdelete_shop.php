<?php

include ('./Model/MconnectBDD.php');
include ('./Model/Mdelete_shop.php');

	delete_shop($_SESSION['name']);
	session_destroy();

	$name = escapeshellcmd($_SESSION['name']);

	$exec_fileDNS = sprintf('/var/www/Myshop/www/Server/delete_fileDNS.sh %s', $name);
	$exec_mailDirectory = sprintf('/var/www/Myshop/www/Server/delete_mailDirectory.sh %s', $name);
	$exec_webUser = sprintf('/var/www/Myshop/www/Server/delete_webUser.sh %s %s', $name, $name);
					
	// Execution des commande
	exec($exec_fileDNS);
	exec($exec_mailDirectory);
	exec($exec_webUser);

	header('location:index.php');

?>