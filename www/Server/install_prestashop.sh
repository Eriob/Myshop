#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation d'installation de prestashop
# Role : Automatiser l'installation de prestashop
#------------------------------------------------------------

# ROLE : INSTALLER PRESTASHOP

#On prendra en entrée :
#$1 : le nom de la boutique
#$2 : le mot de passe de l'utilisateur
#$3 : l'adresse email

	$username = $1;
	$password = $2;
	$mail = $3;

	sudo /bin/cp /var/sftp/myshop/prestashop/* /var/sftp/$username/www/
	php /var/sftp/$username/www/install/index_cli.php --domain=$username.myshop.itinet.fr --db_name=$username --db_user=$username --db_password=$password --email=$mail --password=$password
	sudo /bin/mv /var/sftp/$username/www/admin admin5100
	sudo /bin/rm -r /var/sftp/$username/www/install
	sudo /bin/chmod -R 777 /var/sftp/$username/www
