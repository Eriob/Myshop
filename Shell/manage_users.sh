#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation création d'utilisateurs et groupe UNIX + Quota
# Role : Automatiser la création d'utilisateurs et de groupe UNIX + activation quota
#------------------------------------------------------------

function create_userUnix() {

#On prendra en entrée :
#$1 : le nom de l'utilisateur
#$2 : le mot de passe de l'utilisateur


	if /bin/grep "^$1:" /etc/passwd ; then
		/bin/echo "Cet utilisateur UNIX existe déjà ! [ECHEC]"
	else
		/bin/echo "Création du nouvel utilisateur UNIX en cours..."
		#gid 5001 = group SFTP
		/usr/sbin/useradd --home /var/sftp/$1 --gid 5001 --groups 5001 --password "$(mkpasswd "$2")" --shell /bin/MySecureShell $1
		/bin/echo "Création [OK]"
		

		if [[ -d "/var/sftp/$1" ]]; then
			/bin/echo "Répertoire /var/sftp/$1 déja crée [OK]"
		else
			/bin/echo "Création du répertoire /var/sftp/$1/www en cours..."
			/bin/mkdir /var/sftp/$1/
			/bin/mkdir /var/sftp/$1/www 
			/bin/echo "Création [OK]"
 
			/bin/echo "Modification des droits sur le dossier utilisateur /var/sftp/$1"
			/bin/chown -R $1:sftp /var/sftp/$1
			/bin/echo "Modification des droits [OK]"

			/bin/echo "Application des Quotas en cours..."
			/usr/sbin/edquota -p test $1
			/bin/echo "Applications des Quotas [OK]"
		fi
	fi
}

function manage_userUnix() {

#On prendra en entrée :
#$1 : l'action souhaité par l'utilisateur
#$2 : le nom de l'utilisateur
#$3 : le mot de passe de l'utilisateur


	if [[ $1 = 1 ]]; then
		if /bin/grep "^$2:" /etc/passwd; then
			#On renomme $2 en $3
			/bin/echo "Renommage de $2 en $3 en cours..."
			/bin/sed -i -e "s/$2/$3/g" /etc/passwd
			/bin/echo "Renommage [OK]"
		else
			/bin/echo "Cet utilisateur n'existe pas ! [ECHEC]"
		fi
	elif [[ $1 = 2 ]]; then
		if /bin/grep "^$2:" /etc/passwd; then
			#On supprime la ligne dans le fichier DNS
			/bin/echo "Suppression de l'utilisateur UNIX en cours..."
			/bin/sed "/^$2:/d" /etc/passwd >> /etc/sauv_passwd
			/bin/cp /etc/sauv_passwd /etc/passwd
			/bin/rm /etc/sauv_passwd
			/bin/echo "Suppression [OK]"
		else
			/bin/echo "Cet utilisateur n'existe pas ! [ECHEC]"
		fi
	else
		/bin/echo "Cette action n'est pas possible, veuillez revoir votre script :)"
	fi
}
