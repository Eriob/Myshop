<?php

//CONNEXION A MYSQL
mysql_connect('localhost', 'root', 'admin')
or die ('ERROR TO CONNECT WITH DATABASE');

//SELECTION DE LA BDD
mysql_select_db('myshop')
or die ('ERROR NAME DATABASE');

?>