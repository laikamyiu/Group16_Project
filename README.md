# Group16_Project
CSE 411 Project #1

SCRIPT 1 (system security audit script):

Description: 
The script system_audti.sh is a script that runs automatically every day at 9am due to the cron job set up. Every time the script runs, it performs a basic system security audit where it collects system information and saves it to a timestamped report file located in a report directory called system_report.

Running the Script: 
In order to run the script, simply run “./system_audit.sh” in the corresponding directory where the zip file is located. Once the script successfully runs, a text consisting of “report_file sent!” will print to ensure that the system audit report was successfully created and sent to the right corresponding location. The script contains a check to see if the report directory created, if not, a directory called “system_report” will be generated with each audit report created and sent to inside that directory

Features/Checks:
The system audit report consists of multiple checks to ensure system integrity. The report first displays who and when the report was created to ensure internal control recordkeeping. Following this check, the additional following checks are performed:
- display current active logged-in users
- Shows recent login attempts
- List to active and listening network connections using ss/netstat

Each check is essential when it comes to auditing a system. The current logged-in users check allows you to quickly summarize who is authorized on your system. If you do not recognize a user, it may indicate a breach in your system. In addition, checking recent login attempts allows you to check who is assessing your system when you are not actively checking your current active user list. If you come across users that are unfamiliar upon checking the login attempts, it can also indicate there may be suspicious activity trying to gain access to your system. The last check displays open ports and networks running on the system. The information displayed allows you to monitor exposed ports or unfamiliar ports in order to detect malware or backdoor access to your system. This check uses the command ss to analyze network connections. Netstat is also utilized as the backup command as ss is the more modern and up to date tool compared to netstat

Cron job/Automation:
In order to run the script automatically, we can utilize cron jobs. In order to setup the cron job, open up the cron tab editor using “crontab -e”. Once you have a script tab open, add a line such as mine “0 9 * * * /home/jkwok/system_report/system_audit.sh”. My script is located in a directory, so therefore you will need to adjust your path to where your script is located. This above script runs the script automatically everyday at 9am.


SCRIPT 2 (Backup and Recovery Script):
Description:
The backup.sh script takes two variables. The first variable will be the target (the path of the directory we would like to backup) the second variable will be the backup (the path of where we would place the backup). The script will take the first variable and use that to locate the directory that needs to be backedup. It will then create a tar.gz file and move it to the path of the second variable and put the file there. If the backup directory was not made, it would be made when the script is run automatically. The script will also delete all backups that were made more than 3 days ago.

How to run each script:
To run the script, we will have to be in the directory the script is in, use the command sudo bash backup.sh {path of directory you would like to take a backup} {path of where you would like the backup to be}. After hitting enter, you are done. To double check we would then go into the directory of the backup and see that the file is there.

Sample outputs (copy-paste from terminal)

kamyiusa@kamyiusa:"/proj1$ sudo bash backup.sh /var/log/ /home/kamyiusa/proj1/backup tar: Removing leading ` from member names
kamyiusa@kamyiusa: "/proj1$ ls backup backup.sh
kamyiusa@kamyiusa:"/proj1$ cd backup kamyiusa@kamyiusa:"/proj1/backup$ ls
logs-20260413.tar.gz logs-20260414.tar.gz
kamyiusa@kamyiusa:"/proj1/backup$

kamyiusa@kamyiusa:~/proj1$ sudo bash backup.sh /home/kamyiusa/proj1 /home/kamyiusa/proj1/backup1 tar: Removing leading '/' from member names
kamyiusa@kamyiusa:"/proj1$ ls
backup backup1 backup.sh
kamyiusa@kamyiusa:~/proj1$ cd backup1
kamyiusa@kamyiusa:"/proj1/backup1$ ls

kamyiusa@kamyiusa:"/proj1/backup1$ cd
kamyiusa@kamyiusa: "/proj1$ sudo bash backup.sh /home/kamyiusa/hw1 /home/kamyiusa/proj1/backuphw1 tar: Removing leading from member names kamyiusa@kamyiusa:"/proj1$ cd backuphw1/ kamyiusa@kamyiusa:"/proj1/backuphw1$ ls
logs-20260414.tar.gz
kamyiusa@kamyiusa:"/proj1/backuphw1$ cd ..
kamyiusa@kamyiusa:~/proj1$ sudo bash backup.sh /home/kamyiusa/hw2 /home/kamyiusa/proj1/backuphw2 tar: Removing leading `/' from member names kamyiusa@kamyiusa:"/proj1$ cd backuphw2/
kamyiusa@kamyiusa:"/proj1/backuphu2$ ls
logs-20260414.tar.gz
kamyiusa@kamyiusa:"/proj1/backuphw2$


SCRIPT 3 (Log Monitoring and Script Health):

monitor.sh

This script monitors system logs and system health on an Ubuntu Server system. It checks the system log file (/var/log/syslog) and searches for the keywords "failed" and "error" using the grep command. The matching log entries are written into a report file named monitor_report.txt.

The script also checks disk usage using the df command. If the disk usage is above 20%, it generates a warning message. Otherwise, it reports that disk usage is normal.

In addition, the script checks CPU usage using the top command. If CPU usage is above 70%, it generates a warning message. Otherwise, it reports that CPU usage is normal.

All results, including log entries, disk usage status, and CPU usage status, are saved into the report file.



How to Run the Script:


1. Open UTM and navigate to the directory that has the script.

2. Make the script executable:
   chmod 744 monitor.sh

3. Run the script:
   ./monitor.sh

4. View the output:
   cat monitor_report.txt


Dependencies:

This script uses standard Linux commands:
- grep
- df
- awk
- sed
- top

No additional installations are required on Ubuntu Server.

Sample Output:


System Monitoring Report
Date: Mon Apr 14 ...

Log Errors and Failed Attempts:
... (log entries) ...

Disk Usage Check:
Disk usage is normal (16%)

CPU Usage Check:
CPU usage is normal (5%)

End of report

