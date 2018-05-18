#!/bin/bash

# rgbhue.sh - OLA Trigger config to control Philips Hue color lights - WIP
# https://github.com/gobo-ws/ola-trigger-rgb-hue-dmx

if [ "$4" = "0" ]
then
dmx=$( curl -s http://"$1"/get_dmx?u="$2" )
red=$( echo ${dmx} | jq -r '.dmx[0]' )
green=$( echo ${dmx} | jq -r '.dmx[1]' )
blue=$( echo ${dmx} | jq -r '.dmx[2]' )
curl -s http://"$3"/rgb-value/${red},${green},${blue} > /dev/null

elif [ "$4" -gt "0" ]
then
dmx=$( curl -s http://"$1"/get_dmx?u="$2" )
chanone="$4"
chantwo=$((chanone+1))
chanthree=$((chantwo+1))
red=$( echo ${dmx} | jq -r '.dmx['$chanone']' )
green=$( echo ${dmx} | jq -r '.dmx['$chantwo']' )
blue=$( echo ${dmx} | jq -r '.dmx['$chanthree']' )
curl -s http://"$3"/rgb-value/${red},${green},${blue} > /dev/null
fi
