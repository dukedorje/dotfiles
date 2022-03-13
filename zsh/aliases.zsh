alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

# fd - instead of find
# rg - ripgrep

alias g=git
alias be="bundle exec"
alias bi="bundle install"
alias ss="spring stop"
alias gpr="git pull -r"
alias s="bin/rails s"
alias c="bin/rails c"
alias r="bin/rake"
alias dbm="bin/rake db:migrate"
alias rs="bin/rspec"
alias nr="npm run"
alias tf="terraform"

alias y=yarn
alias rnd='open "rndebugger://set-debugger-loc?host=localhost&port=19001"'
alias hh="yarn hardhat"
alias drmi="docker images | sed 1d | fzf -m --tac | tr -s ' ' | cut -d ' ' -f 3 | xargs docker rmi"
alias drm="docker ps -a | sed 1d | fzf -m --tac | cut -d ' ' -f 1 | xargs docker rm"
alias dkill="docker ps | sed 1d | fzf -m --tac | cut -d ' ' -f 1 | xargs docker kill"
alias dkillall="docker ps -a -q | xargs docker kill -f"
alias drmiall="docker images -q | xargs docker rmi"

superman () {
  man -t $1 | open -f -a Preview
}
