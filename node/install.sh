#!/usr/bin/env bash
# Install mise (works on macOS and Ubuntu/Debian)

if ! command -v mise &>/dev/null; then
  echo "Installing mise..."
  curl https://mise.run | sh
fi
