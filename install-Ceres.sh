#!/bin/sh
# http://ceres-solver.org/installation.html
cd ~/Downloads
git clone https://ceres-solver.googlesource.com/ceres-solver

# Install eigen
wget -O ~/Downloads/eigen.deb "http://ftp.br.debian.org/debian/pool/main/e/eigen3/libeigen3-dev_3.3.7-1_all.deb"
cd ~/Downloads && sudo gdebi eigen.deb

# sudo apt-get install cmake
sudo apt-get install -y libgoogle-glog-dev
sudo apt-get install -y libatlas-base-dev

# Compile Ceres
cd ~/Downloads/ceres-solver
mkdir ceres-bin && cd ceres-bin
cmake ..
sudo make install -j4
