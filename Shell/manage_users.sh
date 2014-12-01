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

$2 = mkpasswd -H md5 $2

	echo "Création du nouvel utilisateur UNIX en cours..."
	useradd $1 --gid 5001 --groups 5001 --home /var/sftp/$1 --shell /bin/MySecureShell
	echo "Création [OK]"

	if [[ !test -e /var/sftp/$1 ]]; then
		echo "Création du répertoire /var/sftp/$1/www en cours..."
		mkdir /var/sftp/$1/www
		echo "Création [OK]"
	fi

	echo "Modification des droits sur le dossier utilisateur /var/sftp/$1"
	chown -R $1:sftp /var/sftp/$1
	echo "Modification des droits [OK]"


}

function manage_userUnix() {

#On prendra en entrée :
#$1 : l'action souhaité par l'utilisateur
#$2 : le nom de l'utilisateur
#$3 : le mot de passe de l'utilisateur


	if [[ $1 = 1 ]]; then
		#On renomme $2 en $3
		echo "Renommage de $2 en $3 en cours..."
		sed -i -e "s/$2/$3/g" /etc/tinydns/root/data
		echo "Renommage [OK]"
	elif [[ $1 = 2 ]]; then
		#On supprime la ligne dans le fichier DNS
		echo "Suppression de l'utilisateur UNIX en cours..."
		sed "/^$2/d" /etc/passwd >> /etc/sauv_passwd
		cp /etc/sauv_passwd /etc/passwd
		rm /etc/sauv_passwd
		echo "Suppression [OK]"
	else
		echo "Cette action n'est pas possible, veuillez revoir votre script :)"
	fi



}