### Git clone and build
git clone https://github.com/fredrikbaberg/vagrantboxes $HOME/vagrantboxes
mkdir -p /vagrant/boxes
### Kinetic
cd $HOME/vagrantboxes/ros-kinetic
vagrant up --provider=virtualbox --provision
vagrant halt
vagrant package --output virtualbox.box
cp virtualbox.box /vagrant/boxes/ros-kinetic-virtualbox.box
vagrant destroy -f
### Indigo
cd $HOME/vagrantboxes/ros-indigo
vagrant up --provider=virtualbox --provision
vagrant halt
vagrant package --output virtualbox.box
cp virtualbox.box /vagrant/boxes/ros-indigo-virtualbox.box
vagrant destroy -f
