#!/bin/bash
vagrant up --provider=virtualbox --provision
vagrant halt
vagrant package --output ros-kinetic-virtualbox.box
REM vagrant cloud publish fredrikbaberg/ros-kinetic-base YYYYMM.DD.X virtualbox ros-kinetic-virtualbox.box