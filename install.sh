setup_brew() {
  if [ ! `which brew` ]; then
    echo "Installing Homebrew ... "
    /usr/bin/ruby "$(curl -f1sSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  echo "Installing Homebrew Packages ..."
  if [ ! 'which brew-file' ]; then
    brew install rcmdnk/file/brew-file
  fi
  brew file install -f Brewfile
}

font() {
  wget "https://github.com/powerline/fonts/raw/master/DroidSansMono/Droid%20Sans%20Mono%20for%20Powerline.otf"
  mv "~/dotfiles/Droid Sans Mono for Powerline.otf" ~/Library/Fonts
}

shell() {
  echo "Change default shell to zsh ... "
  if [ ! `grep /usr/local/bin/zsh /etc/shells` ]; then
    sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
  fi
  sudo chsh -s /usr/local/bin/zsh
}

setup_brew
font
shell

echo "Done!"
