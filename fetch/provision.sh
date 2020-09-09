# Install ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install -y \
ros-melodic-desktop-full \
python-rosdep \
python-rosinstall \
python-rosinstall-generator \
python-wstool \
build-essential \
python-catkin-tools \
ros-melodic-fetch-gazebo-demo \
ros-melodic-rosbridge-server \
python-rosdep
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo rosdep init
rosdep update
# Setup Gazebo sources
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget https://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
# Setup workspace
mkdir -p $HOME/catkin_ws/src
# Clone git repos
# git clone https://github.com/mas-group/youbot_simulation.git --single-branch --branch kinetic-devel $HOME/catkin_ws/src/youbot_simulation
# git clone https://github.com/mas-group/youbot_description.git --single-branch --branch kinetic-devel $HOME/catkin_ws/src/youbot_description
# git clone https://github.com/Kinovarobotics/kinova-ros.git --single-branch --branch master $HOME/catkin_ws/src/kinova-ros
mkdir -p ~/.gazebo && git clone https://github.com/osrf/gazebo_models --single-branch --branch master $HOME/.gazebo/models && rm -rf ~/.gazebo/models/.git
git clone https://github.com/siemens/ros-sharp.git --single-branch --branch master /tmp/ros-sharp && cp -R /tmp/ros-sharp/ROS/ $HOME/catkin_ws/src/ros-sharp # && rm -rf /tmp/ros-sharp
# git clone https://github.com/fredrikbaberg/ros-docker --single-branch --branch sim /tmp/ros-docker && cp -R /tmp/ros-docker/sim/{sim,youbot_jaco_gazebo} $HOME/catkin_ws/src/ # && rm -rf /tmp/ros-docker
# Install packages using rosdep
cd $HOME/catkin_ws
rosdep install --from-path src --ignore-src -ry
# Cleanup
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*
# Add line to source workspace
# sudo -H -u vagrant bash -c "grep -q -F 'source /opt/ros/kinetic/setup.bash' ~/.bashrc || echo 'source $HOME/catkin_ws/devel/setup.bash --extend' >> ~/.bashrc"
