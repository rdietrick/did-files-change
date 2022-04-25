#!/bin/bash
set -e

SHA=$1
PATHSPEC=$2

# echo "Debugging info"
# pwd
# ls -la /
# ls -la .
# ls -la ../
git config --global --add safe.directory "$GITHUB_WORKSPACE"

function check() {
  if [[ -z "$(git diff-tree --no-commit-id --name-only -m -r $SHA $PATHSPEC)" ]];
  then
    echo "0"
  else
    echo "1"
  fi
}

echo ::set-output name=changed::$(check)
