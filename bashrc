# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#echo "Initializing Bash..."
REESEBASHRC="true"

# Initialize profile if necessary
if [ -z "$REESEPROFILE" ]; then
	. ${HOME}/.profile
fi

# See if I can use ZShell
#ZSH=`which zsh`
#if [ -n "$ZSH" ]; then
#	exec zsh
#fi

# Include alias file
if [ -f ${HOME}/.alias ]; then
	. ${HOME}/.alias
fi
if [ -f ${HOME}/.alias_local ]; then
	. ${HOME}/.alias_local
fi

# Bash prompt
PS1='\u@\h:\w\$ '
PS2='> '
case $TERM in
	xterm)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}[${PWD/$HOME/~}]\007"'
	;;
	*)
	;;
esac

# Bash history options
HISTCONTROL=erasedups
HISTIGNORE="cd*:dc*:exit:fg"

# Bash command options
shopt -s cdable_vars cdspell checkwinsize cmdhist dotglob histappend 
shopt -s no_empty_cmd_completion
shopt -u mailwarn

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# System Specific bashrc
if [ -f ${HOME}/.bash_local ]; then
    . ${HOME}/.bash_local
fi

