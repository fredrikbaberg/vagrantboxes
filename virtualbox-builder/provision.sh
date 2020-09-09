# Install and setup Virtualbox
# wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
# wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
# echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
apt-get update
apt-get -y install \
virtualbox \
vagrant \
xinit \
i3 \
dos2unix \
linux-headers-$(uname -r)
# Cleanup, to reduce size.
apt-get clean
rm -rf /var/lib/apt/lists/*
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && exit
