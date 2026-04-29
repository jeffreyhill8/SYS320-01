#!/bin/bash

LOGFILE="/home/champuser/SYS320-01/week15/fileaccesslog.txt"
EMAIL="jeffrey.hill@mymail.champlain.edu"

echo "File was accessed $(date '+%a %b %d %I:%M:%S %p %Z %Y')" >> "$LOGFILE"

echo "To: $EMAIL" > /home/champuser/SYS320-01/week15/emailform.txt
echo "Subject: Access" >> /home/champuser/SYS320-01/week15/emailform.txt

awk '{print $4, $5, $6, $7, $8}' "$LOGFILE" | sed 's/:/\-/g' >> /home/champuser/SYS320-01/week15/emailform.txt
cat /home/champuser/SYS320-01/week15/emailform.txt | ssmtp jeffrey.hill@mymail.champlain.edu

