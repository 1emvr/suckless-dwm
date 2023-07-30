#!/bin/sh

# A dwm_bar function to show VPN connections with OpenVPN or WireGuard (if any are active)
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, NetworkManager-openvpn (for OpenVPN connections)

dwm_vpn () {
    VPN=$(ip a | grep 'tun0' | tr '\n' ' ' | awk '{ $print 15 }'
    
    if [ "$VPN" != "" ]; then

        printf "%s" "$SEP1"
        if [ "$IDENTIFIER" = "unicode" ]; then
            printf "🔒 %s" "$VPN"
        else
            printf "VPN %s" "$VPN"
        fi
        printf "%s\n" "$SEP2"
    fi
}


dwm_vpn
