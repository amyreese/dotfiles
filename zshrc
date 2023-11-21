if [ "$TERM" = "xterm" ]
then
	export TERM=xterm-256color
fi

if [ -f ~/.zsh_local_pre ]
then
    source ~/.zsh_local_pre
fi

source ~/.profile
source ~/.zsh/antigen.zsh

antigen use oh-my-zsh
antigen bundles <<END
  command-not-found
  mosh

  zsh-users/zsh-completions
  zsh-users/zsh-syntax-highlighting

  amyreese/zsh-opt-path
  amyreese/zsh-pyenv
  amyreese/zsh-titles
  amyreese/zsh-which
END
antigen theme ~/.zsh amethyst
antigen apply

push_path ~/bin
push_path ~/.cargo/bin
push_path ~/.local/bin

source ~/.alias

if [ -f ~/.zsh_local ]
then
    source ~/.zsh_local
fi
