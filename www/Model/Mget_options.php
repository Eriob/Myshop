<?php

function count_mails($name) {

	$sql = "SELECT * FROM mails WHERE name ='$name'";
	$request = mysql_query($sql) or die(mysql_error());

	$i = 0;

	while($mails = mysql_fetch_array($request)){

		$i++;
	}

return $i;
}

function show_mails($name) {

	$sql = "SELECT * FROM mails WHERE name ='$name'";
	$request = mysql_query($sql) or die(mysql_error());

	$i = 0;

	while($mails = mysql_fetch_array($request)){

		$i++;
		echo '<div class="form-group">';
        echo '<label for="email" class="control-label">Adresse Email'.$i.'</label>';
        echo '<input type="email" name="email" class="form-control" value="'.$mails['mail'].'" readonly></div>';
	}
}

function add_mails($name, $mail) {

	$sql = 'INSERT INTO mails VALUES ("", "'.$name.'", "'.$mail.'")';
	$request = mysql_query($sql) or die(mysql_error());

}
?>