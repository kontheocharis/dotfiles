# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export TERM="xterm-256color-italic"

# Path to your oh-my-zsh installation.
export ZSH=/Users/Constantine/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to load Setting this variable when ZSH_THEME=random cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(
git
zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Username
# prompt_context() {
#   if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#   fi
# }

# sync nvim with cvim
alias cvimserver="python3 ~/Utilities/SyncNvimWithCvim/cvim_server.py"

# Nvim alias
alias n="nvim"
newpandoc () {
    cp -rv ~/iCloud/Pandoc\ Templates/"$1" ./"$2"
}


PATH=$PATH:/opt/metasploit-framework/bin
export PATH=$PATH:/opt/metasploit-framework/bin

skim () {
    open -a Skim "$1"
}

preview () {
    open -a Preview "$1"
}

# Vi mode
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# vim mode config
# ---------------

### Activate vi / vim mode:
bindkey -v

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ $KEYMAP == main ]] || [[ $KEYMAP == viins ]] || [[ $KEYMAP = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Start with beam shape cursor on zsh startup and after every command.
zle-line-init() { zle-keymap-select 'beam'}

export KEYTIMEOUT=1

###

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

POWERLEVEL9K_USER_DEFAULT_FOREGROUND='243'
POWERLEVEL9K_USER_ROOT_FOREGROUND='243'
POWERLEVEL9K_USER_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_USER_ROOT_BACKGROUND='black'

POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='blue'
POWERLEVEL9K_DIR_HOME_FOREGROUND='blue'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='blue'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='black'

POWERLEVEL9K_VCS_CLEAN_FOREGROUND='blue'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='011'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='009'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'

POWERLEVEL9K_STATUS_ERROR_BACKGROUND='black'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='red'
POWERLEVEL9K_STATUS_OK_FOREGROUND='green' 
POWERLEVEL9K_STATUS_OK_BACKGROUND='black'

POWERLEVEL9K_TIME_FOREGROUND='243' 
POWERLEVEL9K_TIME_BACKGROUND='black'

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B1'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B3'

# Add a space in the first prompt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
# Visual customisation of the second prompt line
local user_symbol="〉"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$user_symbol %{%f%}"

if [ -z ${TMUX} ]; then
  /usr/local/bin/tmux attach || /usr/local/bin/tmux
fi
alias config='/usr/bin/git --git-dir=/Users/Constantine/.cfg/ --work-tree=/Users/Constantine'
