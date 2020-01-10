alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

command -v lsd &> /dev/null && alias ls='lsd --group-dirs first'
command -v htop &> /dev/null && alias top='htop'

alias pacman='pacman --color=always'
alias scss='scss --no-cache --quiet --sourcemap=none'
alias vi='vim'
alias xclip='xclip -selection c'
alias ..='cd ..'


export VISUAL=vim
export EDITOR=$VISUAL

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

shopt -s globstar
shopt -s histappend
shopt -s checkwinsize

HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=5000

# ----- promt -----
PS1=" \[\033[01;36m\]\w >\[\033[34m\]>\[\033[00m\] "

# -------------------------------- FUNCTIONS ---------------------------------
function lazygit() {
	git status .
	git add .
	git commit -m "$1"
	git push origin HEAD
}

function find() {
	if [ $# = 1 ];
	then
		command find . -iname "*$@*"
	else
		command find "$@"
	fi
}

# ----------------------------------- MISC -----------------------------------
# ----- Bash Completion -----
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

