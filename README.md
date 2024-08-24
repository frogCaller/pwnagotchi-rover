# Pwnagotchi Rover
<img src="images/pwnagotchi-Rover.jpg" alt="tinySetup1" width="600">

Transform your pwnagotchi sidekick into a cyber deck rover! This project is all about DIY fun, where we're shaking up the Pwnagotchi game by throwing it together with a cyber deck on wheels. Let's even incorporate ChatGPT into the mix, turning your rover into an intelligent conversational companion.

> Remember to use your Pwnagotchi responsibly and in compliance with ethical standards and legal regulations. Happy hacking!
# Bill of Materials
_Amazon links:_

* [Raspberry Pi Zero WH](https://amzn.to/3OFOclE)<br />
* [Raspberry Pi 3](https://amzn.to/3w8aENS)<br />
* [Raspberry Pi 4](https://amzn.to/3SVmTpX) / [5](https://amzn.to/3PGuwie) <br />
* (x3) [Micro SD Cards](https://amzn.to/4erXgWD)<br />
* [18650 UPS HAT](https://amzn.to/3SGiTsf) for Raspberry Pi<br />
* (x2) [18650 batteries](https://amzn.to/49cHxru)<br />
* (x2) [2.13-inch e-ink Waveshare 4 display](https://amzn.to/3HTGT6h)<br />
* [3.5-inch display panel](https://amzn.to/3HTGsJb)<br />
* (x2) [90-degree GPIO extenders & splitter](https://amzn.to/3HY29I4)<br />
* [CPU heatsink](https://amzn.to/3OGf84X)<br />
* Male to male [USB type C](https://amzn.to/49d8LxY)<br />
* Male to male [HDMI adapter](https://amzn.to/3w3WgGr)<br />
* 90-degree [USB to Micro USB cable](https://amzn.to/497Q5Qi)<br />
* [Raspberry pi Camera](https://amzn.to/3SZYWhy)<br />
* [HDMI adapter](https://amzn.to/48hhJcv) for raspberry pi camera<br />
* [USB GPS dongle](https://amzn.to/49f3je8) (optional)<br />
* [USB Wi-Fi adapter1](https://amzn.to/3wbFS6J), [USB Wi-Fi adapter2](https://amzn.to/3SuMKDS) (optional)<br />
* [Stand-off brackets](https://amzn.to/3uoEe1k)<br />
* [Wheels](https://amzn.to/49dWMAl)<br />

# **[Watch the Build](https://www.reddit.com/user/froggyCaller/comments/1cqrfid/pwnagotchi_cyber_deck/)**

## **Installations**

1. **OS install:**
   - Raspberry Pi Zero WH - [Pwnagotchi](https://pwnagotchi.ai/installation/) <br />
   - Raspberry Pi 3 - [Pwnagotchi](https://pwnagotchi.ai/installation/) <br />
   - Raspberry Pi 4 / 5 - Your preferred OS. <br />
     (We went with Pi OS Lite 64-bit)

2. **Install hashcat on Raspberry Pi 4:**
   ```
   sudo apt update && sudo apt upgrade -y
   sudo apt install hashcat -y
   sudo apt install hcxtools -y
   ```
   Benchmark:
   ```
   hashcat -m 22000 --benchmark
   ```
    Hashcat Cracking:<br />
    _[More info](https://dev.to/yegct/hashcat-cracking-pwnagotchi-pcap-files-4fh2)_

3. Install 3.5-inch display Driver (on Raspberry Pi 4) 
    ```
    sudo rm -rf LCD-show
    git clone https://github.com/goodtft/LCD-show.git
    chmod -R 755 LCD-show
    cd LCD-show/
    sudo ./LCD35-show
    ```

    (if you want to revert back to HDMI)
    ```
    cd LCD-show/
    sudo ./LCD-hdmi
    ```
    _[More info](https://github.com/lcdwiki/LCD-show-retropie)_

4. Install [USB Wi-Fi adapter1](https://amzn.to/49ng59U) Driver (any or both Raspberry Pis)
   ```
   sudo apt update
   sudo apt install raspberrypi-kernel-headers
   git clone https://github.com/aircrack-ng/rtl8812au.git
   cd rtl8812au
   sudo make
   sudo make install
   ```
   _[More info](https://docs.alfa.com.tw/Support/Linux/RTL8811AU/)_

5. Install Camera Driver (if not using Raspberry Pi Camera):<br />
   _[Camera Drivers](https://docs.arducam.com/Raspberry-Pi-Camera/Native-camera/Quick-Start-Guide/)_

   - Use these commands to use camera:
   ```
   libcamera-still -o picture.jpg          # Take a picture
   libcamera-vid -t 10000 -o video.H264    # Take 10 sec video
   libcamera-vid -t 0 --inline --listen -o tcp://0.0.0.0:8080    # Stream
   ```
   
    <br />
<br />
Note: The provided links are amazon affiliate links, and if you make a purchase through them, I may earn a small commission at no additional cost to you.<br />

