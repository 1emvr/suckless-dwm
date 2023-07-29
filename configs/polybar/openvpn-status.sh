#!/usr/bin/env bash
# ~/.config/polybar/openvpn-status.sh

pgrep openvpn 1>/dev/null
if [ $? -eq 0 ]; then
  printf " " && (ip -c a | grep tun0 | tr -d '\n' | awk -F" " '{ print $15 }' | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g')
else
  printf "\n" 
fi
