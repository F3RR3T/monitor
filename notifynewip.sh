#! /bin/bash -

#  SJP 6 Sept 2014
# send an email telling me that the IP address has changed
# called from monitor.sh

cd ~/mail/monitor

cat <<- EOF > emailbody.txt
	Notification of changed IP address
	==================================

	The IP address of cumquat has changed.

	Old IP and date of recording:
EOF

cat data/tmp.* >> emailbody.txt

cat <<- EOF >> emailbody.txt
	New IP:  $ip
	Date  :  $dt
	
EOF

uptime >> emailbody.txt

cat emailbody.txt | mail -A cumquat -s "IP has changed" $EMAILST33V
rm emailbody.txt


