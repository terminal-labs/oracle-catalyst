export DEBIAN_FRONTEND=noninteractive
apt-get update && 
    apt-get -o Dpkg::Options::="--force-confold" upgrade -q -y --force-yes &&
    apt-get -o Dpkg::Options::="--force-confold" dist-upgrade -q -y --force-yes

DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" update
DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade

apt -y install \
  build-essential \
  make \
  libpq-dev \
  libcurl4  \
  libcurl4-openssl-dev  \
  libssl-dev  \
  libxml2 \
  libxml2-dev  \
  pkg-config \

cd .tmp
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb
rm libssl1.1_1.1.1f-1ubuntu2_amd64.deb
cd ..

add-apt-repository ppa:deadsnakes/ppa -y
apt-get update -y
apt-get install python3.11 -y
apt-get install python3.11-dev -y
apt-get install python3.11-venv -y
apt-get install python3.11-distutils -y
apt-get install python3.11-lib2to3 -y
apt-get install python3.11-gdbm -y
apt-get install python3.11-tk -y
