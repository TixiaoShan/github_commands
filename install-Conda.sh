#!/bin/sh
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo "${green}Begin to install Conda${reset}"

echo "${green}Download conda${reset}"
wget -O ~/Downloads/conda.sh "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"

echo "${green}Intall conda${reset}"
chmod +x ~/Downloads/conda.sh
. ~/Downloads/conda.sh

echo "${green}Configure conda${reset}"
echo ". /home/tixiao/miniconda3/etc/profile.d/conda.sh" >> ~/.bashrc