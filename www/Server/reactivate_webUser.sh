#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des boite mails
# Role : Automatiser la creation des boite mails
#------------------------------------------------------------

# ROLE : REACTIVE LE VIRTUALHOST D'UNE BOUTIQUE

#On prendra en entrée :
#$1 : le nom de la boutique

if test -f "/etc/apache2/sites-available/$1"; then
	# On réactive le site
	sudo /bin/ln -s /etc/apache2/sites-available/$1 /etc/apache2/sites-enabled/
else
	sudo /bin/echo "Impossible de réactiver, cet utilisateur n'existe pas [ECHEC]"
fi

#REDEMARRAGE DU SERVICE APACHE2
#---------------------------------------------------------------
/etc/init.d/apache2 restart
#---------------------------------------------------------------