export INSTALLUSER=$1
source .tmp/_commonenv.sh

sudo su $INSTALLUSER <<'EOF'
 source .tmp/_commonenv.sh
 bash .tmp/patterns/$PLUGIN/user/run.sh user
EOF
