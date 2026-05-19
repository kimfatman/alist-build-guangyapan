#!/bin/bash
echo "Installing gomobile..."
go install golang.org/x/mobile/cmd/gomobile@latest
echo "Initializing gomobile..."
gomobile init
echo "gomobile ready"