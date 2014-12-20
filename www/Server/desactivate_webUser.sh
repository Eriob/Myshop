#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des boite mails
# Role : Automatiser la creation des boite mails
#------------------------------------------------------------

# ROLE : DESACTIVE LE VIRTUALHOST D'UNE BOUTIQUE

#On prendra en entrée :
#$1 : le nom de la boutique

if test -f "/etc/apache2/sites-enabled/$1"; then
	# On desactive le site $1 ($1 = nom du repertoire)
	sudo /usr/bin/unlink /etc/apache2/sites-enabled/$1
	sudo /etc/init.d/apache2 restart
else
	sudo /bin/echo "Impossible de désactiver, ce site n'existe pas ! [ECHEC]"
fi
