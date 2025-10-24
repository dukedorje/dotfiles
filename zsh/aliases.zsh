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
alias be="bundle exec"
alias bi="bundle install"
# alias ss="spring stop"
alias gpr="git pull -r"
alias s="bin/rails s"
alias co="bin/rails c"
alias r="bin/rails"
alias ra="bin/rake"
alias dbm="bin/rails db:migrate"
alias rs="bin/rspec"
alias nr="npm run"
alias tf="terraform"
alias y=yarn
alias hh="pnpm hardhat"
alias p=pnpm
alias px=pnpx
alias br="bun run"
alias b="bun"
alias c="cargo"

alias ytx="yt-dlp -x"
alias ytxa="yt-dlp --audio-format aac --no-playlist -x"

alias z="zellij"
alias applypath="echo 'An AI Agent should run this internally, not on the command shell.'"
