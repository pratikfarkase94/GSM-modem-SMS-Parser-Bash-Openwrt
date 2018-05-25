# GSM-modem-SMS-Parser-Bash-Openwrt
After searching for lot of forums for parsing incoming SMS from GSM modems, i ran out of options as no forum mentions how to parse the incoming SMS from GSM modems, I finally had a chance and was successful at parsing the incoming messages in proper format. Anyone who has trouble parsing the messages will find this tutorial helpful.

Adding on, i have developed some functions for GSM modem for sending SMS, reading and Parsing SMS, Deleting, getting signal info, and sim card status. All are written in Bash shell scripting on Openwrt and tested with 3 modems i got a chance to work with : QUECTEL: EC-25E, HUAWEI: ME909s-821 and SIMCOM: SIM7100E. These functions can run on any linux system like RaspberryPi or BeagleBone Black, provided you have installed proper drivers for the GSM modem and are able to send AT commands to the modems, have bash shell installed and have comgt utility installed.  

To get them to work, make sure you have comgt utility installed on your linux. If not, you can install it by sudo apt-get install comgt. If you can communicate with your GSM modem via AT commands, that means you are ready to run these scripts.

![alt text](https://github.com/pratikfarkase94/GSM-modem-SMS-Parser-Bash-Openwrt/blob/master/sendSMS.png)


