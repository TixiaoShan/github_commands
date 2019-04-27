#!/bin/sh
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo "${green}Begin to install ...${reset}"
#########################################################
# WIFI driver
echo "${green}Begin to install WIFI driver...${reset}"
sudo apt-get update
sudo apt-get install linux-headers-generic build-essential -y
sudo -i
cd /compat-drivers-3.9-rc4-2-s/
./scripts/driver-select ath9k
cd /usr/src/linux-headers-3.10.40-ga7da876
sudo make modules_prepare
cd /compat-drivers-3.9-rc4-2-s
make
make install
modprobe ath9k
#########################################################
echo "${green}Begin to install ROS ...${reset}"
# Configure repositories
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt-add-repository restricted
sudo apt-get update
# Setup Locale
sudo update-locale LANG=C LANGUAGE=C LC_ALL=C LC_MESSAGES=POSIX
# Setup sources.lst
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
# Setup keys
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -

# Installation
sudo apt-get update
sudo apt-get install ros-indigo-ros-base -y

echo "${green}Begin to install python...${reset}"
# Initialize rosdep
sudo apt-get install python-rosdep -y
sudo rosdep init

# To find available packages, use:
rosdep update

# Environment Setup
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Install rosinstall
sudo apt-get install python-rosinstall -y
#########################################################
# install ssh server
echo "${green}Begin to install SSH server...${reset}"
sudo apt-get install openssh-server -y
#########################################################
# ros ip setup
echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc
echo "export ROS_HOSTNAME=192.168.0.17" >> ~/.bashrc
#########################################################
# Network Time Protocol
sudo apt-get install chrony -y
sudo ntpdate ntp.ubuntu.com
#########################################################
# Turtlebot
echo "${green}Begin to turtlebot ...${reset}"
sudo apt-get install ros-indigo-turtlebot ros-indigo-turtlebot-apps ros-indigo-turtlebot-interactions ros-indigo-kobuki-ftdi ros-indigo-rocon-remocon ros-indigo-rocon-qt-library ros-indigo-ar-track-alvar-msgs -y
sudo apt-get install ros-indigo-turtlebot-stdr -y
sudo apt-get install ros-indigo-turtlebot-stage -y
#########################################################
# some libraries
echo "${green}Begin to install essential libraries...${reset}"
#sudo apt-get install ros-indigo-octomap* -y
sudo apt-get install ros-indigo-dynamic-edt-3d -y
sudo apt-get install libgsl0-dev -y


#sudo apt-get install ros-indigo-cv-bridge -y
#sudo apt-get install ros-indigo-roslint -y
#sudo apt-get install ros-indigo-filters -y
#sudo apt-get install ros-indigo-camera-info-manager -y
#sudo apt-get install ros-indigo-diagnostic-updater -y
#sudo apt-get install ros-indigo-rqt-* -y
#sudo apt-get install ros-indigo-costmap-* -y
#sudo apt-get install ros-indigo-depth-image-pr* -y
#sudo apt-get install ros-indigo-joy -y
#sudo apt-get install ros-indigo-xacro -y
#sudo apt-get install ros-indigo-nav-core -y
#sudo apt-get install ros-indigo-navfn -y
#sudo apt-get install ros-indigo-base-local-planner -y











