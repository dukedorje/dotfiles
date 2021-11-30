# TODO: Handle if there is no `brew`
FZF_DIR=$(brew --prefix fzf)
if [[ -d $FZF_DIR ]]
then
    source $FZF_DIR/shell/completion.zsh
    source $FZF_DIR/shell/key-bindings.zsh
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    #export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
