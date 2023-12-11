mkdir -p .tmp

getmachine () {
  unameOut="$(uname -s)"
  case "${unameOut}" in
      Linux*)     machine=Linux;;
      Darwin*)    machine=Mac;;
      CYGWIN*)    machine=Cygwin;;
      MINGW*)     machine=MinGw;;
      *)          machine="UNKNOWN:${unameOut}"
  esac
  MACHINE=$machine
}

getuserhome () {
  if [[ $MACHINE == "Mac" ]]; then
    USERHOME=/Users/$USERNAME
  else
    USERHOME=/home/$USERNAME
  fi
}

emit_common_env_file () {
cat > .tmp/_commonenv.sh <<EOF
export BEM_DEBUG=-bemdebug-
export APPNAME=-appname-
export PYTHONVERSION=-pythonversion-
export PLATFORM=-platform-
export TYPE=-type-
export CMD=-cmd-
export DPENAME=-dpename-
export MACHINE=-machine-
export PLUGIN=-plugin-
export EXTRA=-extra-
EOF
}

emit_external_env_file () {
cat > .tmp/_externalenv.sh <<EOF
export BEM_DEBUG=-bemdebug-
export USER=-user-
export HOME=-home-
export USERNAME=-username-
export USERHOME=-userhome-
export INTERNALUSER=-internaluser-
export INTERNALUSERNAME=-internalusername-
export INTERNALUSERHOME=-internaluserhome-
export APPNAME=-appname-
export PYTHONVERSION=-pythonversion-
export PLATFORM=-platform-
export TYPE=-type-
export CMD=-cmd-
export DPENAME=-dpename-
export MACHINE=-machine-
export WD=-wd-
export PLUGIN=-plugin-
export EXTRA=-extra-
EOF
}

emit_internal_env_file () {
cat > .tmp/_internalenv.sh <<EOF
export BEM_DEBUG=-bemdebug-
export USER=-user-
export HOME=-home-
export USERNAME=-username-
export USERHOME=-userhome-
export INTERNALUSER=-internaluser-
export INTERNALUSERNAME=-internalusername-
export INTERNALUSERHOME=-internaluserhome-
export APPNAME=-appname-
export PYTHONVERSION=-pythonversion-
export PLATFORM=-platform-
export TYPE=-type-
export CMD=-cmd-
export DPENAME=-dpename-
export MACHINE=-machine-
export WD=-wd-
export PLUGIN=-plugin-
export EXTRA=-extra-
EOF
}

edit_common_env_file () {
  sed "s#$1#\"$2\"#g" .tmp/_commonenv.sh > .tmp/_commonenv.tmp
  rm .tmp/_commonenv.sh
  mv .tmp/_commonenv.tmp .tmp/_commonenv.sh
}

edit_external_env_file () {
  sed "s#$1#\"$2\"#g" .tmp/_externalenv.sh > .tmp/_externalenv.tmp
  rm .tmp/_externalenv.sh
  mv .tmp/_externalenv.tmp .tmp/_externalenv.sh
}

edit_internal_env_file () {
  sed "s#$1#\"$2\"#g" .tmp/_internalenv.sh > .tmp/_internalenv.tmp
  rm .tmp/_internalenv.sh
  mv .tmp/_internalenv.tmp .tmp/_internalenv.sh
}
