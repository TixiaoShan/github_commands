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
# install ssh server
echo "${green}install SSH server${reset}"
sudo apt-get install -y openssh-server

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
sudo apt-get install -y unrar

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
wget -O ~/Downloads/gtsam.zip https://github.com/borglab/gtsam/archive/4.0.0.zip
cd ~/Downloads/ && unzip gtsam.zip -d ~/Downloads/
cd ~/Downloads/gtsam-4.0.0/
mkdir build && cd build
cmake -DGTSAM_USE_SYSTEM_EIGEN=ON ..
sudo make install -j4

#########################################################
# echo "${green}Install Texworks and TexLive ...${reset}"
# sudo apt-get -y install texworks
# sudo apt-get -y install texstudio
# sudo apt-get -y install texlive-full


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

