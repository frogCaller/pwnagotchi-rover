# Crypto Solo Mining

![](../images/cryptoMine.png)

- ___While your rover is waiting for new handshakes, let's mine some coins in the mean time!___

## **Installations**

**Mining crypto on Raspberry pi 4/5:**
   ```
   sudo apt-get update -y
   sudo apt-get install git automake autoconf libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev -y
   sudo git clone https://github.com/tpruvot/cpuminer-multi.git
   cd cpuminer-multi
   sudo ./autogen.sh
   sudo ./configure
   sudo ./build.sh
   ```
   Mine Bitcoin:
   ```
   ./cpuminer -a sha256d -o stratum+tcp://solo.ckpool.org:3333 -u [BITCOIN_WALLET_ADDRESS] -p [CREATE_PASSWORD]
   ```
   Mine Litecoin & Dogecoin:
   ```
   ./cpuminer -a scrypt -o stratum+tcp://us.litesolo.org:3333 -u [LITECOIN_WALLET_ADDRESS].[MINER_NAME] -p DOGE=[DOGECOIN_WALLET_ADDRESS]
   ```
<br />

**Create a script:**
```
nano mineBit.sh
```

```
#!/bin/sh

cd cpuminer-multi
./cpuminer -a sha256d -o stratum+tcp://solo.ckpool.org:3333 -u [BITCOIN_WALLET_ADDRESS] -p [CREATE_PASSWORD]
```

_[More Info](https://github.com/tpruvot/cpuminer-multi?tab=readme-ov-file)_
<br />
<br />
> Trying out Bitcoin mining with a Raspberry Pi is more for learning than earning. The high computational demands and the competitive nature of the Bitcoin network mean that solo mining on these devices is highly inefficient and unlikely to yield significant rewards. It's akin to holding a lottery ticket in the vast world of Bitcoin – a thrilling experience, even if the chances of hitting the jackpot are slim.
