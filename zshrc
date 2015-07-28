if [ "$TERM" = "xterm" ]
then
	export TERM=xterm-256color
fi

source ~/.profile
source ~/.alias
source ~/.zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<END
  command-not-found
  mosh
  vi-mode

  zsh-users/zsh-completions
  zsh-users/zsh-syntax-highlighting
END

antigen theme ~/.zsh jreese

antigen apply
