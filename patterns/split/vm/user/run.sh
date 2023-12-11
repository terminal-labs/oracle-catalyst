export INSTALLUSER=$1
source .tmp/_commonenv.sh

bash .tmp/patterns/$PLUGIN/user/runners/run_build.sh $INSTALLUSER
