export INSTALLUSER=$1
source .tmp/_commonenv.sh

if [ $INSTALLUSER == "vagrant" ]; then
  echo "skipping creating activate script"
else
  echo "creating activate script"
cat > activate.sh <<EOF
source /home/$INSTALLUSER/.tlcache/bem/$APPNAME/venv/bin/activate
EOF
fi
