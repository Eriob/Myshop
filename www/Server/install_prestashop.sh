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

	/usr/bin/mysql -u root -padmin -Bse "CREATE DATABASE $1;CREATE USER $1@localhost;SET PASSWORD FOR $1@localhost = PASSWORD('$2')"
	
	#COPIER L'INTEGRALITE DE PRESTASHOP
	sudo /bin/cp -r /var/sftp/myshop/prestashop/* /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/admin /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/cache /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/classes /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/config /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/controllers /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/css /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/docs /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/download /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/img /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/install /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/js /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/localization /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/log /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/mails /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/modules /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/override /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/pdf /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/themes /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/tools /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/translations /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/upload /var/sftp/$1/www/
	sudo /bin/cp /var/sftp/myshop/prestashop/webservice /var/sftp/$1/www/

	sudo /bin/chown -R www-data.www-data /var/sftp/$1/www/*
	sudo /bin/chmod -R 777 /var/sftp/$1/www/*
	sudo /bin/echo $1 $2 $3
	sudo /usr/bin/php /var/sftp/$1/www/install/index_cli.php --domain=$1.myshop.itinet.fr --db_name=$1 --db_user=$1 --db_password=$2 --password=$2
	sudo /bin/mv /var/sftp/$1/www/admin /var/sftp/$1/www/admin5100
	#sudo /bin/rm -r /var/sftp/$1/www/install
	sudo /bin/chmod -R 777 /var/sftp/$1/www

	sudo /etc/init.d/apache2 restart
