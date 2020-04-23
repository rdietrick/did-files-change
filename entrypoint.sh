#!/bin/bash
set -e

SHA=$1
PATHSPEC=$2
echo "Checking diffs in commit $SHA"

RES=`git diff-tree --no-commit-id --name-only -r $SHA $PATHSPEC`
echo "RESULTS: $RES"

git show

function check() {
  if [[ -z "$(git diff-tree --no-commit-id --name-only -r $SHA $PATHSPEC)" ]];
  then
    echo "0"
  else
    echo "1"
  fi
}

echo ::set-output name=changed::$(check)
