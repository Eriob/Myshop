<?php

function show_mails($name) {

	$sql = "SELECT * FROM mails WHERE name ='$name'";
	$request = mysql_query($sql) or die(mysql_error());

	$i = 0;

	while($mails = mysql_fetch_array($request)){

		$i++;
		echo "<div class=\"form-group\">
                <label for=\"email\" class=\"control-label\">Adresse Email".$i."</label>
                <input type=\"email\" name=\"email\" class=\"form-control\" value=\"<?php echo $mails['mail']?>\" readonly>
              </div>";
	}
}

?>