#!/usr/bin/env bash

source ../../bash/functions.sh
source_vars
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

pyenv activate $VIRTUALENV_NAME
ansible-vault encrypt_string
