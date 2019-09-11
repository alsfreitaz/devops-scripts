#!/usr/bin/env bash

source ../../bash/functions.sh

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

pyenv activate $VIRTUALENV_NAME 2>/dev/null
ansible-vault encrypt_string
