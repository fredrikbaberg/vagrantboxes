#!/bin/bash
vagrant up --provider=virtualbox --provision
vagrant halt
vagrant package --output ros-indigo-virtualbox.box
REM vagrant cloud publish fredrikbaberg/ros-indigo-base YYYYMM.DD.X virtualbox ros-indigo-virtualbox.box