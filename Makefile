BREW_INSTALLED := $(shell brew --version 2> /dev/null)

install-brew:
	@echo "\033[32mInstalling Homebrew...\033[0m"
ifndef BREW_INSTALLED
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	@echo "\033[33mHomebrew is already installed.\033[0m"
endif

install-brew-package:
	@echo "\033[32mInstalling Homebrew Packages...\033[0m"
	brew bundle --file=./Brewfile

install-cask:
	@echo "\033[32mInstalling Homebrew Cask Packages...\033[0m"
	brew bundle --file=./Brewfile-cask

install-neovim:
	brew install neovim
	pip install neovim

change-shell:
	@echo "\033[32mChange default shell to zsh...\033[0m"
	@if [ ! `grep /usr/local/bin/zsh /etc/shells` ]; then \
			sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"; \
	fi
	@chsh -s /usr/local/bin/zsh

link-dotfiles:
	./scripts/link-dotfiles

link-config:
	@echo "\033[32mMake config symlinks...\033[0m"
	@configs=$$(ls ./config); \
	for config in $${configs[@]}; do \
		ln -snfv "$$HOME/dotfiles/config/$$config" "$$HOME/.config/$$config"; \
	done

deploy: install-brew install-brew-package install-neovim change-shell link-dotfiles link-config
