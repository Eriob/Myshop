#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des boite mails
# Role : Automatiser la creation des boite mails
#------------------------------------------------------------

# ROLE : CREER UNE BOITE DE MESSAGERIE PERSONNEL

#On prendra en entrée :
#$1 : le nom de l'utilisateur
#$2 : le nom de la boutique
#$3 : le mot de passe de l'utilisateur

if test -d "/var/mail/$2/$1"; then
	sudo /bin/echo "Ce repertoire existe déjà [ECHEC]"
else
	sudo /bin/mkdir /var/mail/$2/$1

	#PAS BESOIN CAR ON ENVOI UN MAIL
	sudo /usr/bin/maildirmake /var/mail/$2/$1/Maildir

	sudo /bin/chown -R vmail.vmail /var/mail/$2/$1

	sudo /bin/echo "$1@$2.myshop.itinet.fr $1/Maildir/" | sudo tee -a /etc/postfix/vmailbox
	sudo /usr/sbin/postmap /etc/postfix/vmailbox

	sudo /usr/sbin/userdb $1@$2.myshop.itinet.fr set uid=5000 gid=5000 home=/var/mail/$2/$1 mail=/var/mail/$2/$1/Maildir
	sudo /bin/echo "$3" | sudo /usr/sbin/userdbpw -md5 | sudo /usr/sbin/userdb $1@$2.myshop.itinet.fr set systempw
	sudo /usr/sbin/makeuserdb
fi