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
