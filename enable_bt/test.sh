#sudo rmmod hci_uart
sudo rmmod enable_rtl8723bs_bt
sudo insmod /home/k/Desktop/enable_bt/enable_rtl8723bs_bt.ko 
#sudo insmod /lib/modules/4.2.0-27-generic/kernel/drivers/bluetooth/hci_uart.ko
sudo rtk_hciattach -n -s 115200 ttyS4 rtk_h5  > hciattach-1.txt 2>&1 
