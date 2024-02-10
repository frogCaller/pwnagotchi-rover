# Fun Additions
![](../images/GroupPhoto.jpeg)

Level up your Raspberry Pi experience with a dose of fun and advanced capabilities!
## **Installations**

1. **Install some typical fun command:**
    ```
   sudo apt install fortune lolcat cmatrix hollywood cowsay -y
   ```

2. **Install chatGPT on your Raspberry Pi:**<br />
   
   Clone the repository:
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
