#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des boite mails
# Role : Automatiser la creation des boite mails
#------------------------------------------------------------

function delete_webUSser {

# ROLE : SUPPRIME UN UTILISATEUR ET SA BOUTIQUE

#On prendra en entrée :
#$1 : le nom de la boutique
#$2 : le nom de l'utilisateur

if [[ -d /var/sftp/$1 && -f "/etc/apache2/sites-enabled/$1" ]]; then
	# On supprime le site $1
	/bin/rm /var/sftp/$1/www
	/usr/bin/unlink /etc/apache2/sites-enabled/$1
	/bin/rm /etc/apache2/sites-available/$1
else
	/bin/echo "Impossible de supprimer, cet utilisateur n'existe pas [ECHEC]"
fi

if /bin/grep "^$2:" /etc/passwd; then
	#On supprime la ligne dans le fichier DNS
	/bin/sed "/^$2:/d" /etc/passwd >> /etc/sauv_passwd
	/bin/cp /etc/sauv_passwd /etc/passwd
	/bin/rm /etc/sauv_passwd
else
	/bin/echo "Cet utilisateur n'existe pas ! [ECHEC]"
fi

#REDEMARRAGE DU SERVICE APACHE2
#---------------------------------------------------------------
/etc/init.d/apache2 restart
#---------------------------------------------------------------

}