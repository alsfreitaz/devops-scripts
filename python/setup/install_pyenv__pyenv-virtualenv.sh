#!/usr/bin/env bash

if [ -d "$HOME/.pyenv" ]; then
  cd "$HOME/.pyenv"
  git pull
  cd -
else 
  curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
fi

grep -qxF 'export PATH="$HOME/.pyenv/bin:$PATH"' $HOME/.bash_profile || echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> $HOME/.bash_profile
grep -qxF 'eval "$(pyenv init -)"' $HOME/.bash_profile || echo 'eval "$(pyenv init -)"' >> $HOME/.bash_profile
grep -qxF 'eval "$(pyenv virtualenv-init -)"' $HOME/.bash_profile || echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.bash_profile

source $HOME/.bash_profile

if [ -d "$(pyenv root)/plugins/pyenv-virtualenv" ]; then
  cd "$(pyenv root)/plugins/pyenv-virtualenv"
  git pull
  cd -
else
  git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
fi
