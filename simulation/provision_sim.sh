# Source ros
source /opt/ros/kinetic/setup.bash
# Setup Gazebo sources
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget https://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
# Setup workspace
mkdir -p $HOME/catkin_ws/src
# Clone git repos
git clone https://github.com/mas-group/youbot_simulation.git --single-branch --branch kinetic-devel $HOME/catkin_ws/src/youbot_simulation
git clone https://github.com/mas-group/youbot_description.git --single-branch --branch kinetic-devel $HOME/catkin_ws/src/youbot_description
git clone https://github.com/Kinovarobotics/kinova-ros.git --single-branch --branch master $HOME/catkin_ws/src/kinova-ros
mkdir -p ~/.gazebo && git clone https://github.com/osrf/gazebo_models --single-branch --branch master $HOME/.gazebo/models && rm -rf ~/.gazebo/models/.git
git clone https://github.com/siemens/ros-sharp.git --single-branch --branch master /tmp/ros-sharp && cp -R /tmp/ros-sharp/ROS/ $HOME/catkin_ws/src/ros-sharp # && rm -rf /tmp/ros-sharp
git clone https://github.com/fredrikbaberg/ros-docker --single-branch --branch sim /tmp/ros-docker && cp -R /tmp/ros-docker/sim/{sim,youbot_jaco_gazebo} $HOME/catkin_ws/src/ # && rm -rf /tmp/ros-docker
# Add permissions to executable files from ros-sharp, ignore moveit.
chmod +x $HOME/catkin_ws/src/ros-sharp/gazebo_simulation_scene/scripts/joy_to_twist.py
chmod +x $HOME/catkin_ws/src/ros-sharp/unity_simulation_scene/scripts/mouse_to_joy.py
touch $HOME/catkin_ws/src/kinova-ros/kinova_moveit/kinova_arm_moveit_demo/CATKIN_IGNORE
# sed -i 's+hardware_interface/++g' $HOME/catkin_ws/src/kinova-ros/kinova_description/urdf/kinova_common.xacro
# Install additional packages
sudo apt update
sudo apt install -y linux-headers-$(uname -r)
sudo apt install -y \
ros-kinetic-xacro \
ros-kinetic-gazebo-ros-control \
ros-kinetic-effort-controllers \
ros-kinetic-joint-state-controller \
ros-kinetic-joint-trajectory-controller \
ros-kinetic-ros-control \
ros-kinetic-ros-controllers \
ros-kinetic-gazebo-plugins \
ros-kinetic-gazebo-ros-pkgs \
ros-kinetic-rosbridge-server \
ros-kinetic-turtlebot-gazebo \
ros-kinetic-joint-state-publisher-gui \
ros-kinetic-rqt-graph
# Install packages using rosdep
cd $HOME/catkin_ws
rosdep install --from-path src --ignore-src -ry
# Build workspace
catkin build
# Cleanup
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*
# Add line to source workspace
# sudo -H -u vagrant bash -c "grep -q -F 'source /opt/ros/kinetic/setup.bash' ~/.bashrc || echo 'source $HOME/catkin_ws/devel/setup.bash --extend' >> ~/.bashrc"
