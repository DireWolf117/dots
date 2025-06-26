#!/bin/bash

HOUR=$(date +%H)
HOUR=${HOUR#0} # Remove leading zero if present

if [ "$HOUR" -ge 5 ] && [ "$HOUR" -lt 10 ]; then
    # Early morning/sunrise (5am-8am)
    printf "󰖜"
elif [ "$HOUR" -ge 10 ] && [ "$HOUR" -lt 17 ]; then
    # Daytime (8am-5pm)
    printf "󰖙"   
elif [ "$HOUR" -ge 17 ] && [ "$HOUR" -lt 20 ]; then
    # Evening/sunset (5pm-8pm)
    printf "󰖠"
else
    # Night (8pm-5am)
    printf "󰽥"
fi
