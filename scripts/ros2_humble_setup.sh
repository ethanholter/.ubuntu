#!/bin/bash

# idempotent - yes

yes | sudo apt update && yes | sudo apt install locales
yes | sudo locale-gen en_US en_US.UTF-8
yes | sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

yes | sudo apt install software-properties-common
sudo add-apt-repository universe

yes | sudo apt update && yes | sudo apt install curl -y
yes | sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

yes | sudo apt update
yes | sudo apt upgrade

yes | sudo apt install ros-humble-desktop
yes | sudo apt install python3-rosdep2 tmux python3-venv

if ! grep -qF "source /opt/ros/humble/setup.bash" ${HOME}/.bashrc; then
    echo "source /opt/ros/humble/setup.bash" >> ${HOME}/.bashrc
fi

rosdep update

echo "Done"