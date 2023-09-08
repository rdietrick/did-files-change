#!/bin/bash
set -e

SHA=$1
PATHSPEC=$2

# this is needed to grant the ensuing git commands to access to the main workflow's repo
git config --global --add safe.directory "$GITHUB_WORKSPACE"

function check() {
  if [[ -z "$(git diff-tree --no-commit-id --name-only -m -r $SHA $PATHSPEC)" ]];
  then
    echo "0"
  else
    echo "1"
  fi
}

echo "changed=$(check)" >> $GITHUB_OUTPUT