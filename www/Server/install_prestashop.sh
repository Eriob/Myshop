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

	sudo /bin/cp /var/sftp/myshop/prestashop/* /var/sftp/$1/www/
	php /var/sftp/$1/www/install/index_cli.php --domain=$1.myshop.itinet.fr --db_name=$1 --db_user=$1 --db_password=$2 --email=$3 --password=$2
	sudo /bin/mv /var/sftp/$1/www/admin admin5100
	sudo /bin/rm -r /var/sftp/$1/www/install
	sudo /bin/chmod -R 777 /var/sftp/$1/www
