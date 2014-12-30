#!/bin/bash

# Drop all Incoming
iptables --policy INPUT DROPvlt

# Allow all Outgoing
iptables -A OUTPUT -d 0.0.0.0/0 -j ACCEPT

# Allow special SSH port
iptables -A INPUT -p tcp --dport 53289 -j ACCEPT

# Allow special l33t port
iptables -A INPUT -p tcp --dport 1337 -j ACCEPT

# Allow special ts port
iptables -A INPUT -p udp --dport 53290 -j ACCEPT

# Allow established connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow localhost
iptables -A INPUT -i lo -j ACCEPT