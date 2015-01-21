<?php


function delete_shop($name) {

$sql = "DELETE FROM users WHERE shop ='".$name."'";
$request = mysql_query($sql) or die (mysql_error());

$sql2 = "DROP DATABASE '".$name."'";
$request2 = mysql_query($sql2) or die(mysql_error());


}

?>