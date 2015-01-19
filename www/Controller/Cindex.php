<?php
	include('./Model/MconnectBDD.php');

	if (isset($_SESSION['name'])) {
		include ('./Viewer/Vlobby.php');
	}else{
		include('./Viewer/Vindex.php');
	}
?>