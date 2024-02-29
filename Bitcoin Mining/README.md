# BitCoin Solo Mining

While your rover is waiting for new handshakes, let's mine bitcoin in the mean time!

## **Installations**

**Mining on Raspberry pi 4:**
   ```
   sudo apt-get install git automake autoconf libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev
   sudo git clone https://github.com/tpruvot/cpuminer-multi.git
   cd cpuminer-multi
   sudo ./autogen.sh
   sudo ./configure --disable-assembly CFLAGS="-Ofast -march=native" --with-crypto --with-curl
   sudo ./build.sh
   ```
   To mine, run:
   ```
   ./cpuminer -a sha256d -o stratum+tcp://solo.ckpool.org:3333 -u [YOUR BITCOIN WALLET] -p [PASSWORD]
   ```
<br />
<br />

**Mining on Ubuntu:**<br />
   ```
   sudo apt-get install git automake autoconf libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev
   sudo git clone https://github.com/tpruvot/cpuminer-multi.git
   cd cpuminer-multi
   sudo ./autogen.sh
   sudo ./configure
   sudo ./build.sh
   ```
   To mine, run:
   ```
   ./cpuminer -a sha256d -o stratum+tcp://solo.ckpool.org:3333 -u [YOUR BITCOIN WALLET] -p [PASSWORD]
   ```
    
   _[Source](https://github.com/tpruvot/cpuminer-multi?tab=readme-ov-file)_<br />
    <br />