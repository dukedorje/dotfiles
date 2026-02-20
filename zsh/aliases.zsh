alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

# fd - instead of find
# rg - ripgrep

# /Volumes/Media -fstype=nfs,resvport,soft,intr,rw,proto=tcp,rsize=8192,wsize=8192 nfs://lenovo.local:/Media
alias nfs_mount="sudo mount -t nfs -o nfsvers=4,soft,intr,rw,rsize=8192,wsize=8192,timeo=60,retrans=2,resvport lenovo.local:/Media /private/nfs/"
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'

alias ll="ls -l"
#alias rnd='open "rndebugger://set-debugger-loc?host=localhost&port=19001"'
alias g=git
alias gpr="git pull -r"
alias dbm="bun run db:migrate"
alias nr="npm run"
alias tf="terraform"
alias y=yarn
alias p=pnpm
alias px=pnpx
alias b="bun run"
alias bx="bun x"
alias c="cargo"

alias ytx="yt-dlp -x"
alias ytxa="yt-dlp --audio-format aac --no-playlist -x"

alias z="zellij"
alias ccd="claude --dangerously-skip-permissions"
