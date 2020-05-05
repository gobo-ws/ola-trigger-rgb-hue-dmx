![DMX-Hue](https://raw.githubusercontent.com/gobo-ws/ola-trigger-hue-dmx/master/dmxhue.png)

**OLA trigger config to control Philips Hue color lights with DMX (Art-Net, sACN or via DMX input)**

This is not the most elegant solution but it works though and the color conversion from RGB to CIE1931 is not perfect.  

Please note that the Hue bridge has some frame rate limits.  
SyntheFX has a good [article](https://support.synthe-fx.com/hc/en-us/articles/360034583252-Philips-Hue-Response-Times-vs-DMX) regarding Philips Hue response times vs. DMX.

This config also works with the [deCONZ API](https://dresden-elektronik.github.io/deconz-rest-doc/) from Dresden Elektronik (does not support HTTPS at the moment though)

**Requirements**

* [OLA](https://www.openlighting.org/ola/)
* [Node-RED](https://nodered.org/)
* [HueMagic for Node-RED](https://github.com/Foddy/node-red-contrib-huemagic)
* [curl](https://curl.haxx.se/)
* [jq](https://stedolan.github.io/jq/)
* [Philips Hue bridge](https://www2.meethue.com) alternatively a gateway from [Dresden Elektronik](https://www.dresden-elektronik.de/funktechnik/solutions/wireless-light-control/gateways/?L=1)

**Installation**
  
* Download the [rgbhue.conf](rgbhue.conf) and edit the configuration section
* Download the [rgbhue.sh](rgbhue.sh) shell script, place it in the same directory and make it executable with chmod +x
* Download the [rgbhue_flow.json](rgbhue_flow.json) file, import it into Node-RED and edit the Hue bridge settings

[OLA trigger documentation](https://www.openlighting.org/ola/advanced-topics/ola-dmx-trigger/)

**Usage** 

* Before running ola_trigger, make sure that olad is running and the universe has been configured with a DMX512 source.  
The config file is provided on the command line:

`ola_trigger rgbhue.conf`

**DMX protocol** 

* Channel 1 Dimmer. Value 0-255 (0%-100%)
* Channel 2 Red intensity. Value 0-255
* Channel 3 Green intensity. Value 0-255
* Channel 4 Blue intensity. Value 0-255
* Channel 5 Color temperature. Value 0-255 (6500K - 2000K)
* Channel 6 Transition time. Value 0-255 (seconds)
