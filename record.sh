cd ~/Downloads
mkdir $(date +%Y%m%d_%H%M)
cd $(date +%Y%m%d_%H%M)
rosbag record --split --duration=10m /tf /tf_static /laser_cloud_less_flat /laser_cloud_less_sharp /velodyne_cloud_registered /ground_cloud /segmented_cloud_pure