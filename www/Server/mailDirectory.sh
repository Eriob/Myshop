#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des boite mails
# Role : Automatiser la creation des boite mails
#------------------------------------------------------------

function add_mailDirectory {

# ROLE : CREER UNE BOITE DE MESSAGERIE PERSONNEL

#On prendra en entrée :
#$1 : le nom de l'utilisateur
#$2 : le mot de passe de l'utilisateur

if [[ -d "/var/mail/$1" ]]; then
	/bin/echo "Ce repertoire existe déjà [ECHEC]"
else
	/bin/mkdir /var/mail/$1

	#PAS BESOIN CAR ON ENVOI UN MAIL
	/usr/bin/maildirmake -f ./Maildir

	/bin/chown -R vmail.vmail /var/mail/$1

	/bin/echo "$1@myshop.itinet.fr $1/Maildir/" >> /etc/postfix/vmailbox
	/usr/sbin/postmap /etc/postfix/vmailbox
	/usr/sbin/userdb $1@myshop.itinet.fr set uid=5000 gid=5000 home=/var/mail/$1 mail=/var/mail/$1/Maildir
	/bin/echo "$2" | /usr/sbin/userdbpw -md5 | /usr/sbin/userdb $1@myshop.itinet.fr set systempw
	/usr/sbin/makeuserdb

	/bin/echo "On envoi un mail de bienvenue"
	#echo "Bienvenue sur MySHOP, vous pouvez des maintenant vous connectez sur http://myshop.itinet.fr et créer votre boutique en ligne en quelques minutes. 
	#L'équipe MySHOP (Ne pas répondre)" | mailx -s "Bienvenue sur MySHOP" $1@myshop.itinet.fr
fi

}

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

}

/etc/init.d/postfix restart