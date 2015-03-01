#!/bin/sh
echo "Updating system..."
sudo pkg update >/dev/null
sudo pkg upgrade -y >/dev/null
echo "Installing necessary packages..."
sudo pkg install -y git curl wget ca_root_nss ezjail
sudo ln -s /usr/local/etc/ssl/cert.pem /etc/ssl/cert.pem
echo "Installing rsetup"
sudo mkdir /usr/rsetup
sudo git clone https://github.com/rnelson/rsetup.git /usr/rsetup
(cd /usr/rsetup; sudo git checkout freebsd-10.1)
sudo ln -s /usr/rsetup/rsetup /usr/local/bin/rsetup
sudo chown -R vagrant:vagrant /usr/rsetup