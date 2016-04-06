#!/bin/bash
# Automatically logs in to DevOps remote server
SERVER="devops.va"
SSH_KEY="$HOME/.ssh/brianshef"

echo "Adding SSH key $SSH_KEY to session ... "
ssh-add $SSH_KEY
echo " ... done. Logging in now ... "
ssh $SERVER
