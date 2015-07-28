umask 022

export LANG=en_US.UTF-8
export EDITOR=vim
export PAGER=less

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export PYTHONSTARTUP="$HOME/.pythonrc"
export workspace="${HOME}/workspace"

echo $PATH | grep -q ${HOME}/opt/bin || export PATH="${HOME}/opt/bin:${PATH}:${HOME}/bin"

if [ -f ${HOME}/.profile_local ]; then
	. ${HOME}/.profile_local
fi

