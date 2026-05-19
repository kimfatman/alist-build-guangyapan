#!/bin/bash
set -e
cd ..
# Fix SheltonZhu/115driver broken pseudo-version
# v1.2.3-1 doesn't exist, use v1.2.3 instead
go mod edit -droprequire github.com/SheltonZhu/115driver 2>/dev/null || true
go mod edit -dropreplace github.com/SheltonZhu/115driver 2>/dev/null || true
go mod edit -require github.com/SheltonZhu/115driver@v1.2.3 2>/dev/null || true
echo "Fixed 115 driver dependency"
cd alistlib && go mod tidy && cd ..
echo "Dependencies fixed successfully"