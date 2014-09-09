#!/bin/bash -
#  SJP 9 Sept 2014
#  Run by cron after reboot.
#  Sends an email to st33v.

# https://www.linuxquestions.org/questions/linux-server-73/delay-startup-script-until-15-minutes-after-boot-661245/
#	at now + 15 minutes -f your_script
# Alternately, use a script, whose first line is
#	sleep 900
# and start it from rc.local like this
#	nohup /path/myscript &
# which will disconnect it from the startup and background it.

cd ~/mail/monitor
touch data/heartlock  # make a file to stop heartbeat overwriting

cat <<- EOF > data/emailbody.txt
	Cumquat has rebooted
	====================

	$(cat data/heartbeat.txt)

	-----------------------------------------------------------
	Current status at $(date): 
	$(procinfo -Hr)

	-----------------------------------------------------------
	Was there a shutdown command?
	$(cat /var/log/auth.log | grep shutdown)

EOF

sleep 180  # wait 3 mins to make sure have network
cat data/emailbody.txt | mail -A cumquat -s "Cumquat reboot notification" $EMAILST33V
rm data/emailbody.txt
rm data/heartlock
