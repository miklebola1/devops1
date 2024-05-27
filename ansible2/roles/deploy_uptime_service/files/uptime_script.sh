#!/bin/bash

while true; do
    uptime=$(uptime)
    current_date=$(date +"%Y-%m-%d_%H-%M-%S")
    echo "$uptime" > /tmp/"$current_date"_uptime.txt
    sleep 60
done

