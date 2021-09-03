# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/shubham/.oh-my-zsh"

ZSH_THEME="robbyrussell"
# CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_MAGIC_FUNCTIONS="true"
COMPLETION_WAITING_DOTS="true"
ZSH_CUSTOM=/home/shubham/.config/zsh
plugins=(git cargo)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

PATH=$PATH:~/.emacs.d/bin
PATH=$PATH:/home/shubham/.local/bin
export EDITOR='nvim'
export TERMINAL='kitty'
export BROWSER='brave'

#aliases
alias weather='curl wttr.in/bhanpura'
alias rick='curl -s -L http://bit.ly/10hA8iC | bash'
alias sauce='~/pp/code3'
echo -en "\e[97m\e[40m         \e[41m        \e[42m        \e[43m        \e[44m        \e[45m        \e[46m        \e[47m        \e[100m        \e[101m        \e[102m        \e[103m        \e[104m        \e[105m        \e[106m        \e[107m        \\n"
