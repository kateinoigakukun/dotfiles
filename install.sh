if [ ! `which brew` ]; then
  echo "Installing Homebrew ..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install vim

if [ ! `which tmux` ]; then
  brew install tmux
fi
if [ ! -e ~/.tmux/plugins/tpm ]; then
  echo "Installing Tmux Plugin Manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
git clone https://github.com/tomislav/osx-terminal.app-colors-solarized ~/Deskto/solarized

ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/_zshrc ~/.zshrc
ln -s ~/dotfiles/_tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/_gvimrc ~/.gvimrc
cp ~/.tmux/plugins/tmux-powerline/myDroidSansMonoForPowerline.ttf ~/Library/Fonts

chsh -s /usr/local/bin/zsh

echo "Please change Terminal font to myDroidSansMonoForPowerline."
echo "Please import Solarized  into Terminal.app preferences. from Desktop"
