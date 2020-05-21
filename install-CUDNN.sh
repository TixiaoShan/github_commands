#!/bin/sh

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
