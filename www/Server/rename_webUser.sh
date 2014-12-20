#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des boite mails
# Role : Automatiser la creation des boite mails
#------------------------------------------------------------

# ROLE : MET A JOUR LE VIRTUALHOST D'UNE BOUTIQUE

#On prendra en entrée :
#$1 : le nom de l'utilisateur
#$2 : l'ancien nom de la boutique
#$3 : le nouveau nom de la boutique


if test -f "/etc/apache2/sites-available/$2"; then
	# On renomme $2 en $3 ($2 = ancien nom / $3 = nouveau nom)
	sudo /bin/rm /etc/apache2/sites-enabled/$2
	sudo /bin/rm /etc/apache2/sites-available/$2
	sudo /bin/echo "<VirtualHost *:80>
			ServerName $3.myshop.itinet.fr
			DocumentRoot /var/sftp/$1/www
			Errorlog /var/log/apache2/$3.myshop.itinet.fr-error_log
			</VirtualHost>" | sudo tee -a /etc/apache2/sites-available/$3
	sudo /bin/ln -s /etc/apache2/sites-available/$3 /etc/apache2/sites-enabled/
else
	sudo /bin/echo "Impossible de renommer, cet boutique n'existe pas ! [ECHEC]"
fi

#REDEMARRAGE DU SERVICE APACHE2
#---------------------------------------------------------------
/etc/init.d/apache2 restart
#---------------------------------------------------------------