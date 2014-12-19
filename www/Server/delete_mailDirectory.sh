#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des boite mails
# Role : Automatiser la creation des boite mails
#------------------------------------------------------------


function delete_mailDirectory() {

#ROLE : SUPPRIME UNE BOITE DE MESSAGERIE PERSONNEL

#On prendra en entrée :
#$1 : le nom de l'utilisateur
#$2 : le password de l'utilisateur

	if [[ -d "/var/mail/$1" ]]; then
		#On supprime le répertoire mail
		/bin/rm -r /var/mail/$1

		/bin/sed "/^$1/d" /etc/postfix/vmailbox >> /etc/postfix/sauv.vmailbox
		/bin/cp /etc/postfix/sauv.vmailbox /etc/postfix/vmailbox
		/bin/rm /etc/postfix/sauv.vmailbox

		/usr/sbin/postmap /etc/postfix/vmailbox

		/bin/sed "/^$1/d" /etc/courier/userdb >> /etc/courier/sauv.userdb
		/bin/cp /etc/courier/sauv.userdb /etc/courier/userdb
		/bin/rm /etc/courier/sauv.userdb
		/usr/sbin/makeuserdb

	else
		/bin/echo "Ce répertoire mail n'existe pas [ECHEC]"
	fi

/etc/init.d/postfix restart

}
