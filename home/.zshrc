# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$PATH:$HOME/src/ccls/Release/
export PATH=$PATH:$HOME/scripts/
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/cuda/bin
export PATH=$PATH:/opt/st/stm32cubeide_1.18.0

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# Path to your oh-my-zsh installation.
export ZSH="/home/${USER}/.oh-my-zsh"

# Theme
ZSH_THEME="bira"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(ssh-agent git taskwarrior virtualenv pip ros)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Aliases
source ~/.aliasrc

# Preferred application
export EDITOR='nvim'
export TERMINAL='kitty'
export BROWSER='firefox'

# App specific RC
source ~/.app_specific_rc

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

function load_api_keys() {
    export OPENAI_API_KEY="$(bw get password chatgpt.nvim)"
}

# open project (ctrl+P)
function launcher() { project_launcher; zle -reset-prompt; zle redisplay }
zle -N launcher
bindkey '^p' launcher

# open new window (ctrl+O)
function launcher_window() { project_launcher window; zle -reset-prompt; zle redisplay }
zle -N launcher_window
bindkey '^o' launcher_window

# open dir (ctrl+F)
function launcher_dir() { dir_launcher; zle -reset-prompt; zle redisplay }
zle -N launcher_dir
bindkey '^ff' launcher_dir

# FZF open folder (ctrl+T)
function open_dir() {
    # local cmd="find -L . -type d -not -wholename '*/.git*' | fzf"
    cmd=`find -L . -type d -not -wholename '*/.git*' | fzf`
    cd $cmd
}
zle -N open_dir
bindkey '^fo' open_dir
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Docker Clean Function Marker
docker_clean() {
    docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
}
