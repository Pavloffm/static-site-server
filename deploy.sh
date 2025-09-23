#!/bin/bash

USER="azureuser" # user
HOST="20.238.19.25" # host 
REMOTE_DIR="/var/www/app/site" # nginx directory
SSH_KEY="$HOME/DemoVM_key.pem" # ssh key

# sync local ./site/ to server
rsync -avz --delete -e "ssh -i $SSH_KEY" ./site/ ${USER}@${HOST}:${REMOTE_DIR}/

# reload nginx and ensure correct file/directory permissions
ssh -i "$SSH_KEY" ${USER}@${HOST} "
  find '${REMOTE_DIR}' -type d -exec chmod 755 {} \;
  find '${REMOTE_DIR}' -type f -exec chmod 644 {} \;
  sudo nginx -t && sudo systemctl reload nginx
"

echo "Site deployed: http://${HOST}"
