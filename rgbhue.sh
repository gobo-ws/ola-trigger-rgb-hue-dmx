#!/bin/bash

# rgbhue.sh - OLA Trigger config to control Philips Hue color lights - WIP
# https://github.com/gobo-ws/ola-trigger-rgb-hue-dmx

if [ "$4" = "0" ]
then
dmx=$( curl -s http://"$1"/get_dmx?u="$2" )
rgb=$( echo ${dmx} | jq -r '"\(.dmx[0]),\(.dmx[1]),\(.dmx[2])"' )
curl -s http://"$3"/rgb-value/${rgb} > /dev/null

elif [ "$4" -gt "0" ]
then
dmx=$( curl -s http://"$1"/get_dmx?u="$2" )
chanone="$4"
chantwo=$((chanone+1))
chanthree=$((chantwo+1))
rgb=$( echo ${dmx} | jq -r '"\(.dmx['$chanone']),\(.dmx['$chantwo']),\(.dmx['$chanthree'])"' )
curl -s http://"$3"/rgb-value/${rgb} > /dev/null
fi
