setopt PROMPT_SUBST

autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz vcs_info

add-zsh-hook precmd vcs_info
add-zsh-hook precmd _amethyst_precmd_hook

function _amethyst_precmd_hook() {
    local exit_code=$?
    if (( $exit_code != 0 )); then
        echo "$fg[red]> [$exit_code]${reset_color}"
    fi
    echo
}

zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{yellow}+%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}+%f'
zstyle ':vcs_info:*' formats '%F{yellow}%b%f%c%u '

PS1='%(!.%F{red}.%F{green})%n%F{green}@%m%f %~ $vcs_info_msg_0_%{$fg_bold[red]%}»%{${reset_color}%} '

