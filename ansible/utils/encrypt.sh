#!/usr/bin/env bash

source ../../bash/functions.sh
source_vars
pyenv activate $VIRTUALENV_NAME

ansible-vault encrypt_string
