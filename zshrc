if [ "$TERM" = "xterm" ]
then
	export TERM=xterm-256color
fi

test -f ~/.profile && source ~/.profile
test -f ~/.alias && source ~/.alias
