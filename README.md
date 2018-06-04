# GSM-modem-SMS-Parser-Bash-Openwrt
After searching for lot of forums for parsing incoming SMS from GSM modems, i ran out of options as no forum mentions how to parse the incoming SMS from GSM modems, I finally had a chance and was successful at parsing the incoming messages in proper format. Anyone who has trouble parsing the messages will find this tutorial helpful.

Adding on, i have developed some functions for GSM modem for sending SMS, reading and Parsing SMS, Deleting, getting signal info, and sim card status. All are written in Bash shell scripting on Openwrt and tested with 3 modems i got a chance to work with : QUECTEL: EC-25E, HUAWEI: ME909s-821 and SIMCOM: SIM7100E. These functions can run on any linux system like RaspberryPi or BeagleBone Black, provided you have installed proper drivers for the GSM modem and are able to send AT commands to the modems, have bash shell installed and have comgt utility installed.  

To get them to work, make sure you have comgt utility installed on your linux. If not, you can install it by sudo apt-get install comgt. If you can communicate with your GSM modem via AT commands, that means you are ready to run these scripts.

1) First Script function is the sendSMS.sh for sending SMS. Run the script as root@Openwrt:# bash sendSMS.sh, It will first check if the SIM Card has been inserted, if not then it will throw SIM error message and terminate. If it detects SIM, it will first change the SMS mode to text mode and then prompt you for destination number and then the message text. If it send SMS successfully, it will throw ####SMS SENT#### or if not then ###SMS Not Sent###. See the picture below for more clarity.

![alt text](https://github.com/pratikfarkase94/GSM-modem-SMS-Parser-Bash-Openwrt/blob/master/sendSMS.png)


2) Second Script function is the readSMS.sh for reading and parsing SMS. Run the script as root@Openwrt:# bash readSMS.sh, It will first check if the SIM Card has been inserted, if not then it will throw SIM error message and terminate. If it detects SIM, it will first change the SMS mode to text mode and then start parsing and reading messages one by one in the manner like:-

                                   Total number of received messages = <number of messages>
                                   Message : <MessageNumber>
                                   Number  : <Sender's Number>
                                   Status  : <READ/UNREAD>
                                   Date    : <Message arrival date>
                                   Time    : <Message arrival Time>
                                   Message : <Message Text>
                                   
   See the Picture below for better clarity
   
   ![alt text](https://github.com/pratikfarkase94/GSM-modem-SMS-Parser-Bash-Openwrt/blob/master/readSMS.png)
 
 
3) Third Script function is the deleteSMS.sh for Deleting SMS. Run the script as root@Openwrt:# bash deleteSMS.sh, It will first check if the SIM Card has been inserted, if not then it will throw SIM error message and terminate. If it detects SIM, it will ask you for the message number to be deleted and will delete the message with message number you entered. See the Picture below for better clarity

![alt text](https://github.com/pratikfarkase94/GSM-modem-SMS-Parser-Bash-Openwrt/blob/master/deleteSMS.png)


4) Fourth Script function is the sigInfo.sh for Getting signal strength. Run the script as root@Openwrt:# bash sigInfo.sh. The function will return the signal strength as numerical value as well as alphabetical. See the Picture below for better clarity

![alt text](https://github.com/pratikfarkase94/GSM-modem-SMS-Parser-Bash-Openwrt/blob/master/sigInfo.png)




















