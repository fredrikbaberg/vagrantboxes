# Install and setup Window Manager
apt-get update
# Install I3
apt-get -y install \
xinit \
i3
# Cleanup, to reduce size.
apt-get clean
rm -rf /var/lib/apt/lists/*
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && exit