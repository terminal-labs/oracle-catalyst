apt update
apt install build-essential -y
apt install linux-headers-$(uname -r) -y
apt install make -y
apt install unzip -y
wget https://github.com/terminal-labs/hologram/archive/refs/heads/main.zip
unzip main.zip
chmod -R 7777 hologram-main
cd hologram/demo
make psf
