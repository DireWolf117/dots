#!/bin/bash
if [ -z "$1" ]; then
  echo "Application name is missing"
  exit 1
fi
gtk-launch "$1"