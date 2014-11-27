#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script de test v1
# Role : Testez les scripts DNS, Mail, DocumentRoot présent dans /var/www/Myshop/Shell
#------------------------------------------------------------

function test_fileDNS() {
	source /var/www/Myshop/Shell/manage_fileDNS.sh

while true; do
	echo "Ce test inclue :"
	echo "- Ajouter d'une adresse dans le fichier DNS"
	echo "- Renommer une adresse dans le fichier DNS"
	echo "- Supprimer une adresse dans le fichier DNS"
	echo "Faites un choix : ajouter, renommer ou supprimer"
	read choice

	echo "<-------------------------------------------->"
			echo " Vous souhaitez :" $choice
	echo "<-------------------------------------------->"

	case $choice in
		ajouter* | AJOUTER*) echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
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
		*) echo "Mauvaise réponse (ajouter, renommer ou supprimer).";;
	esac
done

}

function test_documentRoot() {
	source /var/www/Myshop/Shell/manage_documentRoot.sh

while true; do
	echo "Ce test inclue :"
	echo "- Création du documentroot/virtualhost"
	echo "- Renommer son documentroot/virtualhost"
	echo "- Désactiver le virtualhost"
	echo "Faites un choix : creer, renommer ou desactiver"
	read choice

	echo "<-------------------------------------------->"
			echo " Vous souhaitez :" $choice
	echo "<-------------------------------------------->"

	case $choice in
		creer* | CREER*) echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
						 read arg1
						 create_documentRoot $arg1
				 break;;
		renommer* | RENOMMER*) echo "Entrez l'argument 1 : (l'ancien nom)"
							   read arg1
							   echo "Entrez l'argument 2 : (le nouveau nom)"
							   read arg2
							   manage_documentRoot 1 $arg1 $arg2
				 break;;
		desactiver* | DESACTIVER*) echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
								 read arg1
								 manage_documentRoot 2 $arg1
				 break;;
		q*) exit;;
		*) echo "Mauvaise réponse (creer, renommer ou desactiver).";;
	esac
done

}

function test_mail() {
	source /var/www/Myshop/Shell/manage_mail.sh
	
	echo "Ce test inclue :"
	echo "- Création du répertoire utilisateur dans /var/mail, envoi mail de bienvenue"


	echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
	read arg1
	echo "Entrez l'argument 2 : (le mot de passe de l'utilisateur)"
	read arg2

	create_mailDirectory $arg1 $arg2
}

while true; do
	echo "Choisissez un test : dns, mail ou documentroot"
	read choice

	echo "<-------------------------------------------->"
			echo " Vous souhaitez testez le " $choice
	echo "<-------------------------------------------->"

	case $choice in
		dns* | DNS*) test_fileDNS
				 break;;
		mail* | MAIL*) test_mail
				 break;;
		documentRoot* | DOCUMENTROOT*) test_documentRoot
				 break;;
		q*) exit;;
		*) echo "Mauvaise réponse (dns, mail ou documentroot).";;
	esac
done