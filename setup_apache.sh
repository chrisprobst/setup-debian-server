#!/bin/sh

# Ensure this script is run as root
if [ "$(id -u)" != "0" ]; then
    echo "#\tThis script must be run as root." 1>&2
    exit 1
fi

# Remove old files/folders
rm -rf /var/www/*
mkdir /var/www/indyforge
mkdir /var/www/matthesse

# Virtual host for indyforge
echo "<VirtualHost *:80>
ServerAdmin webmaster@localhost
ServerName www.indy-forge.com
ServerAlias indy-forge.com

DocumentRoot /var/www/indyforge/

<Directory /var/www/indyforge/>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride None
                Order allow,deny
                allow from all
</Directory>
ErrorLog /var/log/apache2/error.log
LogLevel warn
CustomLog /var/log/apache2/access.log combined

</VirtualHost>" > /etc/apache2/sites-available/indyforge.conf

# Virtual host for matthesse
echo "<VirtualHost *:80>
ServerAdmin webmaster@localhost
ServerName www.matt-hesse.de
ServerAlias matt-hesse.de

DocumentRoot /var/www/matthesse/

<Directory /var/www/matthesse/>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride None
                Order allow,deny
                allow from all
</Directory>
ErrorLog /var/log/apache2/error.log
LogLevel warn
CustomLog /var/log/apache2/access.log combined

</VirtualHost>" > /etc/apache2/sites-available/matthesse.conf

# Enable both sites
a2ensite indyforge.conf
a2ensite matthesse.conf

# Restart apache2 server
service apache2 restart