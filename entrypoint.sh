#!/bin/bash
set -e

SHA=$1
PATHSPEC=$2

function check() {
  if [[ -z "$(git diff-tree --no-commit-id --name-only -r $SHA $PATHSPEC)" ]];
  then
    echo "0"
  else
    echo "1"
  fi
}

CHANGED=$(check)
echo "CHANGED=$CHANGED"
echo ::set-output name=changed::$CHANGED
