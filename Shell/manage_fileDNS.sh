#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation transfert fichier de zone
# Role : Automatiser le transfert du fichier de zone vers le domaine itinet.fr
#------------------------------------------------------------

#On mettra a jour a chaque nouvel utilisateur
function addline_fileDNS() {

	echo "On rajoute :"
	echo "+$1.myshop.itinet.fr:88.177.168.133:1800"
	echo "+$1.myshop.itinet.fr:88.177.168.133:1800" >> /etc/tinydns/root/data
	echo "Ajout [OK]"
	
	rm /etc/tinydns/root/data.cdb
	make
	
	ssh root@dedibox.itinet.fr
}

function manage_fileDNS {

#On prendra en entrée :
#$1 : l'action souhaité par l'utilisateur (1 = rename, 2 = delete)
#$2 : l'ancien fqdn affilié a l'utilisateur
#$3 : le nouveau fqdn affilié a l'utilisateur

	if [[ $1 = 1 ]]; then
		#On renomme $2 en $3
		echo "On renome $2 en $3"
		sed -i -e "s/$2/$3/g" /etc/tinydns/root/data
		echo "Renommage [OK]"
	elif [[ $1 = 2 ]]; then
		#On supprime la ligne dans le fichier DNS
		echo "On supprime $2 du fichier de zone DNS"
		sed "/^+$2/d" /etc/tinydns/root/data >> /etc/tinydns/root/data2
		cp /etc/tinydns/root/data2 /etc/tinydns/root/data
		rm /etc/tinydns/root/data2
		echo "Suppression [OK]"
	else
		echo "Cette action n'est pas possible, veuillez revoir votre script :)"
	fi

	rm /etc/tinydns/root/data.cdb
	make

	ssh root@dedibox.itinet.fr
}
