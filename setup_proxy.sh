#!/bin/sh

# Ensure this script is run as root
if [ "$(id -u)" != "0" ]; then
    echo "#\tThis script must be run as root." 1>&2
    exit 1
fi

# Install important programs
apt-get update
apt-get install squid3 apache2-utils

# Safe old file
mv /etc/squid3/squid.conf /etc/squid3/backup_squid.conf

# Setup 
echo "auth_param digest program /usr/lib/squid3/digest_pw_auth -c /etc/squid3/passwords
auth_param digest realm proxy
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
http_port 1337
cache deny all" > /etc/squid3/squid.conf

# Setup user for proxy usage
htdigest -c /etc/squid3/passwords proxy kr0e

# Restart squid3 service
service squid3 restart
