#alias ls='ls --color=auto'
alias ls='colorls --sd --gs'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pacman='pacman --color=always'
alias vi='vim'


export VISUAL=vim
export EDITOR="$VISUAL"
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_arch_icon user dir dir_writable vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)
export POWERLEVEL9K_MODE='nerdfont-complete'
export POWERLEVEL9K_CUSTOM_ARCH_ICON='echo '
export POWERLEVEL9K_CUSTOM_ARCH_ICON_BACKGROUND=009
export POWERLEVEL9K_CUSTOM_ARCH_ICON_FOREGROUND=015
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=5000
export SAVEHIST=5000


source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

setopt AUTO_CD
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY


function lazygit() {
	git add .
	git commit -a -m "$1"
	git push
}

