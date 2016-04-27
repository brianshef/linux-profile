#!/bin/bash
# Automatically logs in to DevOps remote server
SERVER="devops.va"
KEY_DIR="$HOME/.ssh"
SSH_KEYS=( "$KEY_DIR/brianshef" "$KEY_DIR/id_rsa" )

for key in "${SSH_KEYS[@]}"; do
  echo "Adding SSH key $SSH_KEY to session ... "
  ssh-add $key
done
echo " ... done. Logging in now (with agent forwarding enabled)... "
ssh -A $SERVER
