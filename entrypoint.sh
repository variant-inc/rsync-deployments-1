#!/bin/sh

# Start the SSH agent and load key.
source agent-start "$GITHUB_ACTION"
echo "$INPUT_REMOTE_KEY" | agent-add

# Add strict errors and deploy.
set -eu
sh -c "rsync $INPUT_SWITCHES -e 'ssh -o StrictHostKeyChecking=no' $GITHUB_WORKSPACE/$INPUT_PATH $INPUT_REMOTE_USER@$INPUT_REMOTE_HOST:$INPUT_REMOTE_PATH"
