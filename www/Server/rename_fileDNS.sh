#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des boite mails
# Role : Automatiser la creation des boite mails
#------------------------------------------------------------

#ROLE : RENOMME LE FQDN D'UNE BOUTIQUE DANS LE FICHIER DE ZONE DNS

#On prendra en entrée :
#$1 : l'ancien fqdn affilié a l'utilisateur
#$2 : le nouveau fqdn affilié a l'utilisateur


if /bin/grep "^+$1." /etc/tinydns/root/data; then
	#On renomme $1 en $2
	sudo /bin/sed -i -e "s/$1/$2/g" /etc/tinydns/root/data

	if test -e /etc/tinydns/root/data.cdb; then
		sudo /bin/rm /etc/tinydns/root/data.cdb 
		sudo /usr/local/bin/tinydns-data
	else
		sudo /bin/echo "Le fichier data.cdb n'existe pas dans /etc/tinydns/root"
	fi

	/usr/bin/ssh -i /var/www/Myshop/www/Server/key_dedibox root@dedibox.itinet.fr
else
	sudo /bin/echo "Cet enregistrement n'existe pas ! [ECHEC]"
fi
