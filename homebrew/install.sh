#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else; then
    echo "Skipping Homebrew installation on Linux etc"
    # elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
    # then
    #   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi

  echo "Try running homebrew/install-brewfile.sh to install everything in our Brewfile! Or edit it first."

fi

exit 0
