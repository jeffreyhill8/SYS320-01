#!/bin/bash

echo "To: jeffrey.hill@mymail.champlain.edu" > emailform.txt
echo "Subject: Security Incident" >> emailform.txt
echo "Test" >> emailform.txt
cat emailform.txt | ssmtp jeffrey.hill@mymail.champlain.edu
