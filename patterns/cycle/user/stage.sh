export INSTALLUSER=$1
source .tmp/_commonenv.sh

echo "staging"

FILE=/home/$INSTALLUSER/.tlcache/bem/$APPNAME/vars/patterstagers
if [ ! -f "$FILE" ]; then
	bash .tmp/patterns/$PLUGIN/user/stagers/setup_venv.sh $INSTALLUSER
	bash .tmp/patterns/$PLUGIN/user/stagers/setup_venv_env.sh $INSTALLUSER
	bash .tmp/patterns/$PLUGIN/user/stagers/setup_venv_app.sh $INSTALLUSER
    touch $FILE
    chown $INSTALLUSER $FILE
fi
