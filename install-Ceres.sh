#!/bin/sh
# http://ceres-solver.org/installation.html
cd ~
git clone https://ceres-solver.googlesource.com/ceres-solver
# sudo apt-get install cmake
sudo apt-get install libgoogle-glog-dev
sudo apt-get install libatlas-base-dev
sudo apt-get install libeigen3-dev

cd ceres-solver
mkdir ceres-bin && cd ceres-bin
cmake ..
sudo make install -j4
