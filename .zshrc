autoload -U compinit && compinit
setopt auto_list
setopt auto_menu
setopt no_beep
setopt correct


source $DOTFILE_PATH/zsh/plugin.zsh

ZSHRC_LOCAL=$HOME/.zshrc.local
if [[ -e $ZSHRC_LOCAL ]]; then
    source $ZSHRC_LOCAL
fi

# Compile zshrc
if [ $HOME/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile $HOME/.zshrc
fi
