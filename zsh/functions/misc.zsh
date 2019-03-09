# use emacs keybind
bindkey -e
# case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

ITERM2_INTEGRATION=${HOME}/.iterm2_shell_integration.zsh
if [[ -e "${ITERM2_INTEGRATION}" ]]; then
  source "${HOME}/.iterm2_shell_integration.zsh"
fi
