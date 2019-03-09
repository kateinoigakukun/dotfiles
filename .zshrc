autoload -U compinit && compinit
setopt auto_list
setopt auto_menu
setopt auto_cd
setopt auto_pushd
setopt hist_ignore_dups
setopt extended_history
setopt share_history
setopt no_beep
setopt correct
export HISTSIZE=1000
export SAVEHIST=100000


# env
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
if which nodeenv > /dev/null; then eval "$(nodenv init -)"; fi

if [ ! -d $ZPLUG_HOME ]; then
    git clone https://github.com/b4b4r07/zplug.git $ZPLUG_HOME
fi
source ~/.zplug/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'mafredri/zsh-async'
zplug 'sindresorhus/pure', use:pure.zsh
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-completions"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

