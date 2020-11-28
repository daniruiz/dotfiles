
# Configure color-scheme
COLOR_SCHEME=dark # dark/light


# --------------------------------- ALIASES -----------------------------------
#alias ..='cd ..'
alias xclip='xclip -selection c'
command -v vim > /dev/null && alias vi='vim'

### Colorize commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias pacman='pacman --color=auto'

### LS & TREE
alias ll='ls -la'
alias la='ls -A'
alias l='ls -F'
command -v lsd > /dev/null && alias ls='lsd --group-dirs first' && \
	alias tree='lsd --tree'
command -v colorls > /dev/null && alias ls='colorls --sd --gs' && \
	alias tree='colorls --tree'

### CAT & LESS
command -v bat > /dev/null && \
	alias bat='bat --theme=ansi-$([ "$COLOR_SCHEME" = "light" ] && echo "light" || echo "dark")' && \
	alias cat='bat --pager=never' && \
	alias less='bat'
# in debian the command is batcat
command -v batcat > /dev/null && \
	alias batcat='batcat --theme=ansi-$([ "$COLOR_SCHEME" = "light" ] && echo "light" || echo "dark")' && \
	alias cat='batcat --pager=never' && \
	alias less='batcat'

### TOP
command -v htop > /dev/null && alias top='htop'
command -v gotop > /dev/null && alias top='gotop -p $([ "$COLOR_SCHEME" = "light" ] && echo "-c default-dark")'
command -v ytop > /dev/null && alias top='ytop -p $([ "$COLOR_SCHEME" = "light" ] && echo "-c default-dark")'
# themes for light/dark color-schemes inside ~/.config/bashtop; Press ESC to open the menu and change the theme
command -v bashtop > /dev/null && alias top='bashtop'
command -v bpytop > /dev/null && alias top='bpytop'

# --------------------------------- SETTINGS ----------------------------------
setopt AUTO_CD
setopt BEEP
#setopt CORRECT
setopt HIST_BEEP
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt INTERACTIVE_COMMENTS
setopt MAGIC_EQUAL_SUBST
setopt NO_NO_MATCH
setopt NOTIFY
setopt NUMERIC_GLOB_SORT
setopt PROMPT_SUBST
setopt SHARE_HISTORY

HISTFILE="$HOME/.cache/zsh_history"
HIST_STAMPS=mm/dd/yyyy
HISTSIZE=5000
SAVEHIST=5000
ZLE_RPROMPT_INDENT=0
WORDCHARS=${WORDCHARS//\/}
PROMPT_EOL_MARK=

# ZSH completion system
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Key bindings
bindkey '^U' backward-kill-line
bindkey '^[[2~' overwrite-mode
bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3;5~' kill-word
bindkey '^[[5~' beginning-of-buffer-or-history
bindkey '^[[6~' end-of-buffer-or-history
bindkey '^[[Z' undo
bindkey ' ' magic-space

# Prompt
PROMPT=$'%F{%(#.blue.green)}┌──(%B%F{%(#.red.blue)}%n@%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
RPROMPT=$'%(?.. %? %F{red}%Bx%b%F{reset})%(1j. %j %F{yellow}%Bbg %b%F{reset}.)'

# ----------------------------------- MISC -----------------------------------
export VISUAL=vim
export EDITOR=$VISUAL

# enable terminal linewrap
setterm -linewrap on 2> /dev/null

# colorize man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LESSHISTFILE=-

# colorize ls
[ -x /usr/bin/dircolors ] && eval "$(dircolors -b)"

# if this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	precmd() { print -Pnr -- $'\e]0;%n@%m: %~\a' }
	;;
esac

# ------------------------------- ZSH PLUGINS ---------------------------------
# Plugin source helper
_source_plugin() {
	local plugin_name="$1"
	for basedir in /usr/share/zsh/plugins /usr/share
	do
		plugin="$basedir/$plugin_name/$plugin_name.zsh"
		[ -f "$plugin" ] && source "$plugin" && return 0
	done
	echo "\033[33m[ ! ]\033[0m ZSH ${plugin_name#zsh-} not installed"
	return 1
}

# ZSH Autosuggestions
_source_plugin zsh-autosuggestions && ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'

# ZSH Syntax Highlighting
if _source_plugin zsh-syntax-highlighting
then
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
	ZSH_HIGHLIGHT_STYLES[default]=none
	ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[global-alias]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[path]=underline
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[command-substitution]=none
	ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[process-substitution]=none
	ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[assign]=none
	ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
	ZSH_HIGHLIGHT_STYLES[named-fd]=none
	ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
	ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
	ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
fi

# POWERLEVEL
if ! [[ $(tty) = /dev/tty* ]]
then
	if source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme 2> /dev/null
	then
		s=' ' # fix too wide icons
		POWERLEVEL9K_MODE=nerdfont-complete
		POWERLEVEL9K_SHORTEN_STRATEGY=truncate_beginning
		POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
		POWERLEVEL9K_PROMPT_ON_NEWLINE=true
		POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
		POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
		POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='${P9K_CONTENT} $(whoami | grep -v "^root\$")'
		POWERLEVEL9K_OS_ICON_BACKGROUND=red
		POWERLEVEL9K_OS_ICON_FOREGROUND=white
		POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=black
		POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND=red
		POWERLEVEL9K_SSH_BACKGROUND=white
		POWERLEVEL9K_SSH_FOREGROUND=blue
		POWERLEVEL9K_FOLDER_ICON=
		POWERLEVEL9K_DIR_BACKGROUND=blue
		POWERLEVEL9K_DIR_FOREGROUND=black
		POWERLEVEL9K_DIR_WRITABLE_BACKGROUND=black
		POWERLEVEL9K_DIR_WRITABLE_FOREGROUND=red
		POWERLEVEL9K_VCS_CLEAN_FOREGROUND=black
		POWERLEVEL9K_VCS_CLEAN_BACKGROUND=green
		POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=black
		POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=yellow
		POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=white
		POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=black
		POWERLEVEL9K_VCS_UNTRACKED_ICON=●
		POWERLEVEL9K_VCS_UNSTAGED_ICON=±
		POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=↓
		POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=↑
		POWERLEVEL9K_VCS_COMMIT_ICON=$s
		POWERLEVEL9K_STATUS_VERBOSE=false
		POWERLEVEL9K_STATUS_VERBOSE=false
		POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
		POWERLEVEL9K_EXECUTION_TIME_ICON=$s
		POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
		POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=black
		POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=blue
		POWERLEVEL9K_COMMAND_BACKGROUND_JOBS_BACKGROUND=black
		POWERLEVEL9K_COMMAND_BACKGROUND_JOBS_FOREGROUND=cyan
		POWERLEVEL9K_TIME_ICON=
		POWERLEVEL9K_TIME_FORMAT='%D{%I:%M}'
		POWERLEVEL9K_TIME_BACKGROUND=black
		POWERLEVEL9K_TIME_FOREGROUND=white
		POWERLEVEL9K_RAM_ICON=
		POWERLEVEL9K_RAM_FOREGROUND=black
		POWERLEVEL9K_RAM_BACKGROUND=yellow
		POWERLEVEL9K_VI_MODE_FOREGROUND=black
		POWERLEVEL9K_VI_COMMAND_MODE_STRING=NORMAL
		POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND=green
		POWERLEVEL9K_VI_VISUAL_MODE_STRING=VISUAL
		POWERLEVEL9K_VI_MODE_VISUAL_BACKGROUND=blue
		POWERLEVEL9K_VI_OVERWRITE_MODE_STRING=OVERTYPE
		POWERLEVEL9K_VI_MODE_OVERWRITE_BACKGROUND=red
		POWERLEVEL9K_VI_INSERT_MODE_STRING=
		POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
		POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
		POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{blue}╭─'
		POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{blue}╰%f '
		POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator ssh dir dir_writable vcs)
		POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status command_execution_time background_jobs time ram)
		unset s
	else
		echo '\033[33m[ ! ]\033[0m ZSH powerlevel10k not installed'
	fi
else
	clear
	echo
	echo
fi


switch_powerlevel_multiline_prompt(){
	[ $POWERLEVEL9K_PROMPT_ON_NEWLINE = true ] \
		&& POWERLEVEL9K_PROMPT_ON_NEWLINE=false \
		|| POWERLEVEL9K_PROMPT_ON_NEWLINE=true

	zle && zle accept-line
}
zle -N switch_powerlevel_multiline_prompt
bindkey ^P switch_powerlevel_multiline_prompt


# -------------------------------- FUNCTIONS ---------------------------------
lazygit() {
	USAGE="
lazygit [OPTION]... <msg>

    GIT but lazy

    Options:
        --fixup <commit>        runs 'git commit --fixup <commit> [...]'
        --amend                 runs 'git commit --amend --no-edit [...]'
        -f, --force             runs 'git push --force-with-lease [...]'
        -h, --help              show this help text
"
	while [ $# -gt 0 ]
	do
		key="$1"

		case $key in
			--fixup)
				COMMIT="$2"
				shift # past argument
				shift # past value
				;;
			--amend)
				AMEND=true
				shift # past argument
				;;
			-f|--force)
				FORCE=true
				shift # past argument
				;;
			-h|--help)
				echo "$USAGE"
				EXIT=true
				break
				;;
			*)
				MESSAGE="$1"
				shift # past argument
				;;
		esac
	done
	unset key
	if [ -z "$EXIT" ]
	then
		git status .
		git add .
		if [ -n "$AMEND" ]
		then
			git commit --amend --no-edit
		elif [ -n "$COMMIT" ]
		then
			git commit --fixup "$COMMIT"
			GIT_SEQUENCE_EDITOR=: git rebase -i --autosquash "$COMMIT"^
		else
			git commit -m "$MESSAGE"
		fi
		git push origin HEAD $([ -n "$FORCE" ] && echo '--force-with-lease')
	fi
	unset USAGE COMMIT MESSAGE AMEND FORCE
}

glog() {
	setterm -linewrap off 2> /dev/null

	git --no-pager log --all --color=always --graph --abbrev-commit --decorate \
	--format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' \
		| sed -E \
			-e 's/\|(\x1b\[[0-9;]*m)+\\(\x1b\[[0-9;]*m)+ /├\1─╮\2/' \
			-e 's/(\x1b\[[0-9;]+m)\|\x1b\[m\1\/\x1b\[m /\1├─╯\x1b\[m/' \
			-e 's/\|(\x1b\[[0-9;]*m)+\\(\x1b\[[0-9;]*m)+/├\1╮\2/' \
			-e 's/(\x1b\[[0-9;]+m)\|\x1b\[m\1\/\x1b\[m/\1├╯\x1b\[m/' \
			-e 's/╮(\x1b\[[0-9;]*m)+\\/╮\1╰╮/' \
			-e 's/╯(\x1b\[[0-9;]*m)+\//╯\1╭╯/' \
			-e 's/(\||\\)\x1b\[m   (\x1b\[[0-9;]*m)/╰╮\2/' \
			-e 's/(\x1b\[[0-9;]*m)\\/\1╮/g' \
			-e 's/(\x1b\[[0-9;]*m)\//\1╯/g' \
			-e 's/^\*|(\x1b\[m )\*/\1⎬/g' \
			-e 's/(\x1b\[[0-9;]*m)\|/\1│/g' \
		| command less -r +'/[^/]HEAD'

	setterm -linewrap on 2> /dev/null
}

find() {
	if [ $# = 1 ]
	then
		command find . -iname "*$@*"
	else
		command find "$@"
	fi
}

