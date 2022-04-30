setopt auto_list
setopt auto_menu
setopt no_beep
setopt correct

# history
setopt hist_ignore_all_dups
SAVEHIST=100000

# use emacs keybind
bindkey -e
# case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

for git_prompt_sh in \
  /etc/bash_completion.d/git-prompt \
  /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh;
do
  [[ -f "$git_prompt_sh" ]] && source "$git_prompt_sh" && break;
done

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

ITERM2_INTEGRATION=${HOME}/.iterm2_shell_integration.zsh
if [[ -e "${ITERM2_INTEGRATION}" ]]; then
  source "${ITERM2_INTEGRATION}"
fi

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
