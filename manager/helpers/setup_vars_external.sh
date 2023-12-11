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

getmachine
getuserhome

if [ ! -f ".tmp/_externalenv.sh" ]; then
	emit_external_env_file

	edit_external_env_file "-bemdebug-" "true"
	edit_external_env_file "-appname-" $APPNAME
	edit_external_env_file "-platform-" $PLATFORM
	edit_external_env_file "-type-" $TYPE
	edit_external_env_file "-cmd-" $CONFIGURATION
	edit_external_env_file "-pythonversion-" $PYTHONVERSION
	edit_external_env_file "-dpename-" "dpe"
	edit_external_env_file "-wd-" $(pwd)
	edit_external_env_file "-user-" $SUDOUSERNAME
	edit_external_env_file "-home-" /home/$SUDOUSERNAME
	edit_external_env_file "-username-" $SUDOUSERNAME
	edit_external_env_file "-userhome-" /home/$SUDOUSERNAME
	edit_external_env_file "-internaluser-" $INTERNALUSER
	edit_external_env_file "-internalusername-" $INTERNALUSER
	edit_external_env_file "-internaluserhome-" /home/$INTERNALUSER
	edit_external_env_file "-machine-" $MACHINE
	edit_external_env_file "-plugin-" $PLUGIN
	edit_external_env_file "-extra-" $EXTRA

	chmod -R 777 .tmp
fi
