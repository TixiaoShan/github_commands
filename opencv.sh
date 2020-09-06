#!/bin/sh
# script to install opencv with opencv_contrib
# replace "3.2.0" with the version you want

rm -rf ~/Downloads/opencv-3.2.0
rm -rf ~/Downloads/opencv_contrib-3.2.0

wget -O ~/Downloads/opencv.zip https://github.com/opencv/opencv/archive/3.2.0.zip
wget -O ~/Downloads/opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.2.0.zip
cd ~/Downloads/ && unzip opencv.zip -d ~/Downloads/
cd ~/Downloads/ && unzip opencv_contrib.zip -d ~/Downloads/

cd ~/Downloads/opencv-3.2.0 && rm -rf build
mkdir build && cd build

cd ~/Downloads/opencv-3.2.0/build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D OPENCV_EXTRA_MODULES_PATH=~/Downloads/opencv_contrib-3.2.0/modules \
      -D ENABLE_PRECOMPILED_HEADERS=OFF \
      -D BUILD_EXAMPLES=ON .. \
      -D OPENCV_ENABLE_NONFREE=ON ..

sudo make install -j8