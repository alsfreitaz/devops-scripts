# /usr/bin/env bash

usage() {
  echo "$0 usage:" && grep -E "[-]{2,2}.+)[[:space:]]+###[[:space:]]+" $0 | sed -E "s/.*-{2,2}(.+)\)[[:space:]]+###[[:space:]]+(.*)/    --\1 \2/"
}

display=":0"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --display|-d) ### VNC server display number
      display=":$2"
      shift
      ;;
    --help|-h) ### Help menu
      usage
      exit 0
      ;;
    --|-)
      shift
      break
      ;;
    *)
      echo "Bad usage of $0"
      usage
      exit 1
      ;;
  esac
  shift
done

if [ ! -z ${display} ]; then
  echo "Starting x11vnc server ..."
  x11vnc -localhost -display "$display"
else
  echo "Some of the arguments are not properly set. Please check their current values:"
  echo "  --display: $display"
  exit 1
fi