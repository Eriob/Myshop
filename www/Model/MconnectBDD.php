<?php

//CONNEXION A MYSQL
mysql_connect('localhost', 'root', '')
or die ('ERROR CONNEXION AVEC LA BASE DE DONNEE');
//SELECTION DE LA BDD
mysql_select_db('ivasound')
or die ('ERROR NAME BDD');

?>