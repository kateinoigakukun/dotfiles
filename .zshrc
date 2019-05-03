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

if [ ! -d $ZPLUG_HOME ]; then
    git clone https://github.com/b4b4r07/zplug.git $ZPLUG_HOME
fi
export ZPLUG_LOADFILE=$HOME/dotfiles/zsh/zplug.zsh
source $HOME/.zplug/init.zsh

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

if [[ -f $HOME/.zshrc.local ]]; then
    source $HOME/.zshrc.local
fi
