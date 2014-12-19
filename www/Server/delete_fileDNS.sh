#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des boite mails
# Role : Automatiser la creation des boite mails
#------------------------------------------------------------

function delete_fileDNS() {

#ROLE : SUPPRIME LE FQDN D'UNE BOUTIQUE DANS LE FICHIER DE ZONE DNS

#On prendra en entrée :
#$1 : le fqdn affilié a l'utilisateur

if /bin/grep "^+$1." /etc/tinydns/root/data; then
	#On supprime la ligne dans le fichier DNS
	/bin/sed "/^+$1/d" /etc/tinydns/root/data >> /etc/tinydns/root/data2
	/bin/cp /etc/tinydns/root/data2 /etc/tinydns/root/data
	/bin/rm /etc/tinydns/root/data2
	
	if -e /etc/tinydns/root/data.cdb; then
		/bin/rm /etc/tinydns/root/data.cdb
		/usr/local/bin/tinydns-data
	else
		/bin/echo "Le fichier data.cdb n'existe pas dans /etc/tinydns/root"
	fi
			
	/usr/bin/ssh root@dedibox.itinet.fr
else
	/bin/echo "Cet enregistrement n'existe pas ! [ECHEC]"
fi

}