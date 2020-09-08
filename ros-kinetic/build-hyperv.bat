vagrant up --provider=hyperv --provision
vagrant halt
vagrant package --output ros-kinetic-hyperv.box
REM vagrant cloud publish fredrikbaberg/ros-kinetic-base YYYYMM.DD.X hyperv ros-kinetic-hyperv.box