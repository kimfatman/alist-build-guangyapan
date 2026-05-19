#!/bin/bash
set -e
cd ../alistlib || exit
go mod tidy
cd ../scripts
./fix_deps.sh
cd ../alistlib || exit
if [ "$1" == "debug" ]; then
  gomobile bind -ldflags "-s -w" -v -androidapi 19 -target="android/arm64"
else
  gomobile bind -ldflags "-s -w" -v -androidapi 19
fi
echo "Moving aar and jar files to output..."
mkdir -p ../../output
mv -f ./*.aar ../../output/
mv -f ./*.jar ../../output/
echo "Build artifacts in output/:"
ls -la ../../output/