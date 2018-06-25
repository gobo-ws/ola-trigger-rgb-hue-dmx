#!/bin/bash

# rgbhue.sh - OLA Trigger config to control Philips Hue color lights - WIP
# https://github.com/gobo-ws/ola-trigger-rgb-hue-dmx

if [ "$4" = "0" ] && [ "$5" = "brightness" ]
then
dmx=$( curl -s http://"$1"/get_dmx?u="$2" )
transitionTime=$( echo ${dmx} | jq -r '"\(.dmx[5])"' )
curl -s 'http://'$3'/rgbhue?brightness='$6'&&transitionTime='$transitionTime'' > /dev/null
elif [ "$4" -gt "0" ] && [ "$5" = "brightness" ]
then
dmx=$( curl -s http://"$1"/get_dmx?u="$2" )
chantranstime=$(($4+5))
transitionTime=$( echo ${dmx} | jq -r '"\(.dmx['$chantranstime'])"' )
curl -s 'http://'$3'/rgbhue?brightness='$6'&&transitionTime='$transitionTime'' > /dev/null
fi
if [ "$4" = "0" ] && [ "$5" = "rgb" ]
then
dmx=$( curl -s http://"$1"/get_dmx?u="$2" )
rgb=$( echo ${dmx} | jq -r '"\(.dmx[1]),\(.dmx[2]),\(.dmx[3])"' )
transitionTime=$( echo ${dmx} | jq -r '"\(.dmx[5])"' )
curl -s 'http://'$3'/rgbhue-rgb?rgb='$rgb'&&transitionTime='$transitionTime'' > /dev/null
elif [ "$4" -gt "0" ] && [ "$5" = "rgb" ]
then
dmx=$( curl -s http://"$1"/get_dmx?u="$2" )
chanred=$(($4+1))
changreen=$((chanred+1))
chanblue=$((changreen+1))
chantranstime=$(($4+5))
rgb=$( echo ${dmx} | jq -r '"\(.dmx['$chanred']),\(.dmx['$changreen']),\(.dmx['$chanblue'])"' )
transitionTime=$( echo ${dmx} | jq -r '"\(.dmx['$chantranstime'])"' )
curl -s 'http://'$3'/rgbhue-rgb?rgb='$rgb'&&transitionTime='$transitionTime'' > /dev/null
fi
if [ "$4" = "0" ] && [ "$5" = "colorTemp" ]
then
dmx=$( curl -s http://"$1"/get_dmx?u="$2" )
transitionTime=$( echo ${dmx} | jq -r '"\(.dmx[5])"' )
curl -s 'http://'$3'/rgbhue-ct?colorTemp='$6'&&transitionTime='$transitionTime'' > /dev/null
elif [ "$4" -gt "0" ] && [ "$5" = "colorTemp" ]
then
dmx=$( curl -s http://"$1"/get_dmx?u="$2" )
chantranstime=$(($4+5))
transitionTime=$( echo ${dmx} | jq -r '"\(.dmx['$chantranstime'])"' )
curl -s 'http://'$3'/rgbhue-ct?colorTemp='$6'&&transitionTime='$transitionTime'' > /dev/null
fi
