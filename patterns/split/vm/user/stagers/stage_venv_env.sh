export INSTALLUSER=$1
source .tmp/_commonenv.sh

source /home/$INSTALLUSER/.tlcache/bem/$APPNAME/venv/bin/activate

pip install --upgrade pip
pip install --upgrade setuptools

pip install poetry
pip install pyyaml
pip install poetry2setup
