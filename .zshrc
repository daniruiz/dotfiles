alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
command -v lsd &> /dev/null && alias ls='lsd --group-dirs first'
command -v colorls &> /dev/null && alias ls='colorls --sd --gs'
command -v htop &> /dev/null && alias top='htop'
command -v gotop &> /dev/null && alias top='gotop -p'

alias vi='vim'
alias pacman='pacman --color=always'
alias scss='scss --no-cache --quiet --sourcemap=none'
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

# ------------------------------- ZSH SETTINGS --------------------------------
# ----- options -----
unsetopt NO_BEEP
unsetopt NO_MATCH
setopt AUTO_CD
setopt BEEP
setopt NOMATCH
setopt NOTIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_BEEP
setopt INTERACTIVE_COMMENTS
setopt MAGIC_EQUAL_SUBST

HISTFILE="$HOME/.zsh_history"
HIST_STAMPS=mm/dd/yyyy
DISABLE_UPDATE_PROMPT=true
HISTSIZE=5000
SAVEHIST=5000
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#ccc'
ZLE_RPROMPT_INDENT=0

# ----- keys -----
bindkey '^[[2~' overwrite-mode
bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3;5~' kill-word

# ----- promt -----
PS1="%F{cyan} %~ >%F{blue}> %F{reset}"

# ----- plugins -----
PLUGINS_DIR=/usr/share/zsh/plugins/
source $PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload compinit && compinit

# -------------------------------- POWERLEVEL ---------------------------------

POWERLEVEL9K_MODE=nerdfont-complete
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K=truncate_beginning
POWERLEVEL9K_TIME_BACKGROUND=black
POWERLEVEL9K_TIME_FOREGROUND=white
POWERLEVEL9K_TIME_FORMAT=%D{%I:%M}
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_CLEAN_FOREGROUND=black
POWERLEVEL9K_VCS_CLEAN_BACKGROUND=green
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=black
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=yellow
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=white
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=black
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=black
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=blue
POWERLEVEL9K_FOLDER_ICON=
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_VCS_UNTRACKED_ICON=●
POWERLEVEL9K_VCS_UNSTAGED_ICON=±
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=↓
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=↑
POWERLEVEL9K_VCS_COMMIT_ICON=' '
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{blue}╭─%F{red}'
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{blue}╰%f '
POWERLEVEL9K_CUSTOM_OS_ICON='echo   $(whoami) '
POWERLEVEL9K_CUSTOM_OS_ICON_BACKGROUND=red
POWERLEVEL9K_CUSTOM_OS_ICON_FOREGROUND=white
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_os_icon ssh root_indicator dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status background_jobs time ram)

if [[ $(tty) == /dev/pts/* ]]; then
	source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme;
else
	clear
	echo
	echo
fi

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

