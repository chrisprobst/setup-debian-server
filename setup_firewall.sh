# Drop anything
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Allow loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow established and related incoming connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow established outgoing connections
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Drop invalid packets
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

# Allow all incoming SSH
iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Allow STUN to pass through
iptables -A INPUT -p udp --dport 3478 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp --sport 3478 -m conntrack --ctstate ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 3478 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 3478 -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Allow all incoming HTTP & HTTPS
iptables -A INPUT -p tcp -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --dports 80,443 -m conntrack --ctstate ESTABLISHED -j ACCEPT

# [Warning] Do do not care, allow everything for now
iptables -A OUTPUT -d 0.0.0.0/0 -j ACCEPT

# Install autosave for rules
# apt-get install iptables-persistent
# Further info: http://www.thomas-krenn.com/de/wiki/Iptables_Firewall_Regeln_dauerhaft_speichern
