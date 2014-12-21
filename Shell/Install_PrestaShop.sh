#!/bin/bash
#Script d'installation automatique d'une boutique Prestashop
echo "Ce script créée une boutique prestashop à l'adresse username@myshop.itinet.fr pour un utilisateur correctement créé"
echo "Pour que utilisateur voulez vous créer une boutique?"
read username
echo "Veuillez rentrer le mot de passe de l'utilisateur"
read password
echo "Veuillez entrer une adresse mail"
read mail

#mysql -u root -padmin

#CREATE DATABASE "$username";
#CREATE USER "$username"@"localhost";
#SET password FOR "$username"@"localhost" = password('$password');
#GRANT ALL ON $username.* TO "$username"@"localhost";
#quit

cp /var/sftp/testprestashop/www/prestashop_1.6.0.9.zip /var/sftp/$username/www
cd /var/sftp/$username/www
unzip prestashop_1.6.0.9.zip
cd prestashop
mv * /var/sftp/$username/www
cd ..
rm -r prestashop
cd install
php index_cli.php --domain=domain.myshop.itinet.fr --db_name=$username db_user=$username db_password=$password --email=$mail --password=$password
mv admin admin5724
rm -r install
echo "Installation terminée"