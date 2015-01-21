#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des boite mails
# Role : Automatiser la creation des boite mails
#------------------------------------------------------------

#ROLE : SUPPRIME UNE BOITE DE MESSAGERIE PERSONNEL

#On prendra en entrée :
#$1 : le nom de l'utilisateur

	if test -d "/var/mail/$1"; then
		#On supprime le répertoire mail
		sudo /bin/rm -r /var/mail/$1

		sudo /bin/sed -i "/^$1/d" /etc/postfix/vmailbox
		sudo /usr/sbin/postmap /etc/postfix/vmailbox

		sudo /bin/sed -i "/^$1/d" /etc/courier/userdb
		sudo /usr/sbin/makeuserdb

	else
		sudo /bin/echo "Ce répertoire mail n'existe pas [ECHEC]"
	fi