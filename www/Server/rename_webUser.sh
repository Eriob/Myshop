#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des boite mails
# Role : Automatiser la creation des boite mails
#------------------------------------------------------------

rename_webUser()
{
# ROLE : MET A JOUR LE VIRTUALHOST D'UNE BOUTIQUE

#On prendra en entrée :
#$1 : le nom de l'utilisateur
#$2 : l'ancien nom de la boutique
#$3 : le nouveau nom de la boutique


if [[ -f "/etc/apache2/sites-available/$2" ]]; then
	# On renomme $2 en $3 ($2 = ancien nom / $3 = nouveau nom)
	/bin/rm /etc/apache2/sites-enabled/$2
	/bin/rm /etc/apache2/sites-available/$2
	/bin/echo "<VirtualHost *:80>
			ServerName $3.myshop.itinet.fr
			DocumentRoot /var/sftp/$1/www
			Errorlog /var/log/apache2/$3.myshop.itinet.fr-error_log
			</VirtualHost>" > /etc/apache2/sites-available/$3
	/bin/ln -s /etc/apache2/sites-available/$3 /etc/apache2/sites-enabled/
else
	/bin/echo "Impossible de renommer, cet boutique n'existe pas ! [ECHEC]"
fi

#REDEMARRAGE DU SERVICE APACHE2
#---------------------------------------------------------------
/etc/init.d/apache2 restart
#---------------------------------------------------------------
}