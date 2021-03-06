#!/bin/bash
set -e

SHA=$1
PATHSPEC=$2

function check() {
  if [[ -z "$(git diff-tree --no-commit-id --name-only -m -r $SHA $PATHSPEC)" ]];
  then
    echo "0"
  else
    echo "1"
  fi
}

echo ::set-output name=changed::$(check)
