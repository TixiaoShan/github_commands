#!/bin/sh

sudo apt-get install -y ros-kinetic-librealsense2
sudo apt-get install -y ros-kinetic-realsense2-camera

# Add public key
sudo apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key

# Add the server to the list of repositories
sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" -u

# Refresh the local packages cache by invoking:
sudo apt-get update

# Install the libraries
sudo apt-get install -y librealsense2-dkms
sudo apt-get install -y librealsense2-utils
