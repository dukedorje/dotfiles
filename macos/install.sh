if test ! "$(uname)" = "Darwin"
  then
  exit 0
fi

echo "MacOS install. Not running these automatically to avoid any surprises."
echo ""
echo "macos/softwareupdate.sh: Auto-runs all software updates waiting in MacOS."
echo "macos/set-defaults.sh: Set a bunch of system defaults in MacOS. Probably read it and comment/uncomment what you want."



# export ZSH=$HOME/.dotfiles

# # Set macOS defaults
# $ZSH/macos/set-defaults.sh

# # Install homebrew
# $ZSH/homebrew/install.sh 2>&1

# # Upgrade homebrew
# echo "› brew update"
# brew update

# # Install software
# echo "› $ZSH/script/install"
# $ZSH/script/install
