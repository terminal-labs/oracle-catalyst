DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" update
DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade


apt -y install \
  git \
  wget \
  zip \
  unzip \
  rsync \
  bash-completion \
  build-essential \
  cmake \
  make \
  libpq-dev \
  libcurl4  \
  libcurl4-openssl-dev  \
  libssl-dev  \
  libxml2 \
  libxml2-dev  \
  pkg-config \
  ca-certificates \
  xclip

cd .tmp
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb
rm libssl1.1_1.1.1f-1ubuntu2_amd64.deb
cd ..

add-apt-repository ppa:deadsnakes/ppa -y
apt-get update -y
apt-get install python3.11 -y
apt-get install python3.11-venv -y
