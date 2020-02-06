#!/bin/bash
sudo chmod 600 /etc/ha.d/authkeys
systemctl reload asterisk
systemctl status asterisk
sudo /etc/init.d/heartbeat reload
sudo /etc/init.d/heartbeat start
sudo /etc/init.d/heartbeat status
