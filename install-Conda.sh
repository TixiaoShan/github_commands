#!/bin/sh
# Install Robot Operating System (ROS) for new OS
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo "${green}Begin to install ...${reset}"

#########################################################
# Install pip
echo "${green}install pip ...${reset}"
sudo apt -y install python-pip
sleep 3
pip install --upgrade --user pip
sleep 3
#########################################################
# Install Python packages
echo "${green}install Python packages ...${reset}"
pip install --user torch
pip install --user torchvision
pip install --user launchpadlib
pip install --user testresources
pip install --user jupyter
pip install --user imageio
pip install --user pandas
pip install --user scikit-image
pip install --user sklearn
pip install --user seaborn
pip install --user keras
pip install --user -U --ignore-installed tensorflow-gpu
