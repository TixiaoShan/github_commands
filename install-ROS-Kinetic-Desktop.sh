#!/bin/sh
# Install Robot Operating System (ROS) for new OS
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo "${green}Begin to install ...${reset}"

#########################################################
# ROS Kinetic
echo "${green}Begin to install ROS Kinetic...${reset}"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update
sudo apt-get install -y ros-kinetic-desktop-full
# Initialize rosdep
sudo rosdep init
rosdep update
# Environment Setup
echo "\n" >> ~/.bashrc
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
# python
sudo apt-get install -y python-rosinstall python-rosinstall-generator python-wstool build-essential

#########################################################
# ros package
echo "${green}install ROS packages${reset}"
sudo apt-get install -y ros-kinetic-jackal-*
sudo apt-get install -y ros-kinetic-velodyne-*
sudo apt-get install -y ros-kinetic-navigation
sudo apt-get install -y ros-kinetic-robot-localization
sudo apt-get install -y ros-kinetic-microstrain-mips
sudo apt-get install -y ros-kinetic-nmea-navsat-driver
sudo apt-get install -y ros-kinetic-image-exposure-msgs
sudo apt-get install -y ros-kinetic-wfov-camera-msgs
sudo apt-get install -y libignition-math2-dev # for velodyne gazebo plugin

#########################################################
# ros ip setup
echo "${green}ROS ip setup${reset}"
echo "\n" >> ~/.bashrc
echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc
echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc
echo "\n" >> ~/.bashrc

########################################################
# Edit ros kill timeout
# sudo gedit /opt/ros/kinetic/lib/python2.7/dist-packages/roslaunch/nodeprocess.py