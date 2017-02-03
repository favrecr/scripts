#!/bin/bash
#Post provisioning script for Web server, installation of Wordpress
#Author Esteban Arias
# Contact eariasn@us.ibm.com


#Installing Software

yum install -y httpd
chkconfig --levels 235 httpd on
yum install -y php
yum install -y php-mysql
yum -y install php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-mcrypt php-mssql php-snmp php-soap php-tidy curl curl-devel
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
cd wordpress
cp wp-config-sample.php wp-config.php

#configuration files editing
sed -i -e "s/database_name_here/wordpress/" /root/wordpress/wp-config.php
sed -i -e "s/password_here/Ea120676%/" /root/wordpress/wp-config.php
sed -i -e "s/localhost/sqlserver/" /root/wordpress/wp-config.php
sed -i -e "s/username_here/wp_svc/" /root/wordpress/wp-config.php
cp -r /root/wordpress/* /var/www/html
