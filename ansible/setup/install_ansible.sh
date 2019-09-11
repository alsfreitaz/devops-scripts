#!/usr/bin/env bash

source ../../bash/functions.sh

# If in trouble with the building sted please refer to https://github.com/pyenv/pyenv/wiki/Common-build-problems
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

pyenv install $PYTHON_VERSION -s
pyenv virtualenv $PYTHON_VERSION $VIRTUALENV_NAME
pyenv activate $VIRTUALENV_NAME
pip install --upgrade pip
pip install -r $PIP_REQUIREMENTS_PATH
