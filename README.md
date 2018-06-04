**OLA trigger config to control Philips Hue color lights with DMX (Art-Net, sACN or via DMX input) - WIP**

Work in process.
This is not the most elegant solution but it works though!  
The color conversion from RGB to CIE1931 is not perfect.  
Things left to do:  
* Merge with previous trigger script
* ~~Parse RGB channel values in one variable instead of three with jq~~
* Add Color temperature, saturation and maybe color loop effect.
* Find a solution for transition time, maybe add a dedicated DMX channel for setup.

Please note that the Hue bridge has some frame rate limits.  
SyntheFX has a good [article](http://support.synthe-fx.com/customer/portal/articles/1330326-philips-hue-response-times-vs-dmx) regarding Philips Hue response times vs. DMX.

This config also works with the [deCONZ API](https://dresden-elektronik.github.io/deconz-rest-doc/) from Dresden Elektronik (does not support HTTPS at the moment though)

**Requirements**

* [OLA](https://www.openlighting.org/ola/)
* [Node-RED](https://nodered.org/)
* [HueMagic for Node-RED](https://github.com/Foddy/node-red-contrib-huemagic)
* [curl](https://curl.haxx.se/)
* [jq](https://stedolan.github.io/jq/)
* [Philips Hue bridge](https://www2.meethue.com) alternatively a gateway from [Dresden Elektronik](https://www.dresden-elektronik.de/funktechnik/solutions/wireless-light-control/gateways/?L=1)

**Installation**
  
* Download the [rgbhue.conf](rgbhue.conf) and edit the configuration section.
* Download the [rgbhue.sh](rgbhue.sh) shell script, place it in the same directory and make it executable with chmod +x
* Download the [rgbhue_flow.json](rgbhue_flow.json) file, import it into Node-RED and edit the Hue bridge settings

[OLA trigger documentation](https://www.openlighting.org/ola/advanced-topics/ola-dmx-trigger/)

**Usage** 

* Before running ola_trigger, make sure that olad is running and the universe has been configured with a DMX512 source.  
The config file is provided on the command line:

`ola_trigger rgbhue.conf`
