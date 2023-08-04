#!/bin/sh

# A dwm_bar function to show the current network connection/SSID, private IP, and public IP using NetworkManager
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, curl

dwm_networkmanager () {
    CONNAME=$(ip a | grep 'wlan0' | tr '\n' ' ' | awk 'NR==1{print $15}')
    if [ "$CONNAME" = "" ]; then
        CONNAME=$(󰖪 )
    fi

    if [ "$IDENTIFIER" = "unicode" ]; then
	    if [ "$CONNAME" = "" ]; then
		    export __DWM_BAR_NETWORKMANAGER__="${SEP1}󰈀 ${CONNAME}${SEP2}"
	    else
		    export __DWM_BAR_NETWORKMANAGER__="${SEP1} ${CONNAME}${SEP2}"
	    fi
    else
	    export __DWM_BAR_NETWORKMANAGER__="${SEP1}NET ${CONNAME} ${PRIVATE} ${PUBLIC}${SEP2}"
    fi
}

dwm_networkmanager
