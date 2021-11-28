
source $(brew --prefix fzf)/shell/completion.zsh
source $(brew --prefix fzf)/shell/key-bindings.zsh

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
