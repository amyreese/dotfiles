#
#echo "Initializing Profile..."
export REESEPROFILE="true"
export workspace="${HOME}/workspace"

export DEBFULLNAME="John Reese"
export DEBEMAIL="jreese@leetcode.net"

umask 022

stty erase 

export LANG=en_US.UTF-8
export EDITOR=vim
export PAGER=less

export CVS_RSH="ssh"
#export CDPATH=".:${HOME}:$workspace"

# Local OPT binaries
# Used before any system binaries
if [ -d "${HOME}/opt/bin/" ]; then
	export PATH="${HOME}/opt/bin:${PATH}"
fi

# Local binaries
# Used only if system binaries not available
if [ -d "${HOME}/bin/" ]; then
	export PATH="${PATH}:${HOME}/bin"
fi

# Local manpages
if [ -d "${HOME}/man/" ]; then
	export MANPATH=":${HOME}/man"
fi

# Machine-specific profile
if [ -f ${HOME}/.profile_local ]; then
	. ${HOME}/.profile_local
fi

