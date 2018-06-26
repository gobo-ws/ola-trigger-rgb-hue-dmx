#!/bin/bash

# rgbhue.sh - OLA Trigger config to control Philips Hue color lights
# https://github.com/gobo-ws/ola-trigger-rgb-hue-dmx

if [ "$5" = "brightness" ]
then
dmx=$( curl -s http://"$1"/get_dmx?u="$2" )
curl -s 'http://'$3'/rgbhue?brightness='$6'&&transitionTime='$7'' > /dev/null
fi
if [ "$4" = "0" ] && [ "$5" = "rgb" ]
then
dmx=$( curl -s http://"$1"/get_dmx?u="$2" )
rgb=$( echo ${dmx} | jq -r '"\(.dmx[1]),\(.dmx[2]),\(.dmx[3])"' )
curl -s 'http://'$3'/rgbhue-rgb?rgb='$rgb'&&transitionTime='$7'' > /dev/null
elif [ "$4" -gt "0" ] && [ "$5" = "rgb" ]
then
dmx=$( curl -s http://"$1"/get_dmx?u="$2" )
chanred=$(($4+1))
changreen=$((chanred+1))
chanblue=$((changreen+1))
rgb=$( echo ${dmx} | jq -r '"\(.dmx['$chanred']),\(.dmx['$changreen']),\(.dmx['$chanblue'])"' )
curl -s 'http://'$3'/rgbhue-rgb?rgb='$rgb'&&transitionTime='$7'' > /dev/null
fi
if [ "$5" = "colorTemp" ]
then
dmx=$( curl -s http://"$1"/get_dmx?u="$2" )
curl -s 'http://'$3'/rgbhue-ct?colorTemp='$6'&&transitionTime='$7'' > /dev/null
fi
