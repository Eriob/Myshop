#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des webUsers
# Role : Automatiser la creation des webUsers
#------------------------------------------------------------

# ROLE : CREER UN UTILISATEUR UNIX, SON REPERTOIRE PERSONNEL ET SON VIRTUALHOST

#On prendra en entrée :
#$1 : le nom de l'utilisateur
#$2 : le mot de passe de l'utilisateur
#$3 : le nom de la boutique

if /bin/grep "^$1:" /etc/passwd; then
	sudo /bin/echo "Cet utilisateur UNIX existe déjà ! [ECHEC]"
else
	sudo /usr/sbin/useradd --home /var/sftp/$1 --gid 5001 --groups 5001 --password "$(mkpasswd "$2")" --shell /bin/MySecureShell $1
		
	if test -d "/var/sftp/$1"; then
		sudo /bin/echo "Répertoire /var/sftp/$1 déja crée [OK]"
	else
		sudo /bin/mkdir /var/sftp/$1/
		sudo /bin/mkdir /var/sftp/$1/www 

		sudo /bin/chown -R $1:sftp /var/sftp/$1
		sudo /bin/chown -R www-data:www-data /var/sftp/$1/www

		sudo /usr/sbin/edquota -p test $1
	fi

	if test -d "/etc/apache2/sites-available/$3"; then
		sudo /bin/echo "Virtualhost déjà crée [OK]"
	else
		sudo /bin/echo "<VirtualHost *:80>
				ServerName $3.myshop.itinet.fr
				DocumentRoot /var/sftp/$1/www
				Errorlog /var/log/apache2/$3.myshop.itinet.fr-error_log
				</VirtualHost>" | sudo tee -a /etc/apache2/sites-available/$3
		sudo /bin/ln -s /etc/apache2/sites-available/$3 /etc/apache2/sites-enabled/
		
		sudo /etc/init.d/apache2 restart
	fi
fi