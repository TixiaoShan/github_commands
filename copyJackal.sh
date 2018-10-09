red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo "${red}Beginning to copy files ...${reset}"

sshpass -p "clearpath" scp -r /home/tixiao/catkin_ws/src/traversability_mapping administrator@192.168.1.189:~/catkin_ws/src
echo "${green}traversability_mapping done!${reset}"

sshpass -p "clearpath" scp -r /home/tixiao/catkin_ws/src/lidar_odometry administrator@192.168.1.189:~/catkin_ws/src
echo "${green}lidar_odometry done!${reset}"