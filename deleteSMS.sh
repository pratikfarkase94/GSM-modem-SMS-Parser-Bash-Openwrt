#!/bin/bash
# Run this file as root@Openwrt:# bash deleteSMS.sh

	echo -e "\n"
	echo -e "Enter the Message Number to Delete\n\n--->\c"
	read -e MessageNum 
	echo -e "AT+CMGD=$MessageNum \r\n" > /dev/ttyUSB2 && timeout 2 cat /dev/ttyUSB2 > del.txt
	if grep -w -q "OK" del.txt; then                                                                                                     
        echo -e "\n"                                                                                                                            
        echo -e "###### Message Number $MessageNum Deleted ######\n"                                                                                                      
        elif grep -w -q "ERROR" del.txt; then                                                                                                
        echo -e "\n"                                                                                                                            
        echo -e "###### ERROR Deleting Message, Please Try Again ######"                                                                                         
        echo -e "\n"                                                                                                                            
        fi   	
	


