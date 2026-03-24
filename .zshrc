# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="proseadam"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT=true
ZSH_DISABLE_COMPFIX=true

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git macos)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

# Set the path again, even though a lot of this is set in ~/.MacOSX/environment.plist (for GUI apps),
# because the plist doesn't keep the PATH order the way I'd like (e.g. the user directory stuff is moved to the back)

export NVM_DIR="$HOME/.nvm"

# Lazy-load nvm on first use so shell startup stays fast.
_lazy_load_nvm() {
  unset -f nvm node npm npx corepack
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
}

nvm() { _lazy_load_nvm; nvm "$@"; }
node() { _lazy_load_nvm; node "$@"; }
npm() { _lazy_load_nvm; npm "$@"; }
npx() { _lazy_load_nvm; npx "$@"; }
corepack() { _lazy_load_nvm; corepack "$@"; }

export PATH=/Users/adam/.rvm/bin:/Users/adam/.nvm/v0.10.13/bin:~/bin:~/.local/bin:~/.gems/bin:/usr/local/bin:/usr/local/git/bin:/Users/adam/.gem/ruby/2.6.0/bin:/usr/local/sbin:/usr/bin/gem:/usr/local/mysql/bin:/usr/X11/bin:$PATH
export PATH=$PATH:/Users/adam/.local/lib/node_modules/{karma,protractor}/bin
export PATH=$PATH:/Users/adam/Library/Python/3.9/bin

# Go
export GOPATH=$GOPATH:/Users/adam/go

export MANPATH=$MANPATH:~/local/share/man

export EDITOR=sublime

export NODE_PATH=~/.local/lib/node_modules:/usr/local/lib/node:$NODE_PATH

export LOCAL_DEV=1

hash -d iCloud=~/Library/Mobile\ Documents/com\~apple\~CloudDocs
alias icloud='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs'

# My aliases :)
alias afs='~/dev/adamschwartz.github.io'
alias sublime='subl'
alias e='sublime'
alias giterdone='gitx -c'
alias running='ps aux | grep'
alias treee='tree -C -L 2'
alias g='git'
alias gp='git pull'
alias gpr='git pull --rebase origin main'
alias gprm='git pull --rebase origin master'
alias gd='git push'
alias gs='git status'
alias gl='git log'
alias gc='git commit'
alias eg='cd ~/dev/projects/eagerio'
alias updatezsh='source ~/.zshrc'
alias editzsh='sublime ~/.zshrc'
#alias webpop='cd /Volumes/OptiBay\ Drive/Dropbox/Private/Code/Webpop/adamschwartz'
alias gitergone='git stash; git stash drop'
cdls() {
	cd $1
	ls
}
alias show='cdls $1'

# Prevent git tab-autocomplete from being super slow
# From: http://talkings.org/post/5236392664/zsh-and-slow-git-completion
__git_files () {
 _wanted files expl 'local files' _files
}

#alias hsd='~/Volumes/OptiBay\ Drive/Dropbox/GitHub/hsdoc/run.js'
#alias hsda='~/Volumes/OptiBay\ Drive/Dropbox/GitHub/run.js -a'
alias math="bc"

#########
# Auto-switch Node only when a .nvmrc exists in the current directory tree.
autoload -U add-zsh-hook
_find_nvmrc() {
  local dir="$PWD"
  while [ "$dir" != "/" ]; do
    if [ -f "$dir/.nvmrc" ]; then
      echo "$dir/.nvmrc"
      return 0
    fi
    dir="${dir:h}"
  done
  return 1
}

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(_find_nvmrc)" || return 0
  _lazy_load_nvm
  nvm use --silent >/dev/null 2>&1 || nvm install >/dev/null 2>&1
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
#########

alias python=/usr/bin/python3

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
