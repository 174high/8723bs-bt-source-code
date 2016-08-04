In this document, we introduce how to support rtk UART BT driver in Linux system.
Support kernel version 2.6.32~3.19.0

===========================================================================================================
The default settings of RTK BT chip are H5 protocol, Flow control on, parity even and use internel 32k clock.
The default baund rate is 115200.
To support H5 protocal,you need to install hci_uart driver and rtk_hciattach tool.

1.make sure your hardware setting is correct according to Rtk8723BS support document.

2.Install rtk_hciattach tool and Install uart driver

	Insert BT dongle and Enable Bluetooth as follows:

	1) sudo make install

	2) sudo rtk_hciattach -n -s 115200 ttyUSB0 rtk_h5

tips:ttyUSB0 is serial port name in your system, you should change it according to hardware such as ttyS0.

3. Uninstall
	sudo make uninstall
	unplug RTK bt dongle


===========================================================================================================
if you want to change the parameter such as baud rate and pcm settings, 
you should modify rtlbt_config file which is described in  support document.


===========================================================================================================
 if you want to use h4 protocol, make sure
(1) efuse setting is set to use H4
(2) sudo rtk_hciattach -n -s 115200 ttyUSB0 rtk_h4
===========================================================================================================








