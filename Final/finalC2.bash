#!/bin/bash

LOGFILE=$1
IOCFILE=$2

> report.txt

while read -r ioc; do
	grep "$ioc" "$LOGFILE" | awk '{print $1, $4, $7}' | sed 's/\[//' >> report.txt
done < "$IOCFILE"

sort -u report.txt > report_sorted.txt
mv report_sorted.txt report.txt
