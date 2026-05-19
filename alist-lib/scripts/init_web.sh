#!/bin/bash
echo "Downloading AList web assets..."
git clone --depth 1 https://github.com/AlistGo/alist-web.git ./alist-web 2>/dev/null || {
  echo "Git clone failed, trying direct download..."
  DIST_URL="https://github.com/AlistGo/alist-web/releases/latest/download/dist.tar.gz"
  wget -q "$DIST_URL" -O dist.tar.gz 2>/dev/null || curl -sL "$DIST_URL" -o dist.tar.gz
  if [ -f dist.tar.gz ]; then
    mkdir -p ./alist-web/dist
    tar -xzf dist.tar.gz -C ./alist-web/dist 2>/dev/null || echo "Extraction failed"
    rm dist.tar.gz
  fi
}
if [ -d ./alist-web/dist ]; then
  echo "Web assets downloaded successfully"
  mkdir -p ../../public
  cp -r ./alist-web/dist/* ../../public/ 2>/dev/null || true
fi