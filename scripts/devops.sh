#!/bin/bash
# Automatically logs in to DevOps remote server
SERVER="devops.va"
SSH_KEY="~/.ssh/$SSH_KEY"

echo "Adding SSH key to session ... "
ssh-add ~/.ssh/$SSH_KEY
echo " ... done. Logging in now ... "
ssh $SERVER
