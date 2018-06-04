#!/bin/bash
# Run this file as root@Openwrt:# bash sendSMS.sh
	
        comgt > sim.txt                                                                                                                     
        if grep -w -q "ERROR" sim.txt; then                                                                                                       
        echo -e "\n"                                                                                                                            
        echo -e "SIM not Inserted, Unable to send SMS, Please Enter SIM\n"    
	fi                                                                  
        if grep -w -q "Registered" sim.txt; then 
	echo -e "ATZ \r\n" > /dev/ttyUSB2
	sleep 1                                                                                               
	echo -e "Setting SMS mode to TEXT MODE....\c"
	echo -e "AT+CMGF=1 \r\n" > /dev/ttyUSB2 | echo -e "Done"
	echo -e "Enter the NUMBER you want to send to\n\n--->\c"
        read -e NUMBER
	echo -e "AT+CMGS=\"$NUMBER\"\r" > /dev/ttyUSB2
	sleep 1
	echo -e "\n"
	echo -e "Enter the MESSAGE TEXT you want to send\n\n--->\c"
	read -e MESSAGE
	echo -e "$MESSAGE\x1A" > /dev/ttyUSB2 && timeout 5 cat /dev/ttyUSB2 > status.txt
	fi
	if grep -w -q "OK" status.txt; then
	echo -e "\n"
	echo -e "###### SMS Sent ######\n"
	elif grep -w -q "ERROR" status.txt; then
	echo -e "\n"
	echo -e "###### SMS Not Sent, Try Again ######"
	echo -e "\n"
	fi
	rm status.txt sim.txt

