# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="af-magic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
export GOPATH=$HOME/dev/golang
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$GOPATH/bin:/usr/local/opt/go/libexec/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias venv="source venv/bin/activate"

venv_create_2() {
    virtualenv -p /usr/local/bin/python2 $1
    ln -s $1 venv
}


venv_create_3() {
    virtualenv -p /usr/local/bin/python3 $1
    ln -s $1 venv
}

# Mongo
# Check for /usr/local/var/mongodb/mongo.lock if not start
alias run-mongo="mongod --config /usr/local/etc/mongod.conf"
alias log-mongo="tail -f /usr/local/var/log/mongodb/mongo.log"

# Mysql
alias run-mysql="mysql.server start"
alias log-mysql="tail -f /private/var/log/mysqld.log"

# Redis
alias run-redis="redis-server"

# Postgres
alias run-psql="postgres -D /usr/local/var/postgres -d 5"

# Apache
alias run-apache="sudo apachectl restart"
alias stop-apache="sudo apachectl stop"



# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Python SimpleHTTPServer
alias server="python -m SimpleHTTPServer 8000"
# Power grep
alias ggrep="sift"
# goto golang home
alias gojou="cd /Users/senyorjou/dev/golang/src/github.com/senyorjou"

# Create a tunnel
# ssh centos@demo.illuminarysolutions.com -L 27020:127.0.0.1:27017 -i .ssh/pems/illuminary-dev.pem


# Anaconda
PIP_REQUIRE_VIRTUALENV=false;alias anaconda="PATH=\"//Users/senyorjou/anaconda/bin:$PATH\"; ipython"
alias nb="ipython notebook"

PIP_REQUIRE_VIRTUALENV=false;alias anaconda3="PATH=\"//Users/senyorjou/anaconda3/bin:$PATH\"; ipython3"
alias jp="jupyter notebook"

# Z
source `brew --prefix`/etc/profile.d/z.sh

# tell brew do not call home
export HOMEBREW_NO_ANALYTICS=1
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

find_port() {
    lsof -i :$1
}

# U know... locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# The next line updates PATH for the Google Cloud SDK.
source '/Users/senyorjou/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/senyorjou/google-cloud-sdk/completion.zsh.inc'
