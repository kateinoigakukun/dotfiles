# use emacs keybind
bindkey -e
# case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

ITERM2_INTEGRATION=${HOME}/.iterm2_shell_integration.zsh
if [[ -e "${ITERM2_INTEGRATION}" ]]; then
  source "${ITERM2_INTEGRATION}"
fi

function __ghq_cd_repository() {
    local repo=$(ghq list | fzy)
    cd $(ghq root)/$repo
}

alias sd=__ghq_cd_repository
