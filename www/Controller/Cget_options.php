<?php

include('./Model/MconnectBDD.php');
include('./Model/Mget_options.php');

$count = count_mails($_SESSION['name']);
$options = show_mails($_SESSION['name']);


?>