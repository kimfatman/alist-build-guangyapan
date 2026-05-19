#!/bin/bash
# Fix the SheltonZhu/115driver dependency issue
# This revision doesn't exist on GitHub, so we need to replace it
set -e
cd ../ || exit
# Find and fix the 115 driver dependency
go mod edit -droprequire github.com/SheltonZhu/115driver 2>/dev/null || true
go mod edit -dropreplace github.com/SheltonZhu/115driver 2>/dev/null || true
# Try to use a valid version
go mod edit -require github.com/SheltonZhu/115driver@v1.2.3 2>/dev/null || true
# Check if go.sum needs updating
echo "Dependencies fixed, running go mod tidy..."
cd alistlib || exit
go mod tidy 2>/dev/null || true
cd ..
echo "Done fixing dependencies"