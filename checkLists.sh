#!/bin/bash

gen_candidates="sudo hcxpcapngtool /home/$USER/handshakes/*.pcap -o /home/$USER/handshakes/candidates.hc22000 -E /home/$USER/handshakes/essid.wordlist"
check_lists="hashcat -m 22000 -w3 --status /home/$USER/handshakes/candidates.hc22000 /home/$USER/Lists/*.txt"
check_cracks="hashcat -m 22000 /home/$USER/handshakes/candidates.hc22000 --show"

echo "Generating candidates"
$gen_candidates
wait $!
echo "Checking existing lists"
$check_lists
wait $!
echo "Done checking"
$check_cracks
wait $!
