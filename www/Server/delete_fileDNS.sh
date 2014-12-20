#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des boite mails
# Role : Automatiser la creation des boite mails
#------------------------------------------------------------

#ROLE : SUPPRIME LE FQDN D'UNE BOUTIQUE DANS LE FICHIER DE ZONE DNS

#On prendra en entrée :
#$1 : le fqdn affilié a l'utilisateur

if /bin/grep "^+$1." /etc/tinydns/root/data; then
	#On supprime la ligne dans le fichier DNS
	sudo /bin/sed -i "/^+$1/d" /etc/tinydns/root/data	
	/usr/bin/ssh -i /var/www/Myshop/www/Server/key_dedibox root@dedibox.itinet.frsudo /usr/bin/ssh root@dedibox.itinet.fr
else
	sudo /bin/echo "Cet enregistrement n'existe pas ! [ECHEC]"
fi