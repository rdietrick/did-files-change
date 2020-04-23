#!/bin/bash
set -e

SHA=$1
PATHSPEC=$2
echo "Checking diffs in commit $SHA"

echo "executing: git diff-tree --no-commit-id --name-only -r $SHA $PATHSPEC"
git diff-tree --no-commit-id --name-only -r $SHA $PATHSPEC

function check() {
  if [[ -z "$(git diff-tree --no-commit-id --name-only -r $SHA $PATHSPEC)" ]];
  then
    echo "0"
  else
    echo "1"
  fi
}

echo ::set-output name=changed::$(check)
