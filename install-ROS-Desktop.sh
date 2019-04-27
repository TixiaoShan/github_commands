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
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
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
# ros packaged
echo "${green}install ROS packages${reset}"
sudo apt-get install -y ros-kinetic-slam-gmapping
sudo apt-get install -y ros-kinetic-navigation
sudo apt-get install -y ros-kinetic-octomap*
sudo apt-get install -y libignition-math2-dev # for velodyne gazebo plugin

#########################################################
# ros ip setup
echo "${green}ROS ip setup${reset}"
echo "\n" >> ~/.bashrc
echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc
echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc

########################################################
# Edit ros kill timeout
# /opt/ros/kinetic/lib/python2.7/dist-packages/roslaunch/nodeprocess.py

#########################################################
# echo "${green}Install libpointmatcher ${reset}"
# cd ~/Downloads/
# git clone https://github.com/ethz-asl/libnabo.git
# cd ~/Downloads/libnabo && mkdir build && cd build
# cmake ..
# make -j8
# sudo make install
# cd ~/Downloads/
# git clone https://github.com/ANYbotics/libpointmatcher.git
# cd ~/Downloads/libpointmatcher && mkdir build && cd build
# cmake .. 
# make -j8
# sudo make install
