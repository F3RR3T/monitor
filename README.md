monitor.sh
=======

*Automated email sender that monitors and reports on network and sensors*

This script is called periodically (such as from a cron job). It obtains the internet (external IP 
address and logs it to a temporary file. When the external IP address changes, the following steps occur:
- The owner is notified by email of the address change.
- The log file is deleted.
 
## Update
After writing this script I learnt how to use dynamic DNS redirectors to take over the hard work of keeping up to date with my IP address.

["Cumquat"](http://st33v.ddns.net) is a Raspberry Pi running this and some other scripts.

