#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation transfert fichier de zone
# Role : Automatiser le transfert du fichier de zone vers le domaine itinet.fr
#------------------------------------------------------------

#On prendra aucune entrée

cd /etc/tinydns/root/

function manage_fileDNS {

#On prendra en entrée :
#$1 : l'action souhaité par l'utilisateur
#$2 : l'ancien fqdn affilié a l'utilisateur
#$3 : le nouveau fqdn affilié a l'utilisateur

	if [[ $1 == "rename" ]]; then
		#On renomme $2 en $3
		sed -i -e "s/$2/$3/g" ./data
	elif [[ $1 == "delete" ]]; then
		#On supprime la ligne dans le fichier DNS
		sed '/$2/d' ./data
	else
		echo "Cette action n'est pas possible"
	fi

	rm ./data.cdb
	make

	ssh root@195.154.82.81
}

#On mettra a jour a chaque nouvel utilisateur
function compile_fileDNS() {

	echo "+$1.myshop.itinet.fr:88.177.168.133:1800" >> ./data

	rm ./data.cdb
	make
	
	ssh root@195.154.82.81
}