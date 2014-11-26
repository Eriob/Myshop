#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation création mail directory + envoi mail
# Role : Automatiser la création d'une boite mail
#------------------------------------------------------------


function create_mailDirectory() {

#On prendra en entrée :
#$1 : le nom de l'utilisateur
#$2 : le password de l'utilisateur

		if [[ test -e /var/mail/$1 ]]; then
			echo "Ce repertoire existe déjà"
		else
			echo "On crée le répertoire /var/mail/$1"
			mkdir /var/mail/$1
			echo "Création [OK]"

			#PAS BESOIN CAR ON ENVOI UN MAIL
			#maildirmake -f ./Maildir
			
			echo "On envoi un mail de bienvenue"
			echo "Bienvenue sur MySHOP, vous pouvez des maintenant vous connectez sur http://myshop.itinet.fr et créer votre boutique en ligne en quelques minutes. 
L'équipe MySHOP (Ne pas répondre)" | mailx -s "Bienvenue sur MySHOP" $1@myshop.itinet.fr
			echo "Envoi [OK]"

			echo "Modification des droits sur /var/mail/$1"
			chown -R vmail.vmail /var/mail/$1
			echo "Modification [OK]"

			echo "Mise à jour vmailbox : ajout de $1@myshop.itinet.fr $1"
			echo "$1@myshop.itinet.fr $1" >> /etc/postfix/vmailbox
			echo "Mise à jour [OK]"
			echo "Postmap en cours..."
			postmap vmailbox
			echo "Postmap [OK]"

			echo "UserDB en cours..."
			userdb $1@myshop.itinet.fr set uid=vmail gid=vmail home=/var/mail/$1 mail=/var/mail/$1/Maildir
			echo "$2" | userdbpw -md5 | userdb $1@myshop.itinet.fr set systempw
			makeuserdb
			echo "UserDB [OK]"

			echo "Redemarrage des services postfix et imap"
			/etc/init.d/postfix restart && /etc/init.d/courier-imap restart
			echo "[FIN]"
		fi

}
