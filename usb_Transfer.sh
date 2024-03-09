#!/bin/bash

# MAKE SURE RASPBERRY PI 4 HAS HCXTOOLS AND SSHPASS INSTALLED
# CONNECT YOUR PWNAGOTCHI TO YOUR RASPBERRY PI 4 via USB

## add this file to your pi 4 first before running the script

#sudo nano /etc/network/interfaces.d/usb0

#auto usb0
#iface usb0 inet static
#    address 10.0.0.3
#    netmask 255.255.255.0
#    gateway 10.0.0.1


# this script will connect to the pwnagotchi via USB and 
# copy the handshakes file in your pwnagotchi into Pi 4 (from /home/$username/handshakes)
# make sure your pwnagotchi handshakes folder is located in /home/$username

username=$(whoami)

function connectToServer() {
    # Check if connected to 10.0.0.2
    if ! ping -c 1 -w 2 10.0.0.2 &> /dev/null; then
        sudo route add -net 10.0.0.0 netmask 255.255.255.0 dev usb0
        wait $!
        sudo systemctl restart networking
        wait $!
        sudo ethtool usb0
        wait $!
        ifconfig usb0
    else
        return 0
    fi
}

# for multiple pwnagotchis
function removeKnownHosts() {
    local knownHostsFile="/home/$username/.ssh/known_hosts"
    if [ -e "$knownHostsFile" ]; then
        echo "Removing $knownHostsFile..."
        rm "$knownHostsFile"
    fi
}

function promptForPassword() {
    read -s -p "Enter pwnagotchi password: " password
    echo
}

function transferFiles() {
    promptForPassword
    removeKnownHosts
    cd /home/$username
    wait $!
    # Run the scp command after successfully connecting to 10.0.0.1
    sshpass -p $password scp -o StrictHostKeyChecking=no -r $username@10.0.0.2:/home/$username/handshakes .
    wait $!
    return $?
}

function runFinalCommands() {
    cd /home/$username/handshakes
    hcxpcapngtool *.pcap -o candidates.hc22000 -E essid.wordlist

}

# Main script
if connectToServer; then
    if transferFiles; then
        runFinalCommands
    else
        echo "Files not transferred."
    fi
fi
