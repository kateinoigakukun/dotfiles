autoload -U compinit && compinit
setopt auto_list
setopt auto_menu
setopt no_beep
setopt correct

# history
setopt hist_ignore_all_dups
export savehist=100000

# use emacs keybind
bindkey -e
# case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

ITERM2_INTEGRATION=${HOME}/.iterm2_shell_integration.zsh
if [[ -e "${ITERM2_INTEGRATION}" ]]; then
  source "${ITERM2_INTEGRATION}"
fi

source $DOTFILE_PATH/zsh/plugin.zsh

ZSHRC_LOCAL=$HOME/.zshrc.local
if [[ -e $ZSHRC_LOCAL ]]; then
    source $ZSHRC_LOCAL
fi

# Compile zshrc
if [ $HOME/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile $HOME/.zshrc
fi
