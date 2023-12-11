export INSTALLUSER=$1
source .tmp/_commonenv.sh

echo "emitting"

bash .tmp/patterns/$PLUGIN/user/emitters/emit_activate.sh $INSTALLUSER
