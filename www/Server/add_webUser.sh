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

if /bin/grep "^$1:" /etc/passwd ; then
	/bin/echo "Cet utilisateur UNIX existe déjà ! [ECHEC]"
else
	/usr/sbin/useradd --home /var/sftp/$1 --gid 5001 --groups 5001 --password "$(mkpasswd "$2")" --shell /bin/MySecureShell $1
		
	if [[ -d "/var/sftp/$1" ]]; then
		/bin/echo "Répertoire /var/sftp/$1 déja crée [OK]"
	else
		/bin/mkdir /var/sftp/$1/
		/bin/mkdir /var/sftp/$1/www 

		/bin/chown -R $1:sftp /var/sftp/$1

		/usr/sbin/edquota -p test $1
	fi

	if [[ -d "/etc/apache2/sites-available/$3" ]]; then
		/bin/echo "Virtualhost déjà crée [OK]"
	else
		/bin/echo "<VirtualHost *:80>
				ServerName $3.myshop.itinet.fr
				DocumentRoot /var/sftp/$1/www
				Errorlog /var/log/apache2/$3.myshop.itinet.fr-error_log
				</VirtualHost>" > /etc/apache2/sites-available/$3
		/bin/ln -s /etc/apache2/sites-available/$3 /etc/apache2/sites-enabled/
	fi
fi

#REDEMARRAGE DU SERVICE APACHE2
#---------------------------------------------------------------
/etc/init.d/apache2 restart
#---------------------------------------------------------------