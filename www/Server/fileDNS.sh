#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des boite mails
# Role : Automatiser la creation des boite mails
#------------------------------------------------------------

function add_fileDNS() {

# ROLE : AJOUTE UNE NOUVELLE RELATION FQDN - ADRESSE IP AU FICHIER DE ZONE DNS

#On prendra en entrée :
#$1 : le nom de la boutique

if /bin/grep "^+$1." /etc/tinydns/root/data; then
	/bin/echo "Cette enregistrement existe déjà [ECHEC]"
else
	/bin/echo "Ajout de +$1.myshop.itinet.fr:88.177.168.133:1800 en cours..."
	/bin/echo "+$1.myshop.itinet.fr:88.177.168.133:1800" >> /etc/tinydns/root/data
	/bin/echo "Ajout [OK]"
		
	/bin/echo "Mise à jour du fichier de zone en cours..."
	/usr/bin/ssh root@dedibox.itinet.fr
	/bin/echo "Mise à jour [OK]"
fi

}

function rename_fileDNS() {

#ROLE : RENOMME LE FQDN D'UNE BOUTIQUE DANS LE FICHIER DE ZONE DNS

#On prendra en entrée :
#$1 : l'ancien fqdn affilié a l'utilisateur
#$2 : le nouveau fqdn affilié a l'utilisateur


if /bin/grep "^+$1." /etc/tinydns/root/data; then
	#On renomme $1 en $2
	/bin/echo "Renommage de $1 en $2 en cours..."
	/bin/sed -i -e "s/$1/$2/g" /etc/tinydns/root/data
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

}

function delete_fileDNS() {

#ROLE : SUPPRIME LE FQDN D'UNE BOUTIQUE DANS LE FICHIER DE ZONE DNS

#On prendra en entrée :
#$1 : le fqdn affilié a l'utilisateur

if /bin/grep "^+$1." /etc/tinydns/root/data; then
	#On supprime la ligne dans le fichier DNS
	/bin/echo "Suppression de $1 du fichier de zone DNS en cours..."
	/bin/sed "/^+$1/d" /etc/tinydns/root/data >> /etc/tinydns/root/data2
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

}