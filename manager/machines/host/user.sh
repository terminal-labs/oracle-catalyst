export APPNAME=${1}
export SUDOUSERNAME=${2}
export CONFIGURATION=${3}
export TYPE=${4}
export PYTHONVERSION=${5}
export HOSTTYPE=${6}
export INTERNALUSER=${7}
export PLATFORM=${8}
export PLUGIN=${9}
export EXTRA=${10}

source .tmp/bem/library/lib.sh

mkdir -p /home/$SUDOUSERNAME/$PLATFORM/bem/$APPNAME
mkdir -p /home/$SUDOUSERNAME/$PLATFORM/bem/$APPNAME/vars
chown -R $SUDOUSERNAME $FILE /home/$SUDOUSERNAME/$PLATFORM

su -m $SUDOUSERNAME <<'EOF'
 bash .tmp/bem/helpers/setup_tmp.sh
EOF

bash .tmp/bem/helpers/setup_vars_common.sh $APPNAME $SUDOUSERNAME $CONFIGURATION $TYPE $PYTHONVERSION $HOSTTYPE $INTERNALUSER $PLATFORM $PLUGIN $EXTRA
bash .tmp/bem/helpers/setup_vars_external.sh $APPNAME $SUDOUSERNAME $CONFIGURATION $TYPE $PYTHONVERSION $HOSTTYPE $INTERNALUSER $PLATFORM $PLUGIN $EXTRA
bash .tmp/bem/helpers/setup_vars_internal.sh $APPNAME vagrant $CONFIGURATION $TYPE $PYTHONVERSION $HOSTTYPE vagrant $PLATFORM $PLUGIN $EXTRA
