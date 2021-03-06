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
			/bin/echo "Ce repertoire existe déjà [ECHEC]"
		else
			/bin/echo "Création du répertoire /var/mail/$1 en cours..."
			/bin/mkdir /var/mail/$1
			/bin/echo "Création [OK]"

			#PAS BESOIN CAR ON ENVOI UN MAIL
			/usr/bin/maildirmake -f ./Maildir

			/bin/echo "Modification des droits sur /var/mail/$1 en cours..."
			/bin/chown -R vmail.vmail /var/mail/$1
			/bin/echo "Modification [OK]"

			/bin/echo "Mise à jour vmailbox : ajout de $1@myshop.itinet.fr $1/Maildir en cours..."
			/bin/echo "$1@myshop.itinet.fr $1/Maildir/" >> /etc/postfix/vmailbox
			/bin/echo "Mise à jour [OK]"
			/bin/echo "Postmap en cours..."
			/usr/sbin/postmap /etc/postfix/vmailbox
			/bin/echo "Postmap [OK]"

			/bin/echo "UserDB en cours..."
			/usr/sbin/userdb $1@myshop.itinet.fr set uid=5000 gid=5000 home=/var/mail/$1 mail=/var/mail/$1/Maildir
			/bin/echo "$2" | /usr/sbin/userdbpw -md5 | /usr/sbin/userdb $1@myshop.itinet.fr set systempw
			/usr/sbin/makeuserdb
			/bin/echo "UserDB [OK]"

			/bin/echo "Redemarrage des services postfix en cours..."
			/etc/init.d/postfix restart

			/bin/echo "On envoi un mail de bienvenue"
			#echo "Bienvenue sur MySHOP, vous pouvez des maintenant vous connectez sur http://myshop.itinet.fr et créer votre boutique en ligne en quelques minutes. 
			#L'équipe MySHOP (Ne pas répondre)" | mailx -s "Bienvenue sur MySHOP" $1@myshop.itinet.fr
			/bin/echo "Envoi [FAIL]"
			/bin/echo "[FIN]"
		fi
}

function manage_mailDirectory() {

#On prendra en entrée :
#$1 : le nom de l'utilisateur
#$2 : le password de l'utilisateur

	if [[ -d "/var/mail/$1" ]]; then
		#On supprime le répertoire mail
		/bin/echo "Suppression de /var/mail/$1 en cours..."
		/bin/rm -r /var/mail/$1
		/bin/echo "Suppression [OK]"

		/bin/echo "Suppression de $1@myshop.itinet.fr de vmailbox"
		/bin/sed "/^$1/d" /etc/postfix/vmailbox >> /etc/postfix/sauv.vmailbox
		/bin/cp /etc/postfix/sauv.vmailbox /etc/postfix/vmailbox
		/bin/rm /etc/postfix/sauv.vmailbox
		/bin/echo "Suppression [OK]"

		/bin/echo "Postmap en cours..."
		/usr/sbin/postmap /etc/postfix/vmailbox
		/bin/echo "Postmap [OK]"

		/bin/echo "Suppression de $1@myshop.itinet.fr dans UserDB en cours..."
		/bin/sed "/^$1/d" /etc/courier/userdb >> /etc/courier/sauv.userdb
		/bin/cp /etc/courier/sauv.userdb /etc/courier/userdb
		/bin/rm /etc/courier/sauv.userdb
		/usr/sbin/makeuserdb
		/bin/echo "UserDB [OK]"

		/bin/echo "Redemarrage des service postfix en cours..."
		/etc/init.d/postfix restart
	else
		/bin/echo "Ce répertoire mail n'existe pas [ECHEC]"
	fi

}
