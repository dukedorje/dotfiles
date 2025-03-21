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
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_AUTO_USE=true
antigen bundle lukechilds/zsh-nvm

#! Themes !#
# antigen theme romkatv/powerlevel10k
antigen theme spaceship-prompt/spaceship-prompt
# antigen theme agnoster/agnoster-zsh-theme

antigen apply