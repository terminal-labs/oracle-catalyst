export INSTALLUSER=$1
source .tmp/_commonenv.sh

/usr/bin/python3.11 -m venv /home/$INSTALLUSER/.tlcache/bem/$APPNAME/venv
