#alias ls='ls --color=auto'
alias ls='lsd --group-dirs first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pacman='pacman --color=always'
alias scss='scss --no-cache --quiet --sourcemap=none'
alias vi='vim'
alias ..='cd ..'
alias xclip='xclip -selection c'


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

# ----- promt -----
PS1="\e[36m \W >\e[34m> \e[39m"

# -------------------------------- FUNCTIONS ---------------------------------
function lazygit() {
	git status .
	git add .
	git commit -m "$1"
	git push origin HEAD
}

# ----------------------------------- MISC -----------------------------------
# Gnome terminal Flat-Remix color-scheme
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/palette "['#1F2229', '#D41919', '#5EBDAB', '#FEA44C', '#357AF0', '#BF2E5D', '#49AEE6', '#FFFFFF', '#8C42AB', '#FF0000', '#00FFCF', '#FF7E00', '#005EFF', '#FF0053', '#00A4FF', '#FFFFFF']"
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/bold-is-bright true
