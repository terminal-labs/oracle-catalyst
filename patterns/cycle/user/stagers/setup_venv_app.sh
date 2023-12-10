export INSTALLUSER=$1
source .tmp/_commonenv.sh

source /home/$INSTALLUSER/.tlcache/bem/$APPNAME/venv/bin/activate
export XDG_CONFIG_HOME="$HOME/.config"
poetry install
