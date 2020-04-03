autoload -U compinit && compinit
setopt auto_list
setopt auto_menu
setopt no_beep
setopt correct

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

ZSHRC_LOCAL=$HOME/.zshrc.local
if [[ -e $ZSHRC_LOCAL ]]; then
    source $ZSHRC_LOCAL
fi

# Compile zshrc
if [ $HOME/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile $HOME/.zshrc
fi

if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
