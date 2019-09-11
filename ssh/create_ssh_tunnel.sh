# /usr/bin/env bash

usage() {
  echo "$0 usage:" && grep -E "[-]{2,2}.+)[[:space:]]+###[[:space:]]+" $0 | sed -E "s/.*-{2,2}(.+)\)[[:space:]]+###[[:space:]]+(.*)/    --\1 \2/"
}

server=''
user=''
local_port=''
remote_port=''
command=''

[[ $# -eq 0 ]] && usage && exit 1;

while [[ $# -gt 0 ]]; do
  case "$1" in
    --server|-s) ### Remote server hostname or IP
      server=$2
      shift
      ;;
    --local-port|-l) ### Local port to bind the SSH tunnel port
      local_port=$2
      shift
      ;;
    --remote-port|-r) ### Remote server port
      remote_port=$2
      shift
      ;;
    --user|-u) ### User login
      user=$2
      shift
      ;;
    --command|-c) ### (OPTIONAL) Command to run on the remote machine. If left unset, just a SSH tunnel will be created
      echo "command set"
      command=$2
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

if [ ! -z ${server} ] && [ ! -z ${local_port} ] && [ ! -z ${remote_port} ] && [ ! -z ${user} ]; then
  if [ -z "$command" ]; then
      echo "Setting SSH tunnel to remote host..."
      ssh -nNT -L $local_port:localhost:$remote_port $user@$server
  else
      echo "Running command on remote machine through SSH tunnel..."
      ssh -t -L $local_port:localhost:$remote_port $user@$server "$command"
  fi
else
  error=true
fi

if [ ! -z "$error" ]; then
  echo "error: $error"
  echo "Some of the arguments are not properly set. Please check their current values:"
  echo "  --server: $server"
  echo "  --local-port: $local_port"
  echo "  --remote-port: $remote_port"
  echo "  --user: $user"
  echo "  --command: $command"
  exit 1
fi