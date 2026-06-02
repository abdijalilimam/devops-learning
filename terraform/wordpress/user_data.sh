#!/bin/bash
apt-get update -y
apt-get install -y apache2 php php-mysql libapache2-mod-php wget

# Download and set up WordPress
cd /var/www/html
wget -q https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* .
rm -rf wordpress latest.tar.gz

# Set permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Enable Apache
systemctl enable apache2
systemctl start apache2