#!/bin/bash
#This is the database script, post provisioning for 3 tier application in Softlayer +
# Author Esteban Arias
# comments eariasn@us.ibm.com

#Software install
sudo yum -y install mariadb-server mariadb
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service

export DATABASE_PASS=''
mysqladmin -u root password "$DATABASE_PASS"
echo 'securing mysql'
mysql -u root  -e "UPDATE mysql.user SET Password=PASSWORD('$DATABASE_PASS') WHERE User='root'"
mysql -u root  -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
mysql -u root  -e "DELETE FROM mysql.user WHERE User=''"
mysql -u root  -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'"
mysql -u root  -e "FLUSH PRIVILEGES"

echo 'creating passwords'

#MYSQL operations
mysql -e "SELECT User, Host, Password FROM mysql.user"
mysql -e "CREATE DATABASE wordpress"
mysql -e "CREATE USER wp_svc@localhost"
mysql -e "CREATE USER wp_svc@'%'"
mysql -e "SET PASSWORD FOR wp_svc@localhost=PASSWORD('Ea120676%')"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO wp_svc@localhost IDENTIFIED BY 'Ea120676%'"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_svc'@'%' IDENTIFIED BY 'Ea120676%'"
mysql -e "FLUSH PRIVILEGES"
