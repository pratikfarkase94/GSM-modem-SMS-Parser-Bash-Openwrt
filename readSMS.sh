#!/bin/bash
# Run this file as root@Openwrt:# bash readSMS.sh


	echo -e "Checking SIM CARD Status, "                                                                                                    
        comgt > sim.txt                                                                                                                     
        if grep -w -q "ERROR" sim.txt; then                                                                                                       
        echo -e "\n"                                                                                                                            
        echo -e "SIM not Inserted, Unable to read SMS, Please Enter SIM\n"  
	fi                                                   
        if grep -w -q "Registered" sim.txt; then                                                                                                
        echo -e "SIM CARD DETECTED,\n"
	echo -e "AT+CPMS? \r\n" > /dev/ttyUSB2 && timeout 2 cat /dev/ttyUSB2 > numbermsgs.txt
	echo -e "AT+CMGF=1 \r\n" > /dev/ttyUSB2 
	sleep 1
	#echo -e "AT+CPMS? \r\n" > /dev/ttyUSB2 && timeout 2 cat /dev/ttyUSB2 > numbermsgs.txt
	echo $(grep -Eo '[0-9\.]+' numbermsgs.txt) > no.txt                    
        var=$(awk '{ print $1 }' no.txt)	
	echo -e "Total Number of received messages = $var"
	echo -e "AT+CMGL=\"ALL\" \r\n" > /dev/ttyUSB2 && timeout 2 cat /dev/ttyUSB2 > SMS.txt
	sed -n '/+CMGL:/,/"/p' SMS.txt | awk '{gsub("+CMGL:", "");print}' SMS.txt  >  filter.txt
	grep -o '".*"' filter.txt   | sed 's/"//g' > comma.txt && sed -i '/ALL/d' comma.txt 
	j=0                                                                                                                                             
	for (( k=0; k<$var; k++ ))                                                                                                                     
	do                                                                                                                                              
                                                                                                                                                
	filecontent=$(cat comma.txt)                                                                                                                    
	IFS=',' read -r -a array <<< "$filecontent"                                                                                                     
                                                                                                                                                
	i=0                                                                                                                                             
	for element in "${array[i]}"                                                                                                                    
	do                                                                                                                                              
        echo -e "Message : $j"                                                                                                                  
        echo -e "Status = "$element""                                                                                                           
        i=1   
                                                                                                                                           
	for element in "${array[i]}"                                                                                                                    
	do                                                                                                                                              
        echo -e "Number = "$element""                                                                                                           
        i=3   
                                                                                                                                  
	for element in "${array[i]}"                                                                                                                    
	do                                                                                                                                              
        echo -e "Date   = "$element" (YYYY/MM/DD)"                                                                                                           
        i=4  
                                                                                                                                   
	for element in "${array[i]}"                                                                                                                    
	do  
                                                                                                                                            
        echo -e "Time   = "$element""  
                                                                                                         
	done                                                                                                                                            
	done                                                                                                                                            
	done                                                                                                                                            
	done                                                                                                                                            

	echo -e "AT+CMGR=$j \r\n" > /dev/ttyUSB2 && timeout 2 cat /dev/ttyUSB2 > text.txt                                                               
	echo -e "Message = $(sed -n '/+CMGR:/,/OK/{/+CMGR:/b;/OK/b;p}' text.txt)"                                                                       
                                                                                                                                                
	j=$((j+1))
                                                                                                                                                
	echo -e "\n"                                                                                                                                    
	echo "$(tail -n +2 comma.txt)" > comma.txt                                                                                                      
	done                                                                                                                                            
                                                                                                                                                   
	grep -o '".*"' filter.txt   | sed 's/"//g' > comma.txt && sed -i '/ALL/d' comma.txt  
	#echo -e "AT+CMGL=\"ALL\" \r\n" > /dev/ttyUSB2 && timeout 2 cat /dev/ttyUSB2 > SMS.txt
	fi
	if grep -w -q "ERROR" SMS.txt; then
	echo -e "\n"
	echo -e "Unable to display messages\n"
	else
	#cat SMS.txt
	echo -e "Done\n"
	fi

