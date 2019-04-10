#!/bin/sh
# Install Robot Operating System (ROS) for new OS
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo "${green}Begin to install ...${reset}"

#########################################################
# Adjust system time
#timedatectl set-local-rtc 1 --adjust-system-clock
sudo apt-get install ntp
timedatectl

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
echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc
echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc

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
sudo apt-get install -y ffmpeg

#########################################################
echo "${green}Install Softwares ${reset}"
cd ~/Downloads/
wget -O ~/Downloads/dropbox.deb "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb"
sudo gdebi dropbox.deb
wget -O ~/Downloads/chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo gdebi chrome.deb
wget -O ~/Downloads/sublime.deb "https://download.sublimetext.com/sublime-text_build-3176_amd64.deb"
sudo gdebi sublime.deb

#########################################################
echo "${green}Install gtsam ${reset}"
cd ~/Downloads/
# git clone https://bitbucket.org/gtborg/gtsam.git
wget -O ~/Downloads/gtsam.zip https://github.com/borglab/gtsam/archive/4.0.0-alpha2.zip
unzip gtsam.zip -d ~/Downloads/gtsam
cd ~/Downloads/gtsam
mkdir build
cd build
cmake ..
sudo make install -j8

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

#########################################################
# Install jupyter notebook
echo "${green}install jupyter ...${reset}"
sudo apt -y install python-pip
sleep 3
pip install --upgrade pip
sleep 3
#########################################################
# Install Pytorch
echo "${green}install pytorch ...${reset}"
pip install --user torch
pip install --user torchvision

pip install --user launchpadlib
pip install --user testresources
pip install --user jupyter
pip install --user imageio
pip install --user pandas
pip install --user scikit-image
pip install --user sklearn
# pip uninstall numpy
# pip install --user numpy==1.14.5

#########################################################
# Install tensorflow
echo "${green}install tensorflow ...${reset}"
pip install --user -U --ignore-installed tensorflow-gpu
pip install --user keras

#########################################################
# echo "${green}Install Texworks and TexLive ...${reset}"
sudo apt-get -y install texworks
sudo apt-get -y install texstudio
sudo apt-get -y install texlive-full


#########################################################
# Install CUDA
echo "${green}install cuda ...${reset}"
cd ~/Downloads/
wget -O ~/Downloads/cuda.deb "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb"
sudo dpkg -i cuda.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda-10-0

#########################################################
# Install cdDNN
echo "${green}install cudnn...${reset}"
# https://developer.nvidia.com/rdp/cudnn-download
cd ~/Downloads
tar -xzvf cudnn.tgz # change the name as may have newer versions
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h
sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc

#########################################################
#sgbteam
#Single User License
#EA7E-1153259
#8891CBB9 F1513E4F 1A3405C1 A865D53F
#115F202E 7B91AB2D 0D2A40ED 352B269B
#76E84F0B CD69BFC7 59F2DFEF E267328F
#215652A3 E88F9D8F 4C38E3BA 5B2DAAE4
#969624E7 DC9CD4D5 717FB40C 1B9738CF
#20B3C4F1 E917B5B3 87C38D9C ACCE7DD8
#5F7EF854 86B9743C FADC04AA FB0DA5C0
#F913BE58 42FEA319 F954EFDD AE881E0B

# Just go to Preferences -> Settings-User and add there: "update_check": false,

########################################################
# mount drive start up
# sudo blkid
# sudo gedit /etc/fstab
# UUID=CA009B90009B825D /media/ntfs ntfs rw,nosuid,nodev,noatime,allow_other 0 0

########################################################
# Edit ros kill timeout
# /opt/ros/kinetic/lib/python2.7/dist-packages/roslaunch/nodeprocess.py
