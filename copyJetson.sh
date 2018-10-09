red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo "${red}Beginning to copy files ...${reset}"

sshpass -p "ubuntu" scp -r /home/tixiao/catkin_ws/src/traversability_map ubuntu@192.168.1.100:~/catkin_ws/src
echo "${green}lidar_odometry done!${reset}"

