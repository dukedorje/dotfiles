export PNPM_HOME="$HOME/Library/pnpm"
export BUN_INSTALL="$HOME/.bun"

export PATH="./bin:/usr/local/bin:/usr/local/sbin:$ZSH/bin:$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$PNPM_HOME:$PATH"
export PATH="$HOME/.local/share/mise/shims:$PATH"
export PATH="$HOME/.avm/bin:$PATH"

[ -d "$HOME/.fluvio/bin" ] && export PATH="$PATH:$HOME/.fluvio/bin"
[ -d "$HOME/.foundry/bin" ] && export PATH="$PATH:$HOME/.foundry/bin"
[ -d "$HOME/.local/share/solana/install/active_release/bin" ] && export PATH="$PATH:$HOME/.local/share/solana/install/active_release/bin"
[ -d "$HOME/.maestro/bin" ] && export PATH="$PATH:$HOME/.maestro/bin"

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
