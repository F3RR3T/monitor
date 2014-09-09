#!/bin/bash -

# heartbeat.sh
# SJP 9 September 2014
#
# Monitors uptime and logs it in case of shutdown
#
# Designed to be run frequently from cron

# Have we just rebooted? Don't want to overwrite!
[ -e ~/mail/monitor/data/heartlock ] && exit 1337

# get CPU temperature
cputemp=$(cat /sys/class/thermal/thermal_zone0/temp)
cputemp=$[cputemp/1000]

cat << EOF > ~/mail/monitor/data/heartbeat.txt 

Heartbeat: $(date)   CPU temperature: $cputemp
--------------------------------------
$(procinfo -Hr)

EOF


