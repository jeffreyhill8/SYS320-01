#!/bin/bash

#Scrapes the URL to find the data we are looking for
PAGE=$(curl -s http://10.0.17.6/assignment.html)

#Prints raw html data from websitre and extracts the text from it for future use
ALL_VALS=$(echo "$PAGE" | grep -oP '(?<=<td>)[^<]+')

#Takes only the first 10 lines aka the first table and keeps only the temperature values not the Date and time values
TEMPS=$(echo "$ALL_VALS" | head -n 10 | awk 'NR%2==1')

#Same as previous but instead of taking the temperature values it now takes the date and time values
DATES=$(echo "$ALL_VALS" | head -n 10 | awk 'NR%2==0')

#Skips the first 10 lines that way we are now looking at the second table and keeps only the pressure values
PRESSURE=$(echo "$ALL_VALS" | tail -n +11 | head -n 10 | awk 'NR%2==1')

#Counts how many lines there are that way the loop will know when to stop
COUNT=$(echo "$TEMPS" | wc -l)

#Loop in order to actually make the new table using the two previous
for i in $(seq 1 $COUNT); do
	P=$(echo "$PRESSURE" | head -n $i | tail -n 1)
	T=$(echo "$TEMPS"     | head -n $i | tail -n 1)
	D=$(echo "$DATES"     | head -n $i | tail -n 1)
	echo "$P $T $D"
done

