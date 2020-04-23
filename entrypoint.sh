#!/bin/bash
set -e

SHA=$1
PATHSPEC=$2
echo "Checking diffs in commit $SHA in paths $PATHSPEC"

RES=`git diff-tree --no-commit-id --name-only -r $SHA $PATHSPEC`
echo "RESULTS: $RES"

function check() {
  if [[ -z "$(git diff-tree --no-commit-id --name-only -r $SHA $PATHSPEC)" ]];
  then
    echo "0"
  else
    echo "1"
  fi
}

echo ::set-output name=changed::$(check)
