#!/bin/sh
echo "Updating system..."
sudo pkg update >/dev/null
sudo pkg upgrade -y >/dev/null
echo "Installing necessary packages..."
sudo pkg install -y git curl wget ca_root_nss ezjail >/dev/null
sudo ln -s /usr/local/etc/ssl/cert.pem /etc/ssl/cert.pem
echo "Installing rsetup"
sudo mkdir /usr/rsetup
sudo mkdir -p /var/db/rsetup
sudo git clone https://github.com/rnelson/rsetup.git /usr/rsetup >/dev/null
(cd /usr/rsetup; sudo git checkout freebsd-10.1) >/dev/null
sudo ln -s /usr/rsetup/rsetup /usr/local/bin/rsetup
sudo chown -R `id -u`:`id -g` /usr/rsetup
sudo chown -R `id -u`:`id -g` /var/db/rsetup
date +%V > /var/db/rsetup/lastupdate