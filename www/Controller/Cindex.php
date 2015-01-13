<?php
	include('./Model/MconnectBDD.php');

	if (isset($_SESSION['pseudo'])) {
		include ('./Viewer/Vlobby.php');
	}else{
		include('./Viewer/Vindex.php');
	}
?>