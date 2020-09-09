### Git clone and build
git clone https://github.com/fredrikbaberg/vagrantboxes $HOME/vagrantboxes
# Kinetic
cd $HOME/vagrantboxes/ros-kinetic && bash build-virtualbox.sh
mkdir -p /vagrant/boxes
cp ros-kinetic-virtualbox.box /vagrant/boxes/
# Indigo
cd $HOME/vagrantboxes/ros-indigo && bash build-virtualbox.sh
mkdir -p /vagrant/boxes
cp ros-indigo-virtualbox.box /vagrant/boxes/
