<?php

include('./Model/MconnectBDD.php');
include('./Model/Mget_options.php');

if (isset($_POST['addmail'])) {
	$_POST['addmail'] = $_POST['addmail']."@".$_SESSION['name'].".myshop.itinet.fr";
	$pass = add_mails($_SESSION['name'], $_POST['addmail']);
	
	$name = escapeshellcmd($_SESSION['name']);
	$pseudo = escapeshellcmd($_POST['addmail']);
	$password = escapeshellcmd($pass);

	$exec_addmail = sprintf('/var/www/Myshop/www/Server/add_mailDirectoryPLUS.sh %s $s $s', $pseudo, $name, $password);
	
	// Execution des commande
	exec($exec_addmail);
}

$count = count_mails($_SESSION['name']);
$options = show_mails($_SESSION['name']);

include('./Viewer/Vget_options.php');

?>