<?php

include('./Model/MconnectBDD.php');
include('./Model/Mget_options.php');

if (isset($_POST['addmail'])) {
	$_POST['addmail'] = $_POST['addmail']."@".$_SESSION['name'].".myshop.itinet.fr";
	$mail = add_mails($_SESSION['name'], $_POST['addmail']);
}

$count = count_mails($_SESSION['name']);
$options = show_mails($_SESSION['name']);

include('./Viewer/Vget_options.php');

?>