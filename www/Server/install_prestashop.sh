#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation d'installation de prestashop
# Role : Automatiser l'installation de prestashop
#------------------------------------------------------------

# ROLE : INSTALLER PRESTASHOP

#On prendra en entr�e :
#$1 : le nom de la boutique
#$2 : le mot de passe de l'utilisateur
#$3 : l'adresse email

	sudo /usr/bin/mysql -u root -padmin -Bse "CREATE DATABASE $1;CREATE USER $1@localhost;SET PASSWORD FOR $1@localhost = PASSWORD('$2')"
	sudo /bin/cp -r /var/sftp/myshop/prestashop/* /var/sftp/$1/www/
	
	#sudo /usr/bin/php /var/sftp/$1/www/install/index_cli.php --domain=$1.myshop.itinet.fr --db_name=$1 --db_user=$1 --db_password=$2 --email=$3 --password=$2
	#sudo /bin/mv -r /var/sftp/$1/www/admin /var/sftp/$1/www/admin5100
	#sudo /bin/rm -r /var/sftp/$1/www/install
	#sudo /bin/chmod -R 777 /var/sftp/$1/www

	sudo /etc/init.d/apache2 restart
