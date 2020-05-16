cd ~/Downloads
folder=$(date +%Y%m%d_%H%M%S)
mkdir $folder && cd $folder
rosbag record --split --duration=1m /points_raw /imu_raw /camera/image_raw
