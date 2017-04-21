if [ ! `which brew` ]; then
  echo "Installing Homebrew ... "
  /usr/bin/ruby "$(curl -f1sSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Installing Homebrew Packages ..."
  if [ ./list ]; then
    file=./list 
    while read line; do
      brew install $line
    done < $file
  fi
fi

if [ ! ~/.tmux/plugins/tpm ]; then
  echo "Cloning Tmux Plugin Manager... "
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
echo "Downloading solarized ... "
git clone https://github.com/tomislav/osx-terminal.app-colors-solarized ~/Desktop/solarized

echo "Make symbolic link ... "
dotfiles=(.vimrc .zshrc .tmux.conf .vimperatorrc)
for file in $dotfiles; do
  echo $file
  ln -sf "$HOME/dotfiles/$file" "$HOME/$file"
done


echo "Copy pached font ... "
cp ~/dotfiles/myDroidSansMonoForPowerline.ttf ~/Library/Fonts

echo "Change default shell to zsh ... "
if [ ! `grep /usr/local/bin/zsh /etc/shells` ]; then
  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
fi
sudo chsh -s /usr/local/bin/zsh


echo "Done!"
echo "--------------------------------------------------"
echo "Please change Terminal's font to myDroidSansMonoForPowerline."
echo "Please import Solarized into Terminal.app preferences. from Desktop"
