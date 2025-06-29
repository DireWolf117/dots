#!/bin/bash

HOUR=$(date +%H)
HOUR=${HOUR#0} # Remove leading zero if present

if [ "$HOUR" -ge 8 ] && [ "$HOUR" -lt 18 ]; then
  # Sun Rising (5am-9am)
  printf "󰖨"
else
  # Night (8pm-4am)
  printf "󰽥"
fi
