all: brew dotfiles pip


brew:
	@brew bundle install


dotfiles:
	@echo "DOTFILES"
