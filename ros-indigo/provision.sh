echo "provision_ros"
# Install and setup ROS indigo.
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
# Update APT
apt-get update
# Install Window Manager
apt -y install \
xinit \
i3
# Install ROS packages and some tools.
apt-get -y install \
ros-indigo-ros-base \
python-rosinstall \
python-rosinstall-generator \
python-wstool \
build-essential \
python-catkin-tools \
screen \
tree \
git
# Setup rosdep
rosdep init
sudo -H -u vagrant bash -c 'rosdep update --include-eol-distros'
# Source ROS on install.
sudo -H -u vagrant bash -c "grep -q -F 'source /opt/ros/indigo/setup.bash' ~/.bashrc || echo 'source /opt/ros/indigo/setup.bash' >> ~/.bashrc"
# Cleanup, to reduce size.
apt-get clean
rm -rf /var/lib/apt/lists/*
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && exit
