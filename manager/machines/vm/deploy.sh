export INSTALLUSER=$1
source .tmp/_commonenv.sh

FILE=/home/$INSTALLUSER/$PLATFORM/bem/$APPNAME/vars/hostaptdeps
if [ ! -f "$FILE" ]; then
    bash .tmp/bem/common/hosts/vagrant/pre_deploy_deps.sh
    touch $FILE
    chown $INSTALLUSER $FILE
fi

sudo su $INSTALLUSER <<'EOF'
 source .tmp/_commonenv.sh
 vagrant up
 vagrant ssh --command "cd /vagrant; sudo bash .tmp/patterns/$PLUGIN/superuser/setup.sh vagrant"
EOF
