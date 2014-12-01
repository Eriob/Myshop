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

		if [[ -d "/var/mail/$1" ]]; then
			echo "Ce repertoire existe déjà"
		else
			echo "Création du répertoire /var/mail/$1 en cours..."
			mkdir /var/mail/$1
			echo "Création [OK]"

			#PAS BESOIN CAR ON ENVOI UN MAIL
			maildirmake -f ./Maildir

			echo "Modification des droits sur /var/mail/$1 en cours..."
			chown -R vmail.vmail /var/mail/$1
			echo "Modification [OK]"

			echo "Mise à jour vmailbox : ajout de $1@myshop.itinet.fr $1/Maildir en cours..."
			echo "$1@myshop.itinet.fr $1/Maildir/" >> /etc/postfix/vmailbox
			echo "Mise à jour [OK]"
			echo "Postmap en cours..."
			postmap /etc/postfix/vmailbox
			echo "Postmap [OK]"

			echo "UserDB en cours..."
			userdb $1@myshop.itinet.fr set uid=5000 gid=5000 home=/var/mail/$1 mail=/var/mail/$1/Maildir
			echo "$2" | userdbpw -md5 | userdb $1@myshop.itinet.fr set systempw
			makeuserdb
			echo "UserDB [OK]"

			echo "Redemarrage des services postfix en cours..."
			/etc/init.d/postfix restart

			echo "On envoi un mail de bienvenue"
			#echo "Bienvenue sur MySHOP, vous pouvez des maintenant vous connectez sur http://myshop.itinet.fr et créer votre boutique en ligne en quelques minutes. 
			#L'équipe MySHOP (Ne pas répondre)" | mailx -s "Bienvenue sur MySHOP" $1@myshop.itinet.fr
			echo "Envoi [FAIL]"
			echo "[FIN]"
		fi
}

function manage_mailDirectory() {

#On prendra en entrée :
#$1 : le nom de l'utilisateur
#$2 : le password de l'utilisateur

	if [[ -d "/var/mail/$1" ]]; then
		#On supprime le répertoire mail
		echo "Suppression de /var/mail/$1 en cours..."
		rm -r /var/mail/$1
		echo "Suppression [OK]"

		echo "Suppression de $1@myshop.itinet.fr de vmailbox"
		sed "/^$1/d" /etc/postfix/vmailbox >> /etc/postfix/sauv.vmailbox
		cp /etc/postfix/sauv.vmailbox /etc/postfix/vmailbox
		rm /etc/postfix/sauv.vmailbox
		echo "Suppression [OK]"

		echo "Postmap en cours..."
		postmap /etc/postfix/vmailbox
		echo "Postmap [OK]"

		echo "Suppression de $1@myshop.itinet.fr dans UserDB en cours..."
		sed "/^$1/d" /etc/courier/userdb >> /etc/courier/sauv.userdb
		cp /etc/courier/sauv.userdb /etc/courier/userdb
		rm /etc/postfix/sauv.userdb
		makeuserdb
		echo "UserDB [OK]"

		echo "Redemarrage des service postfix en cours..."
		/etc/init.d/postfix restart
	else
		echo "Ce répertoire mail n'existe pas [ECHEC]"
	fi

}