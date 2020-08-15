if [ "$TERM" = "xterm" ]
then
	export TERM=xterm-256color
fi

if [ -f ~/.zsh_local_pre ]
then
    source ~/.zsh_local_pre
fi

source ~/.profile
source ~/.alias
source ~/.zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<END
  command-not-found
  mosh

  zsh-users/zsh-completions
  zsh-users/zsh-syntax-highlighting

  jreese/zsh-opt-path
  jreese/zsh-pyenv
  jreese/zsh-titles
  jreese/zsh-which

  softmoth/zsh-vim-mode@abecc2be4744a6f486136dec611a61569d34fab0
END

antigen theme ~/.zsh jreese

antigen apply

if [ -f ~/.zsh_local ]
then
    source ~/.zsh_local
fi
