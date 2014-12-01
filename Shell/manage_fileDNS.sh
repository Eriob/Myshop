#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation transfert fichier de zone
# Role : Automatiser le transfert du fichier de zone vers le domaine itinet.fr
#------------------------------------------------------------

#On mettra a jour a chaque nouvel utilisateur
function addline_fileDNS() {
	grep "^+$2." /etc/tinydns/root/data
	if [[ $? -eq 0 ]]; then
		echo "Cette enregistrement existe déjà [ECHEC]"
	else
		echo "Ajout de +$1.myshop.itinet.fr:88.177.168.133:1800 en cours..."
		echo "+$1.myshop.itinet.fr:88.177.168.133:1800" >> /etc/tinydns/root/data
		echo "Ajout [OK]"
		
		rm /etc/tinydns/root/data.cdb
		/usr/local/bin/tinydns-data
		
		ssh root@dedibox.itinet.fr
	fi
}

function manage_fileDNS {

#On prendra en entrée :
#$1 : l'action souhaité par l'utilisateur (1 = rename, 2 = delete)
#$2 : l'ancien fqdn affilié a l'utilisateur
#$3 : le nouveau fqdn affilié a l'utilisateur

	if [[ $1 = 1 ]]; then
		grep "^+$2." /etc/tinydns/root/data
		if [[ $? -eq 0 ]]; then
			#On renomme $2 en $3
			echo "Renommage de $2 en $3 en cours..."
			sed -i -e "s/$2/$3/g" /etc/tinydns/root/data
			echo "Renommage [OK]"
			rm /etc/tinydns/root/data.cdb
			/usr/local/bin/tinydns-data
			ssh root@dedibox.itinet.fr
		else
			echo "Cet enregistrement n'existe pas ! [ECHEC]"
		fi
	elif [[ $1 = 2 ]]; then
		grep "^+$2." /etc/tinydns/root/data
		if [[ $? -eq 0 ]]; then
			#On supprime la ligne dans le fichier DNS
			echo "Suppression de $2 du fichier de zone DNS en cours..."
			sed "/^+$2/d" /etc/tinydns/root/data >> /etc/tinydns/root/data2
			cp /etc/tinydns/root/data2 /etc/tinydns/root/data
			rm /etc/tinydns/root/data2
			echo "Suppression [OK]"
			rm /etc/tinydns/root/data.cdb
			/usr/local/bin/tinydns-data
			ssh root@dedibox.itinet.fr
		else
			echo "Cet enregistrement n'existe pas ! [ECHEC]"
		fi
	else
		echo "Cette action n'est pas possible, veuillez revoir votre script :)"
	fi
}
