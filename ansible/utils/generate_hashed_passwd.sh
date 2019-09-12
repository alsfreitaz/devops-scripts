#!/usr/bin/env bash

source ../../bash/functions.sh
source_vars
pyenv activate $VIRTUALENV_NAME

default_salt=$(python -c 'import crypt; print(crypt.mksalt(crypt.METHOD_SHA512))')
echo "Inform the password to be hashed with SHA512 (salt=$(echo $default_salt | cut -c4-))"
echo $(python -c "import crypt,getpass; print(crypt.crypt(getpass.getpass(), '$default_salt'))")
