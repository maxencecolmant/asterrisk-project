#!/bin/bash
apt update
apt-get --assume-yes install build-essential
apt-get --assume-yes install git-core libxml2-dev subversion libjansson-dev libsqlite3-dev autoconf libssl-dev automake libxml2-dev libncurses5-dev libtool libedit-dev uuid-dev libjansson-dev
cd /usr/src/
wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-17.2.0-rc2.tar.gz
tar -zxvf asterisk-17.2.0-rc2.tar.gz
cd /usr/src/asterisk-17.2.0-rc2
./contrib/scripts/install_prereq install
./configure --with-jansson-bundled
make
make install
make samples
make config
make install-logrotate
systemctl start asterisk
systemctl status asterisk