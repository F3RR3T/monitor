#! /bin/bash -

#  SJP 6 Sept 2014
# send an email telling me that the IP address has changed
# called from monitor.sh

cd ~/mail/monitor

cat <<- EOF > emailbody.txt
	Notification of changed IP address
	==================================

	Old IP and date of recording:
	$(cat data/tmp.*)

	New IP:  $ip
	Date  :  $dt
	users :  $(w)
EOF


cat emailbody.txt | mail -A cumquat -s "Cumquat: IP has changed" $EMAILST33V
rm emailbody.txt


