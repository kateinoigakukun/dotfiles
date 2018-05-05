BREW_INSTALLED := $(shell brew --version 2> /dev/null)

install-brew:
	@echo "\033[32mInstalling Homebrew...\033[0m"
ifndef BREW_INSTALLED
	/usr/bin/ruby "$$(curl -f1sSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
else
	@echo "\033[33mHomebrew is already installed.\033[0m"
endif

install-brew-package:
	@echo "\033[32mInstalling Homebrew Packages...\033[0m"
	brew bundle

install-font:
	@echo "\033[32mInstalling Powerline fonts.\033[0m"
	@if [ ! -e ./fonts ]; then \
    mkdir ./fonts;\
  fi
	@cd fonts && { \
    curl -LO "https://github.com/powerline/fonts/raw/master/DroidSansMono/Droid%20Sans%20Mono%20for%20Powerline.otf"; \
    cd - ;\
  }
	@cp ./fonts/* ~/Library/Fonts

change-shell:
	@echo "\033[32mChange default shell to zsh...\033[0m"
	@if [ ! `grep /usr/local/bin/zsh /etc/shells` ]; then \
			sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"; \
	fi
	@chsh -s /usr/local/bin/zsh

link-dotfiles:
	@echo "\033[32mMake symbolic links...\033[0m"
	@dotfiles=(.vimrc .zshrc .zshenv .tmux.conf .vimperatorrc); \
	for file in $${dotfiles[@]}; do \
		ln -snfv "$$HOME/dotfiles/$$file" "$$HOME/$$file"; \
	done

deploy: install-brew install-brew-package install-font change-shell link-dotfiles
