#!/bin/bash

curl -s http://10.0.17.6/IOC.html | grep -oP '(?<=<td>)[^<]+' | sed -n '1~2p' > IOC.txt

