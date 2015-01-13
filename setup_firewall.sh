#!/bin/bash

# Make sure no illegal port is open for usage
iptables -A INPUT -p tcp -m tcp -m multiport --dports 1337,7133,8669,53289 -j ACCEPT
iptables -A INPUT -p udp -m udp -m multiport --dports 53290 -j ACCEPT
iptables -A INPUT -m conntrack -j ACCEPT  --ctstate RELATED,ESTABLISHED
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -j DROP

# This would only allow outgoing related traffic!
# iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# iptables -A OUTPUT -j DROP

# Do do not care, allow everything for now!
iptables -A OUTPUT -d 0.0.0.0/0 -j ACCEPT

# That's ok
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -j DROP

# Install autosave for rules
apt-get install iptables-persistent

# Further info: http://www.thomas-krenn.com/de/wiki/Iptables_Firewall_Regeln_dauerhaft_speichern
