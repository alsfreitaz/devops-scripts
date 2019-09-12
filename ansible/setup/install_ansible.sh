#!/usr/bin/env bash

source ../../bash/functions.sh
source_vars

pyenv install $PYTHON_VERSION -s
pyenv virtualenv $PYTHON_VERSION $VIRTUALENV_NAME
pyenv activate $VIRTUALENV_NAME
pip install --upgrade pip
pip install -r $PIP_REQUIREMENTS_PATH
