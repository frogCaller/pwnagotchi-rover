#!/bin/bash

# check for wireless access points and their macs

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if lolcat is available
if command_exists lolcat; then
  sudo iwlist scan | awk '/Cell/ {mac=$5} /ESSID/ {gsub(/"/, "", $0); split($0, arr, ":"); essid=arr[2]; print mac, essid}' | awk 'NF==2' | sort | uniq | lolcat
else
  sudo iwlist scan | awk '/Cell/ {mac=$5} /ESSID/ {gsub(/"/, "", $0); split($0, arr, ":"); essid=arr[2]; print mac, essid}' | awk 'NF==2' | sort | uniq
fi
