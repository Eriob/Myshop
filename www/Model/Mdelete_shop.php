<?php


function delete_shop($name) {

$sql = "DELETE FROM users WHERE name ='".$name."'";
$request = mysql_query($sql) or die (mysql_error());


}

?>