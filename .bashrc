alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pacman='pacman --color=always'
alias vi='vim'
alias ..='cd ..'


export VISUAL=vim
export EDITOR="$VISUAL"


function lazygit() {
    git add .
    git commit -a -m "$1"
    git push
}


shopt -s globstar

