#!/bin/bash

echo "<html>" > report.html
echo "<body>" >> report.html
echo "<h3>Access logs with IOC indicators:</h3>" >> report.html
echo "<table border='1'>" >> report.html

while read -r line; do
	ip=$(echo "$line" | awk '{print $1}')
	dt=$(echo "$line" | awk '{print $2}')
	page=$(echo "$line" | awk '{print$3}')
	echo "<tr><td>$ip</td><td>$dt</td><td>$page</td></tr>" >> report.html
done < report.txt

echo "</table>" >> report.html
echo "</body>" >> report.html
echo "</html>" >> report.html

sudo mv report.html /var/www/html/report.html
