#!/bin/sh

# On vide les règles déjà existantes
iptables -t filter -F
iptables -t filter -X

# On refuse toutes les connexions
iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP
iptables -t filter -P OUTPUT DROP
echo "On interdit tout"

# On autorise les connexions déjà établie
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# On autorise le loop-back (localhost)
iptables -t filter -A INPUT -i lo -j ACCEPT
iptables -t filter -A OUTPUT -o lo -j ACCEPT

# On autorise le ping
iptables -t filter -A INPUT -p icmp -j ACCEPT
iptables -t filter -A OUTPUT -p icmp -j ACCEPT

# On autorise le SSH (à adapter suivant votre cas)
iptables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 22 -j ACCEPT

# NTP (pour avoir un serveur à l'heure)
iptables -t filter -A OUTPUT -p udp --dport 123 -j ACCEPT

# SIP 
iptables -t filter -A INPUT -p sip --dport 5060 -j ACCEPT
iptables -t filter -A OUTPUT -p sip --dport 5060 -j ACCEPT
