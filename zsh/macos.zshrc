# Use clone of zsh
export ZSH=$HOME/.oh-my-zsh

# Set environment
export LANG=en_US.UTF-8
export SSH_KEY_PATH=$HOME/.ssh/config
export EDITOR=$(which emacs)
export GIT_EDITOR=$(which vim)
ZSH_THEME="robbyrussell"

# Enable plugins
plugins=(
    git
    osx 
    python 
    perl
)

## start aliases ##
# python3.* virtualenv
alias create="virtualenv --python=python3 venv"
alias activate="source venv/bin/activate"

# git
alias rebaseroot="git rebase -i --root" #$branch_name
alias rebase="git rebase -i"
alias add="git add"

# overwrite guards
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
## end aliases ##

# Inserted zsh plugins, initialize
source $ZSH/oh-my-zsh.sh

# Set time-stamp format
HIST_STAMPS="dd.mm.yyyy"

# --------------- OTHER OPTIONS BELOW --------------- #
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
