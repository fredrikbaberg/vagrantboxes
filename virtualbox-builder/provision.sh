# Install and setup Virtualbox
apt-get update
apt-get -y install \
virtualbox \
vagrant \
xinit \
i3 \
linux-headers-$(uname -r)
# Cleanup, to reduce size.
apt-get clean
rm -rf /var/lib/apt/lists/*
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && exit
