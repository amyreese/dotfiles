# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="jreese"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"
#
export COMPLETION_WAITING_DOTS="true"

if [ "$TERM" = "xterm" ]
then
	export TERM=xterm-256color
fi

plugins=(command-not-found history mosh pip sudo themes vi-mode which zsh-completions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
