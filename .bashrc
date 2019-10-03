xprop -root -remove _ICC_PROFILE

#alias ls="ls --color=auto"
alias ls="lsd --group-dirs first"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias pacman="pacman --color=always"
alias scss="scss --no-cache --quiet"
alias vi="vim"
alias ..="cd .."


export VISUAL=vim
export EDITOR="$VISUAL"

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

shopt -s globstar

function lazygit() {
	git status .
	git add .
	git commit -m "$1"
	git push origin master
}
