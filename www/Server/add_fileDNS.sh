#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des boite mails
# Role : Automatiser la creation des boite mails
#------------------------------------------------------------

add_fileDNS()
{
# ROLE : AJOUTE UNE NOUVELLE RELATION FQDN - ADRESSE IP AU FICHIER DE ZONE DNS

#On prendra en entrée :
#$1 : le nom de la boutique

if /bin/grep "^+$1." /etc/tinydns/root/data; then
	/bin/echo "Cette enregistrement existe déjà [ECHEC]"
else
	/bin/echo "+$1.myshop.itinet.fr:88.177.168.133:1800" >> /etc/tinydns/root/data
	/usr/bin/ssh root@dedibox.itinet.fr
fi
}