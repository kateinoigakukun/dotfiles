setopt AUTO_LIST
setopt AUTO_MENU
setopt NO_BEEP
setopt CORRECT
setopt PRINT_EXIT_VALUE

__load_oneof() {
  for lib in $@; do
    [[ -f "$lib" ]] && source "$lib" && break;
  done
}

# history
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
: ${HISTFILE:="$HOME/.zsh_history"}
[[ "$SAVEHIST" = 0 ]] && SAVEHIST=100000

# use emacs keybind
bindkey -e
# case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# load git-prompt.sh
__load_oneof \
  /etc/bash_completion.d/git-prompt \
  /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

# allow to expand __git_ps1
setopt PROMPT_SUBST
# see the prompt format in zshmisc(1)
PROMPT=$'%{\e[1;34m%}%1~%{\e[m%}'
if type __git_ps1 > /dev/null 2>&1; then
  PROMPT="$PROMPT\$(__git_ps1)"
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWUPSTREAM=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  GIT_PS1_SHOWSTASHSTATE=1
fi

RED_ON_NONZERO_EXIT=$'%(?..%{\e[1;31m%})$%{\e[m%}'
PROMPT="$PROMPT$RED_ON_NONZERO_EXIT "

# load iterm2 integration
ITERM2_INTEGRATION=${HOME}/.iterm2_shell_integration.zsh
if [[ -e "${ITERM2_INTEGRATION}" ]]; then
  source "${ITERM2_INTEGRATION}"
fi

__load_oneof \
  /usr/share/doc/fzf/examples/key-bindings.zsh \
  /opt/homebrew/opt/fzf/shell/key-bindings.zsh \
  /usr/local/opt/fzf/shell/key-bindings.zsh

ZSH_PLUGINS="$DOTFILES_PATH/zsh/plugin.zsh"
if [[ -e "$ZSH_PLUGINS" ]]; then
  source $ZSH_PLUGINS
fi

ZSHRC_LOCAL="$HOME/.zshrc.local"
if [[ -e $ZSHRC_LOCAL ]]; then
  source $ZSHRC_LOCAL
fi

# Compile zshrc
if [ $HOME/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile $HOME/.zshrc
fi

autoload -U compinit && compinit
