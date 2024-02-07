# Pwnagotchi Rover
![](images/pwnagotchiRover.jpeg)

Hack with style and transform your pwnagotchi sidekick into a cyber deck rover! This project is all about DIY fun, where we're shaking up the Pwnagotchi game by throwing it together with a cyber deck on wheels.<br />
Also remember to use your Pwnagotchi responsibly and in compliance with ethical standards and legal regulations. Happy hacking!

# Bill of Materials
(x1) [Raspberry Pi Zero WH](https://amzn.to/49mZVxC)<br />
(x1) [Raspberry Pi 3](https://amzn.to/3Ov69Dm)<br />
(x1) [Raspberry Pi 4](https://amzn.to/3w3UDZz)<br />
(x3) [Micro SD Cards](https://amzn.to/48bSKY8)<br />
(x1) [18650 UPS HAT](https://amzn.to/3ukopbM) for Raspberry Pi<br />
(x2) [18650 batteries](https://amzn.to/49F1pn5)<br />
(x2) [2.13-inch e-ink Waveshare 4 display](https://amzn.to/49od8X0)<br />
(x1) [3.5-inch display panel](https://amzn.to/3OwjCuV)<br />
(x2) [90-degree GPIO extenders & splitter](https://amzn.to/3Uooea9)<br />
(x1) [CPU heatsink](https://amzn.to/3HN08OL)<br />
(x1) Male to male [USB type C](https://amzn.to/49kzHvE)<br />
(x1) Male to male [HDMI adapter](https://amzn.to/3w3WgGr)<br />
(x1) 90-degree [USB to Micro USB cable](https://amzn.to/3w1uWsl)<br />
(x1) [Raspberry pi Camera](https://amzn.to/4bp14WX)<br />
(x1) [HDMI adpter](https://amzn.to/491uXLt) for raspberry pi camera<br />
(x1) [USB GPS dongle](https://amzn.to/49jqJi4) (optional)<br />
[USB Wi-Fi adapter1](https://amzn.to/49ng59U), [USB Wi-Fi adapter2](https://amzn.to/3ukoT1A) (optional)<br />
[Stand-off brackets](https://amzn.to/3St6NSX)<br />
[Wheels](https://amzn.to/4bjuCWh)<br />

# **[Watch the Build](https://www.reddit.com/u/froggyCaller/s/UnxLtAQCF8)**

## **Installations**

1. **OS install:**
   - Raspberry Pi Zero WH - [Pwnagotchi](https://pwnagotchi.ai/installation/) <br />
   - Raspberry Pi 3 - [Pwnagotchi](https://pwnagotchi.ai/installation/) <br />
   - Raspberry Pi 4 - Your preferred OS. <br />
     (We went with Pi OS Lite 64-bit)

2. **Install hashcat on Raspberry Pi 4:**
   ```
   sudo apt update && sudo apt upgrade -y
   sudo apt install hashcat -y
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
    chmod -R 755 LCD-show
    cd LCD-show/
    sudo ./LCD-hdmi
    ```
    _[Source](https://www.instructables.com/Raspberry-Pi-4B3B-35-Inch-LCD-Touch-DisplayScreen/)_

4. Install [USB Wi-Fi adapter1](https://amzn.to/49ng59U) Driver (on any/both Raspberry Pis)
   ```
   sudo apt update
   sudo apt install raspberrypi-kernel-headers
   git clone https://github.com/aircrack-ng/rtl8812au.git
   cd rtl8812au
   sudo make
   sudo make install
   ```
   _[Source](https://docs.alfa.com.tw/Support/Linux/RTL8811AU/)_

5. Install Camera Driver (if not using Raspberry Pi Camera)<br />
   _[Camera Drivers](https://docs.arducam.com/Raspberry-Pi-Camera/Native-camera/Quick-Start-Guide/)_
   ```
   libcamera-still -o picture.jpg          # Take a picture
   libcamera-vid -t 10000 -o video.H264    # Take 10 sec video
   libcamera-vid -t 0 --inline --listen -o tcp://0.0.0.0:8080    # Stream
   ```
 <br />
Note: The provided links are affiliate links, and if you make a purchase through them, I may earn a small commission at no additional cost to you. Your support will help create projects like this. Thank you for your support!<br />

## Support the project
If you would like to support this project and and keep me caffeinated, you can do it here:<br />

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/yellow_img.png)](https://www.buymeacoffee.com/tonysacco)
