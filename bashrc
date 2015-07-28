test -f /etc/bash_completion && source /etc/bash_completion
test -f ${HOME}/.profile && source ${HOME}/.profile
test -f ${HOME}/.alias && source ${HOME}/.alias

PS1='\u@\h:\w\$ '
PS2='> '
case $TERM in
	xterm|xterm-256color)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}[${PWD/$HOME/~}]\007"'
	;;
	*)
	;;
esac

HISTCONTROL=erasedups
HISTIGNORE="cd*:dc*:exit:fg"

shopt -s cdable_vars cdspell checkwinsize cmdhist dotglob histappend 
shopt -s no_empty_cmd_completion
shopt -u mailwarn

