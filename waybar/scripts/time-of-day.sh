#!/bin/bash

HOUR=$(date +%H)
HOUR=${HOUR#0} # Remove leading zero if present

if [ "$HOUR" -ge 5 ] && [ "$HOUR" -lt 10 ]; then
  # Sun Rising (5am-9am)
  printf "󰖨"
elif [ "$HOUR" -ge 10 ] && [ "$HOUR" -lt 17 ]; then
  # Daytime (10am-4pm)
  printf ""
elif [ "$HOUR" -ge 17 ] && [ "$HOUR" -lt 20 ]; then
  # Sun Setting (5pm-7pm)
  printf "󰖠"
else
  # Night (8pm-4am)
  printf "󰽥"
fi
