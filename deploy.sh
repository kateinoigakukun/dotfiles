link() {
  echo "Make symbolic link ... "
  dotfiles=(.vimrc .zshrc .zshenv .tmux.conf .vimperatorrc)
  for file in ${dotfiles[@]}; do
    echo $file
    ln -snfv "$HOME/dotfiles/$file" "$HOME/$file"
  done
}

link
