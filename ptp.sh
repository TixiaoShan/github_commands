#!/bin/sh

# run "ifconfig" to get ethernet/wan port name on your own computer
ETHERNET_NAME="eno1"

# install ptpd
sudo apt install ptpd

# enable master time (add -C to see log)
sudo ptpd -M -i $ETHERNET_NAME

# add startup script (ubuntu 16.04 and before)
# add "ptpd -g -i eno1" to file "/etc/rc.local"

# add startup script (ubuntu 18.04 and later)
touch ptpd_service.sh
echo "#!/bin/sh" >> ptpd_service.sh
echo "ptpd -g -i $ETHERNET_NAME" >> ptpd_service.sh
echo "exit 0" >> ptpd_service.sh
sudo chmod 755 ptpd_service.sh
sudo mv ptpd_service.sh /etc/init.d/
cd /etc/init.d/
sudo update-rc.d ptpd_service.sh defualts 90
