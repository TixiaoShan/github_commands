#!/bin/sh
# Install Robot Operating System (ROS) for new OS
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo "${green}Begin to install ...${reset}"

#########################################################
# ROS melodic
echo "${green}Begin to install ROS melodic...${reset}"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install -y ros-melodic-desktop-full
# Initialize rosdep
sudo rosdep init
rosdep update
# Environment Setup
echo "\n" >> ~/.bashrc
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
# python
sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential

#########################################################
# ros package
echo "${green}install ROS packages${reset}"
sudo apt-get install -y ros-melodic-slam-gmapping
sudo apt-get install -y ros-melodic-navigation
sudo apt-get install -y ros-melodic-octomap*
sudo apt-get install -y ros-melodic-jackal-*
sudo apt-get install -y ros-melodic-velodyne-*
sudo apt-get install -y ros-melodic-tf-*
sudo apt-get install -y ros-melodic-robot-localization
sudo apt-get install -y ros-melodic-teb-local-planner
sudo apt-get install -y ros-melodic-imu-transformer
sudo apt-get install -y ros-melodic-librealsense2
sudo apt-get install -y ros-melodic-realsense2-camera
sudo apt-get install -y ros-melodic-microstrain-mips
sudo apt-get install -y ros-melodic-pointcloud-to-laserscan
sudo apt-get install -y ros-melodic-nmea-navsat-driver
sudo apt-get install -y libignition-math2-dev # for velodyne gazebo plugin

#########################################################
# ros ip setup
echo "${green}ROS ip setup${reset}"
echo "\n" >> ~/.bashrc
echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc
echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc
echo "\n" >> ~/.bashrc

#########################################################
# git setup
# git config --global user.name "TixiaoShan"
# git config --global user.email "tixiao.shan@gmail.com"
# git config --global credential.helper cache
# git config --global credential.helper 'cache --timeout=360000'

########################################################
# Edit ros kill timeout
# sudo gedit /opt/ros/melodic/lib/python2.7/dist-packages/roslaunch/nodeprocess.py

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
