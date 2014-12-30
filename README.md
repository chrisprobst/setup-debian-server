setup-debian-server
===================


Install
-----------

#### Run the following lines
```
wget --no-check-certificate https://raw.githubusercontent.com/chrisprobst/setup-debian-server/master/setup_base.sh
wget --no-check-certificate https://raw.githubusercontent.com/chrisprobst/setup-debian-server/master/setup_firewall.sh

sudo bash setup_base.sh
sudo bash setup_firewall.sh

rm -f setup_base.sh
rm -f setup_firewall.sh
```
