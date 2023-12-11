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

if [[ $HOSTTYPE == "host" ]]; then
  bash .tmp/bem/common/hosts/standard/deploy.sh $SUDOUSERNAME
fi

if [[ $HOSTTYPE == "vagrant" ]]; then
  bash .tmp/bem/common/hosts/vagrant/deploy.sh $SUDOUSERNAME
  bash .tmp/bem/common/hosts/vagrant/post_deploy_run.sh $SUDOUSERNAME
fi
