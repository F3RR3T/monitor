monitor.sh
=======

*Automated email sender that monitors and reports on network and sensors*

This script is called periodically (such as from a cron job). It obtains the internet (external IP 
address and logs it to a temporary file. When the external IP address changes, the following steps occur:
- The owner is notified by email of the address change.
- The log file is deleted.

