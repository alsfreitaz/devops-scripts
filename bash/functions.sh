#!/usr/bin/env bash

function source_vars {
  cd ..
  source vars.sh
  cd - > /dev/null
  source $HOME/.bash_profile
}
