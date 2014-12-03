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


	if grep "^$1:" /etc/passwd ; then
		echo "Cet utilisateur UNIX existe déjà ! [ECHEC]"
	else
		echo "Cryptage du mot de passe en cours..."
		
		M="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" #chaine de caractère pour la création du SALT
        
        while [ "${n:=1}" -le "8" ]                                        #Boucle pour la création du Salt
        do  pass="$pass${M:$(($RANDOM%${#M})):1}"                          #concaténation d'un caractère dans pass pioché aléatoirement dans la chaine M
        	let n+=1                                                           #incrémentation de 1
        done                                                            
        
        mdpOK=$(mkpasswd $2 -S $pass -m SHA-512) #cryptage du mot depasse avec la commande mkpasswd avec le Salt crée (-S) et la méthode SHA-512 86 bit
		
		echo "Cryptage [OK]"
		echo "Création du nouvel utilisateur UNIX en cours..."
		#gid 5001 = group SFTP
		useradd --home /var/sftp/$1 --gid 5001 --groups 5001 --password $2 --shell /bin/MySecureShell $1
		echo "Création [OK]"
		
		if [[ -d "/var/sftp/$1" ]]; then
			echo "Répertoire /Var/sftp/$1 déja crée [OK]"
		else
			echo "Création du répertoire /var/sftp/$1/www en cours..."
			mkdir /var/sftp/$1/
			mkdir /var/sftp/$1/www
			echo "Création [OK]"

			echo "Modification des droits sur le dossier utilisateur /var/sftp/$1"
			chown -R $1:sftp /var/sftp/$1
			echo "Modification des droits [OK]"
		fi
	fi
}

function manage_userUnix() {

#On prendra en entrée :
#$1 : l'action souhaité par l'utilisateur
#$2 : le nom de l'utilisateur
#$3 : le mot de passe de l'utilisateur


	if [[ $1 = 1 ]]; then
		if grep "^$2:" /etc/passwd; then
			#On renomme $2 en $3
			echo "Renommage de $2 en $3 en cours..."
			sed -i -e "s/$2/$3/g" /etc/passwd
			echo "Renommage [OK]"
		else
			echo "Cet utilisateur n'existe pas ! [ECHEC]"
		fi
	elif [[ $1 = 2 ]]; then
		if grep "^$2:" /etc/passwd; then
			#On supprime la ligne dans le fichier DNS
			echo "Suppression de l'utilisateur UNIX en cours..."
			sed "/^$2:/d" /etc/passwd >> /etc/sauv_passwd
			cp /etc/sauv_passwd /etc/passwd
			rm /etc/sauv_passwd
			echo "Suppression [OK]"
		else
			echo "Cet utilisateur n'existe pas ! [ECHEC]"
		fi
	else
		echo "Cette action n'est pas possible, veuillez revoir votre script :)"
	fi
}