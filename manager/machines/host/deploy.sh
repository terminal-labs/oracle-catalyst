export INSTALLUSER=$1
source .tmp/_commonenv.sh

FILE=/home/$INSTALLUSER/.tlcache/bem/$APPNAME/vars/hostaptdeps
if [ ! -f "$FILE" ]; then
    bash .tmp/bem/common/hosts/standard/pre_deploy_deps.sh
    touch $FILE
    chown $INSTALLUSER $FILE
fi

sudo bash .tmp/patterns/$PLUGIN/superuser/setup.sh $INSTALLUSER
