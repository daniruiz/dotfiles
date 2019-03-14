#alias ls='ls --color=auto'
alias ls='colorls --sd --gs'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pacman='pacman --color=always'
alias vi='vim'
alias ..='cd ..'


export VISUAL=vim
export EDITOR="$VISUAL"
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"


shopt -s globstar

function lazygit() {
	git add .
	git commit -a -m "$1"
	git push
}

