#!/bin/bash
apt update
apt --assume-yes install build-essential net-tools
apt install -y asterisk asterisk-config asterisk-prompt-fr-proformatique 
apt install -y heartbeat
sudo ip addr add 172.20.10.12/28 dev eth1
echo "asteriskmaster IPaddr::172.20.10.15 asterisk">> /etc/ha.d/haresources
echo "172.20.10.13   asteriskslave">> /etc/hosts
