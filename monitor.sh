#!/usr/bin/env bash


REPORT="monitor_report.txt"

echo "System Monitoring Report" > $REPORT

echo "Date: $(date)" >> $REPORT


echo " " >> $REPORT


echo "Log Errors and Failed Attempts:" >> $REPORT
grep -iE "failed\|error" /var/log/syslog 2>/dev/null | tail -20 >> "$REPORT"
echo "" >> $REPORT

echo "Disk Usage Check:" >> $REPORT
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ $USAGE -gt 20 ]; then
    echo "WARNING: Disk usage is above 20% ($USAGE%)" >> $REPORT
else
    echo "Disk Usage is normal ($USAGE%)" >> $REPORT
fi

echo "" >> $REPORT

echo "CPU Usage check:" >> $REPORT

CPU_INT=$(top -bn1 |awk -F',' '/Cpu\(s\)/ {print 100 -$4}' | cut -d. -f1)

if [ $CPU_INT -gt 70 ]; then
    echo "WARNING: CPU usage is above 70% ($CPU_INT%)" >> $REPORT
else
    echo "CPU usage is normal ($CPU_INT%)" >> $REPORT
fi

echo "" >> $REPORT
echo " End of report" >> $REPORT
