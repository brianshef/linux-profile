#!/bin/bash
# Automatically logs in to DevOps remote server
SERVER="devops.va"
KEY_DIR="$HOME/.ssh"
SSH_KEYS=( "$KEY_DIR/brianshef" "$KEY_DIR/id_rsa" )
KEYS_ADDED=0
for key in "${SSH_KEYS[@]}"; do
  if [ -e "${key}" ]; then
    echo "Adding SSH key $key to session ... "
    ssh-add $key
    (( KEYS_ADDED++ ))
  else
    echo "WARNING! $key not found! Skipping ... "
  fi
done
if [ $KEYS_ADDED -gt 0 ]; then
  echo " ... done adding $KEYS_ADDED key(s) to session."
  echo "Logging in now (with agent forwarding enabled) ... "
  ssh -A $SERVER
else
  echo " ... no key(s) added to session. Unable to SSH to $SERVER."
  exit 0
fi
