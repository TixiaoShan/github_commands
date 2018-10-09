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
# install ssh server
echo "${green}install SSH server${reset}"
sudo apt-get install -y openssh-server

#########################################################
# ros ip setup
echo "${green}ROS ip setup${reset}"
echo "export ROS_MASTER_URI=http://192.168.0.101:11311" >> ~/.bashrc
echo "export ROS_HOSTNAME=192.168.0.101" >> ~/.bashrc

#########################################################
# Network Time Protocol
echo "${green}Time Protocol${reset}"
sudo apt-get install -y chrony
sudo ntpdate ntp.ubuntu.com

#########################################################
echo "${green}Intall Softwares${reset}"
sudo apt-get install -y synaptic
sudo apt-get install -y gdebi
sudo apt-get install -y gimp
sudo apt-get install -y ksnapshot
sudo apt-get install -y gparted
sudo apt-get install -y psensor
sudo apt-get install -y lm-sensors
sudo apt-get install -y exfat-fuse
sudo apt-get install -y exfat-utils
sudo apt-get install -y terminator

#########################################################
echo "${green}Install Softwares ${reset}"
cd ~/Downloads/
wget -O ~/Downloads/dropbox.deb "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb"
sudo gdebi dropbox.deb
wget -O ~/Downloads/chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo gdebi chrome.deb
wget -O ~/Downloads/sublime.deb "https://download.sublimetext.com/sublime-text_build-3126_amd64.deb"
sudo gdebi sublime.deb

#########################################################
echo "${green}Install gtsam ${reset}"
cd ~/Downloads/
git clone https://bitbucket.org/gtborg/gtsam.git
cd ~/Downloads/gtsam
mkdir build
cd build
cmake ..
sudo make install -j8

# #########################################################
# echo "${green}Install Gazebo 9 ${reset}"
# sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
# wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
# sudo apt-get update
# sudo apt-get install -y ros-kinetic-gazebo9*

#########################################################
# Install CUDA 9.0
echo "${green}install cuda 9.0...${reset}"
cd ~/Downloads/
wget -O ~/Downloads/cuda.deb "http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb"
sudo dpkg -i cuda.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda-9-0

#########################################################
# Install cdDNN
echo "${green}install cudnn...${reset}"
# https://developer.nvidia.com/rdp/cudnn-download
cd ~/Downloads
tar -xzvf cudnn-9.0-linux-x64-v7.1.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h
sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc

#########################################################
# Install jupyter notebook
echo "${green}install jupyter ...${reset}"
sudo apt -y install python-pip
sudo pip install --upgrade pip

#########################################################
# Install tensorflow
echo "${green}install tensorflow ...${reset}"
sudo pip install -U --ignore-installed tensorflow-gpu
sudo pip install keras

#########################################################
# Install Pytorch
echo "${green}install pytorch ...${reset}"
sudo pip install torch
sudo pip install torchvision

sudo pip install launchpadlib
sudo pip install testresources
sudo pip install jupyter
sudo pip install imageio
sudo pip install pandas
sudo pip install scikit-image
sudo pip uninstall numpy
sudo pip install numpy==1.14.5


#########################################################
echo "${green}sublime python autocompletion ...${reset}"
# Open command pallet (default: ctrl+shift+p)
# Type package control install and select command Package Control: Install Package
# package: bracket highlight
# package: andconda


# Ryan Clark
# Single User License
# EA7E-812479
# 2158A7DE B690A7A3 8EC04710 006A5EEB
# 34E77CA3 9C82C81F 0DB6371B 79704E6F
# 93F36655 B031503A 03257CCC 01B20F60
# D304FA8D B1B4F0AF 8A76C7BA 0FA94D55
# 56D46BCE 5237A341 CD837F30 4D60772D
# 349B1179 A996F826 90CDB73C 24D41245
# FD032C30 AD5E7241 4EAA66ED 167D91FB
# 55896B16 EA125C81 F550AF6B A6820916

# Just go to Preferences -> Settings-User and add there: "update_check": false,


########################################################
# mount drive start up
# sudo blkid
# sudo gedit /etc/fstab
# UUID=CA009B90009B825D /media/ntfs ntfs rw,nosuid,nodev,noatime,allow_other 0 0
