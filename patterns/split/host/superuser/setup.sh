export INSTALLUSER=$1
source .tmp/_commonenv.sh

mkdir -p /home/$INSTALLUSER/.tlcache/bem/$APPNAME
mkdir -p /home/$INSTALLUSER/.tlcache/bem/$APPNAME/vars
chown -R $INSTALLUSER $FILE /home/$INSTALLUSER/.tlcache


echo "venv deps"

sudo su $INSTALLUSER <<'EOF'
  source .tmp/_commonenv.sh
  me="$(whoami)"
  bash .tmp/patterns/$PLUGIN/user/stage.sh $me
  bash .tmp/patterns/$PLUGIN/user/emit.sh $me
EOF
