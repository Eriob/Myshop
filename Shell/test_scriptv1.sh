#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation transfert fichier de zone
# Role : Automatiser le transfert du fichier de zone vers le domaine itinet.fr
#------------------------------------------------------------

function test_fileDNS() {
	source (/var/www/Myshop/Shell/manage_fileDNS.sh)

while true; do
	echo "Faites un choix : creer, renommer ou supprimer"
	read choice

	echo "<-------------------------------------------->"
			echo " Vous souhaitez :" $choice
	echo "<-------------------------------------------->"

	case $choice in
		creer* | CREER*) echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
						 read arg1
						 addline_fileDNS $arg1
				 break;;
		renommer* | RENOMMER*) echo "Entrez l'argument 1 : (l'ancien nom)"
							   read arg1
							   echo "Entrez l'argument 2 : (le nouveau nom)"
							   read arg2
							   manage_fileDNS 1 $arg1 $arg2
				 break;;
		supprimer* | SUPPRIMER*) echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
								 read arg1
								 manage_fileDNS 2 $arg1
				 break;;
		q*) exit;;
		*) echo "Mauvaise réponse (creer, renommer ou supprimer).";;
	esac
done

}

function test_documentRoot() {
	source (/var/www/Myshop/Shell/create_documentRoot.sh)

while true; do
	echo "Faites un choix : creer, renommer ou supprimer"
	read choice

	echo "<-------------------------------------------->"
			echo " Vous souhaitez :" $choice
	echo "<-------------------------------------------->"

	case $choice in
		creer* | CREER*) echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
						 read arg1
						 create_documentRoot arg1
				 break;;
		renommer* | RENOMMER*) echo "Entrez l'argument 1 : (l'ancien nom)"
							   read arg1
							   echo "Entrez l'argument 2 : (le nouveau nom)"
							   read arg2
							   manage_documentRoot 1 $arg1 $arg2
				 break;;
		supprimer* | SUPPRIMER*) echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
								 read arg1
								 manage_documentRoot 2 $arg1
				 break;;
		q*) exit;;
		*) echo "Mauvaise réponse (creer, renommer ou supprimer).";;
	esac
done

}

function test_mail() {
	source (/var/www/Myshop/Shell/mail_directory.sh)
	
	echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
	read arg1
	echo "Entrez l'argument 2 : (le mot de passe de l'utilisateur)"
	read arg2

	create_mailDirectory arg1 arg2
}