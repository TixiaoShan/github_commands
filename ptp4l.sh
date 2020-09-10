#!/bin/sh

ETHERNET_NAME="enp0s31f6"

# configure ptp4l
sudo mkdir -p /etc/systemd/system/ptp4l.service.d
sudo touch /etc/systemd/system/ptp4l.service.d/override.conf

echo "[Service]" | sudo tee -a /etc/systemd/system/ptp4l.service.d/override.conf
echo "ExecStart=" | sudo tee -a /etc/systemd/system/ptp4l.service.d/override.conf
echo "ExecStart=/usr/sbin/ptp4l -f /etc/linuxptp/ptp4l.conf -i $ETHERNET_NAME" | sudo tee -a /etc/systemd/system/ptp4l.service.d/override.conf

sudo systemctl daemon-reload
sudo systemctl restart ptp4l
sudo systemctl status ptp4l

# higher priority clockClass
sudo sed -i 's/clockClass 248/clockClass 128/g' /etc/linuxptp/ptp4l.conf

# configure phc2sys
sudo mkdir -p /etc/systemd/system/phc2sys.service.d
sudo touch /etc/systemd/system/phc2sys.service.d/override.conf

echo "[Service]" | sudo tee -a /etc/systemd/system/phc2sys.service.d/override.conf
echo "ExecStart=" | sudo tee -a /etc/systemd/system/phc2sys.service.d/override.conf
echo "ExecStart=/usr/sbin/phc2sys -w -O 0 -s CLOCK_REALTIME -c enp0s31f6 -S 0.1" | sudo tee -a /etc/systemd/system/phc2sys.service.d/override.conf

sudo systemctl daemon-reload
sudo systemctl start phc2sys
sudo systemctl status phc2sys

# check
cat /etc/systemd/system/ptp4l.service.d/override.conf
cat /etc/systemd/system/phc2sys.service.d/override.conf

# validate time
while [ 1 ]
do
	sudo phc_ctl enp0s31f6 get && date +%s.%N
	sleep 1
done