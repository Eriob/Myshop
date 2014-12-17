#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation transfert fichier de zone
# Role : Automatiser le transfert du fichier de zone vers le domaine itinet.fr
#------------------------------------------------------------

#On mettra a jour a chaque nouvel utilisateur
function addline_fileDNS() {
	if /bin/grep "^+$1." /etc/tinydns/root/data; then
		/bin/echo "Cette enregistrement existe déjà [ECHEC]"
	else
		/bin/echo "Ajout de +$1.myshop.itinet.fr:88.177.168.133:1800 en cours..."
		/bin/echo "+$1.myshop.itinet.fr:88.177.168.133:1800" >> /etc/tinydns/root/data
		/bin/echo "Ajout [OK]"
		
		/bin/echo "Mise à jour du fichier de zone en cours..."
		if -e /etc/tinydns/root/data.cdb; then
			/bin/rm /etc/tinydns/root/data.cdb
			cd /etc/tinydns/root
			/usr/local/bin/tinydns-data
		/bin/echo "Mise à jour [OK]"
		else
			/bin/echo "Le fichier data.cdb n'existe pas dans /etc/tinydns/root"
			/bin/echo "Mise à jour [ECHEC]"
		fi

		/usr/bin/ssh root@dedibox.itinet.fr
	fi
}

function manage_fileDNS {

#On prendra en entrée :
#$1 : l'action souhaité par l'utilisateur (1 = rename, 2 = delete)
#$2 : l'ancien fqdn affilié a l'utilisateur
#$3 : le nouveau fqdn affilié a l'utilisateur

	if [[ $1 = 1 ]]; then
		if /bin/grep "^+$2." /etc/tinydns/root/data; then
			#On renomme $2 en $3
			/bin/echo "Renommage de $2 en $3 en cours..."
			/bin/sed -i -e "s/$2/$3/g" /etc/tinydns/root/data
			/bin/echo "Renommage [OK]"
			/bin/echo "Mise à jour du fichier de zone en cours..."
			if -e /etc/tinydns/root/data.cdb; then
				/bin/rm /etc/tinydns/root/data.cdb 
				/usr/local/bin/tinydns-data
				/bin/echo "Mise à jour [OK]"
			else
				/bin/echo "Le fichier data.cdb n'existe pas dans /etc/tinydns/root"
				/bin/echo "Mise à jour [ECHEC]"
			fi

			/usr/bin/ssh root@dedibox.itinet.fr
		else
			/bin/echo "Cet enregistrement n'existe pas ! [ECHEC]"
		fi
	elif [[ $1 = 2 ]]; then
		if /bin/grep "^+$2." /etc/tinydns/root/data; then
			#On supprime la ligne dans le fichier DNS
			/bin/echo "Suppression de $2 du fichier de zone DNS en cours..."
			/bin/sed "/^+$2/d" /etc/tinydns/root/data >> /etc/tinydns/root/data2
			/bin/cp /etc/tinydns/root/data2 /etc/tinydns/root/data
			/bin/rm /etc/tinydns/root/data2
			/bin/echo "Suppression [OK]"
			/bin/echo "Mise à jour du fichier de zone en cours..."
			if -e /etc/tinydns/root/data.cdb; then
				/bin/rm /etc/tinydns/root/data.cdb
				/usr/local/bin/tinydns-data
				/bin/echo "Mise à jour [OK]"
			else
				/bin/echo "Le fichier data.cdb n'existe pas dans /etc/tinydns/root"
				/bin/echo "Mise à jour [ECHEC]"
			fi
			
			/usr/bin/ssh root@dedibox.itinet.fr
		else
			/bin/echo "Cet enregistrement n'existe pas ! [ECHEC]"
		fi
	else
		/bin/echo "Cette action n'est pas possible, veuillez revoir votre script :)"
	fi
}

