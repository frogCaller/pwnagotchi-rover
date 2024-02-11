#!/bin/bash
# This script executes hashcat, using all text files within the specified "Lists" directory 
# as potential password lists for the cracking attempt.

current_user=$(whoami)
check_lists="hashcat -m 22000 -w3 --status candidates.hc22000 /home/$current_user/Lists/*.txt"
check_cracks="hashcat -m 22000 candidates.hc22000 --show"

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if cowsay and lolcat are available
if command_exists lolcat; then
  echo "Checking with existing lists" | lolcat
elif command_exists cowsay; then
  echo "Checking with existing lists" | cowsay
else
  echo "Checking with existing lists"
fi

$check_lists
wait $!

# Check if cowsay and lolcat are available
if command_exists lolcat; then
  echo "I'm done checking" | lolcat
elif command_exists cowsay; then
  echo "I'm done checking" | cowsay
else
  echo "I'm done checking"
fi

$check_cracks
wait $!