setup-debian-server
===================


Install
-----------

#### Run the following lines
```
wget --no-check-certificate https://raw.githubusercontent.com/chrisprobst/setup-debian-server/master/setup_base.sh
wget --no-check-certificate https://raw.githubusercontent.com/chrisprobst/setup-debian-server/master/setup_users.sh
wget --no-check-certificate https://raw.githubusercontent.com/chrisprobst/setup-debian-server/master/setup_firewall.sh
wget --no-check-certificate https://raw.githubusercontent.com/chrisprobst/setup-debian-server/master/reset_firewall.sh
wget --no-check-certificate https://raw.githubusercontent.com/chrisprobst/setup-debian-server/master/setup_proxy.sh

sudo bash setup_base.sh
sudo bash setup_users.sh
sudo bash setup_firewall.sh
# sudo bash reset_firewall.sh
sudo bash setup_proxy.sh

rm -f setup_base.sh
rm -f setup_users.sh
rm -f setup_firewall.sh
rm -f reset_firewall.sh
rm -f setup_proxy.sh
```

Final steps:
-------------

Change ssh port and deactive root login etc. Allow only main users.
