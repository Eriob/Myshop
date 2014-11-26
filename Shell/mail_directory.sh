#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation création mail directory + envoi mail
# Role : Automatiser la création d'une boite mail
#------------------------------------------------------------



function create_MailDirectory() {

#On prendra en entrée :
#$1 : le nom de l'utilisateur
#$2 : le password de l'utilisateur

		cd /var/mail

		if [[ test -e $1 ]]; then
			echo "Ce repertoire existe déjà"
		else
			mkdir $1
			cd ./$1
			maildirmake -f ./Maildir
			chown -R vmail.vmail /var/mail/$1

			cd /etc/postfix/
			echo "$1@myshop.itinet.fr $1" >> ./vmailbox
			postmap vmailbox

			userdb $1@myshop.itinet.fr set uid=vmail gid=vmail home=/var/mail/$1 mail=/var/mail/$1/Maildir
			echo "$2" | userdbpw -md5 | userdb $1@myshop.itinet.fr set systempw
			makeuserdb

			/etc/init.d/postfix restart && /etc/init.d/courier-imap restart
		fi

}

function send_FirstMail() {

echo "Bienvenue sur MySHOP, vous pouvez des maintenant vous connectez sur http://myshop.itinet.fr et créer votre boutique en ligne en quelques minutes. 
L'équipe MySHOP (Ne pas répondre)" | mailx -s "Bienvenue sur MySHOP" $1@myshop.itinet.fr

}