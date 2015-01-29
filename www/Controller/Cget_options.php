<?php

include('./Model/MconnectBDD.php');
include('./Model/Mget_options.php');

if (isset($_POST['addmail'])) {
	
	$pseudo = $_POST['addmail'];
	$_POST['addmail'] = $_POST['addmail']."@".$_SESSION['name'].".myshop.itinet.fr";
	$mailBDD = add_mails($_SESSION['name'], $_POST['addmail']);
	
	$name = escapeshellcmd($_SESSION['name']);
	$pseudo = escapeshellcmd($pseudo);
	$password = escapeshellcmd($_POST['password']);

	$exec_addmail = sprintf('/var/www/Myshop/www/Server/add_mailDirectoryPLUS.sh %s $s $s', $pseudo, $name, $password);

	// Execution des commande
	exec($exec_addmail);
}

$count = count_mails($_SESSION['name']);
$options = show_mails($_SESSION['name']);

include('./Viewer/Vget_options.php');

?>