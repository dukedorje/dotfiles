# Named with a b so antigen is loaded first
# For some reason to uninstall a package, I keep having to rm -rf ~/.antigen

antigen use oh-my-zsh

# antigen bundle fzf
antigen bundle unixorn/fzf-zsh-plugin@main
#antigen bundle urbainvaes/fzf-marks
antigen bundle git
antigen bundle lein
antigen bundle command-not-found
#antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle asdf
antigen theme romkatv/powerlevel10k

antigen apply
