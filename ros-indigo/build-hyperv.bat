vagrant up --provider=hyperv --provision
vagrant halt
vagrant package --output ros-indigo-hyperv.box
REM vagrant cloud publish fredrikbaberg/ros-indigo-base YYYYMM.DD.X hyperv ros-indigo-hyperv.box