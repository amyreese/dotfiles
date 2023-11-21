### shared shell environment ###

source ~/.profile
source ~/.alias

### zsh options ###

setopt AUTO_MENU
setopt AUTO_NAME_DIRS
setopt AUTO_PUSHD
setopt CORRECT
setopt DVORAK
setopt GLOB_COMPLETE
setopt GLOB_STAR_SHORT

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY  # INC_APPEND_HISTORY
export SAVEHIST=100000
export HISTSIZE=100000
export HISTFILE=~/.zsh_history

export WORDCHARS=''  # break ^W by / instead of spaces

### key bindings ###

autoload -U compinit; compinit
autoload -U up-line-or-beginning-search; zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search; zle -N down-line-or-beginning-search
autoload -U edit-command-line; zle -N edit-command-line

bindkey -e
bindkey "$key[Up]" up-line-or-beginning-search
bindkey "$key[Down]" down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey '\ec' edit-command-line
bindkey '\ee' edit-command-line

### minimal plugin manager ###

ZSH_PLUGIN_DIR=~/.zsh_plugins
function plugin() {
  # download and source a zsh plugin from github
  local plugin_name="${1:t}"
  local plugin_url="https://github.com/${1}"
  local plugin_path="${ZSH_PLUGIN_DIR}/$1"

  if [ ! -d "$plugin_path" ]; then
    echo "Installing $1 ..."
    git clone --depth 1 "${plugin_url}" "${plugin_path}" >/dev/null 2>&1 || { echo "Error: cloning ${plugin_url} failed"; return 1 }
  fi
  local -a plugin_files=(
    ${plugin_path}/${plugin_name}{.plugin,}.zsh{-theme,}(N)
    ${plugin_path}/${plugin_name#zsh-}{.plugin,}.zsh{-theme,}(N)
    ${plugin_path}/*{.plugin,}.zsh{-theme,}(N)
  )
  (( $#plugin_files )) && source "${plugin_files[1]}" || { echo "Error: ${plugin_name} plugin script not found"; return 2 }
}
function plugin-update() {
  local project name
  for project in $(ls ${ZSH_PLUGIN_DIR}); do
    for name in $(ls ${ZSH_PLUGIN_DIR}/${project}); do
      local plugin_path="${ZSH_PLUGIN_DIR}/${project}/${name}"
      echo "Updating ${plugin_path#$ZSH_PLUGIN_DIR/} ..."
      git -C "${plugin_path}" pull >/dev/null 2>&1 || echo "Error: updating ${plugin_path} failed"
    done
  done
}

### install plugins ###

plugin "zsh-users/zsh-completions"
plugin "zsh-users/zsh-syntax-highlighting"

plugin "amyreese/zsh-amethyst"
plugin "amyreese/zsh-opt-path"
plugin "amyreese/zsh-pyenv"
plugin "amyreese/zsh-take"
plugin "amyreese/zsh-titles"
plugin "amyreese/zsh-which"

### postscript ###

push_path ~/bin
push_path ~/.cargo/bin
push_path ~/.local/bin

if [ -f ~/.zsh_local ]
then
    source ~/.zsh_local
fi
