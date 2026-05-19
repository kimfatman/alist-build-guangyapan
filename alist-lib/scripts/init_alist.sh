#!/bin/bash
GIT_REPO="https://github.com/AlistGo/alist.git"
echo "Using AList repo: $GIT_REPO"

# Use main branch instead of latest tag to avoid dependency issues
BRANCH="main"
echo "Using branch: $BRANCH"

rm -rf ./src
unset GIT_WORK_TREE
git clone --depth 1 --branch "$BRANCH" $GIT_REPO ./src
rm -rf ./src/.git
mv -f ./src/* ../
rm -rf ./src
cd ../
go mod edit -replace github.com/djherbis/times@v1.6.0=github.com/jing332/times@latest