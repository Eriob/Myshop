#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des boite mails
# Role : Automatiser la creation des boite mails
#------------------------------------------------------------

# ROLE : SUPPRIME UN UTILISATEUR ET SA BOUTIQUE

#On prendra en entrée :
#$1 : le nom de la boutique
#$2 : le nom de l'utilisateur

if test -d /var/sftp/$1 && test -f "/etc/apache2/sites-enabled/$1"; then
	# On supprime le site $1
	sudo /bin/rm /var/sftp/$1/www
	sudo /usr/bin/unlink /etc/apache2/sites-enabled/$1
	sudo /bin/rm /etc/apache2/sites-available/$1
else
	sudo /bin/echo "Impossible de supprimer, cet utilisateur n'existe pas [ECHEC]"
fi

if /bin/grep "^$2:" /etc/passwd; then
	#On supprime la ligne dans le fichier DNS
	sudo /bin/sed -i "/^$2:/d" /etc/passwd
else
	sudo /bin/echo "Cet utilisateur n'existe pas ! [ECHEC]"
fi

#REDEMARRAGE DU SERVICE APACHE2
#---------------------------------------------------------------
/etc/init.d/apache2 restart
#---------------------------------------------------------------