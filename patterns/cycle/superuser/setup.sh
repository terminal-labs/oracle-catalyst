export INSTALLUSER=$1
source .tmp/_commonenv.sh

mkdir -p /home/$INSTALLUSER/.tlcache/bem/$APPNAME
mkdir -p /home/$INSTALLUSER/.tlcache/bem/$APPNAME/vars
chown -R $INSTALLUSER $FILE /home/$INSTALLUSER/.tlcache

FILE=/home/$INSTALLUSER/.tlcache/bem/$APPNAME/vars/patternaptdeps
if [ ! -f "$FILE" ]; then
    bash .tmp/patterns/$PLUGIN/superuser/apt.sh
    touch $FILE
    chown $INSTALLUSER $FILE
fi

sudo su $INSTALLUSER <<'EOF'
  source .tmp/_commonenv.sh
  me="$(whoami)"
  bash .tmp/patterns/$PLUGIN/user/stage.sh $me
  bash .tmp/patterns/$PLUGIN/user/emit.sh $me
EOF
