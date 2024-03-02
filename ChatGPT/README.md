# ChatGPT
![](../images/chatGPT.jpg)

Elevate your Rover's intelligence with ChatGPT! This guide provides a straightforward approach to installing ChatGPT on a Raspberry Pi 4, offering an innovative way to enhance your Rover with the power of advanced machine learning.

## **Installation**

**Install chatGPT on Raspberry Pi 4**<br />
Clone repository and download the model.
   ```
   git clone https://github.com/antimatter15/alpaca.cpp.git
   cd alpaca.cpp
   sudo make chat
   wget https://huggingface.co/Sosaka/Alpaca-native-4bit-ggml/resolve/main/ggml-alpaca-7b-q4.bin
   ```   
   To use, run:
   ```
   ./chat
   ```
> *For an optimal experience, I highly recommend using a standard computer running Ubuntu and following the same steps— the difference in performance will be noticeably significant compared to running it on a Raspberry Pi.*
    
_[Source](https://github.com/antimatter15/alpaca.cpp)_<br />
<br />
<br />
