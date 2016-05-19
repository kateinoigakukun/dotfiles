if [ ! `which brew` ]; then
  echo "Installing Homebrew ..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo "Installing Vim"
brew install vim

if [ ! `which tmux` ]; then
  echo "Installing Tmux"
  brew install tmux
fi
if [ ! -e ~/.tmux/plugins/tpm ]; then
  echo "Installing Tmux Plugin Manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
echo "Downloading solarized"
git clone https://github.com/tomislav/osx-terminal.app-colors-solarized ~/Deskto/solarized
echo "Make symbolic link"
ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/_zshrc ~/.zshrc
ln -s ~/dotfiles/_tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/_gvimrc ~/.gvimrc
echo "Copy pached font"
cp ~/dotfiles/myDroidSansMonoForPowerline.ttf ~/Library/Fonts
echo "Change default shell to zsh"
chsh -s /usr/local/bin/zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
##自分のリポに追加してそこから読み込む
echo "Done!"
echo "--------------------------------------------------"
echo "Please change Terminal font to myDroidSansMonoForPowerline."
echo "Please import Solarized  into Terminal.app preferences. from Desktop"
