
# Preliminary check for .pyenv directory
if [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PATH:$PYENV_ROOT/bin"
fi

# Now check for pyenv command
if (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"
else
  echo "pyenv is not installed or .pyenv directory doesn't exist. Skipping pyenv setup."
fi
