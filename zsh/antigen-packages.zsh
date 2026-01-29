#? NOTE: to uninstall a package, clean packages: `rm -rf ~/.antigen`

antigen use oh-my-zsh

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins


antigen bundle git
antigen bundle fzf
# antigen bundle docker
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle unixorn/fzf-zsh-plugin@main
antigen bundle urbainvaes/fzf-marks
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle rbenv

# antigen bundle synec/nvm-auto
export NVM_LAZY_LOAD=false
export NVM_COMPLETION=true
export NVM_AUTO_USE=true
antigen bundle lukechilds/zsh-nvm

#! Themes !#
# Only load themes in interactive shells to avoid interfering with agent shells
if [[ -o interactive ]]; then
  # antigen theme romkatv/powerlevel10k
  # antigen theme spaceship-prompt/spaceship-prompt
  antigen theme agnoster/agnoster-zsh-theme
fi
# Disable fancy prompts for Cursor Agent sessions
if [[ -n "$CURSOR_AGENT" ]]; then
  # Bare minimum prompt
  unset ZSH_THEME
  PS1='%~ $ '
fi
# if [[ -o interactive ]] && [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi


antigen apply
