setopt auto_list
setopt auto_menu
setopt no_beep
setopt correct

__load_oneof() {
  for lib in $@; do
    [[ -f "$lib" ]] && source "$lib" && break;
  done

}

# history
setopt hist_ignore_all_dups
: ${SAVEHIST:=100000}

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
PROMPT="$PROMPT\$ "

# load iterm2 integration
ITERM2_INTEGRATION=${HOME}/.iterm2_shell_integration.zsh
if [[ -e "${ITERM2_INTEGRATION}" ]]; then
  source "${ITERM2_INTEGRATION}"
fi

__load_oneof \
  /usr/share/doc/fzf/examples/key-bindings.zsh \
  /opt/homebrew/opt/fzf/shell/key-bindings.zsh

source $DOTFILES_PATH/zsh/plugin.zsh

ZSHRC_LOCAL=$HOME/.zshrc.local
if [[ -e $ZSHRC_LOCAL ]]; then
    source $ZSHRC_LOCAL
fi

# Compile zshrc
if [ $HOME/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile $HOME/.zshrc
fi

autoload -U compinit && compinit
