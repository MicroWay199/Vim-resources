gvim:
	rm -rf ~/.vimrc
	rm -rf ~/.vim/colors
	rm -rf ~/.vim
	mkdir ~/.vim
	ln -s ~/github/vim-resources/_vimrc ~/.vimrc
	ln -s ~/github/vim-resources/vimfiles/colors ~/.vim/colors
neovim:
	rm -rf ~/.config/nvim/init.vim
	rm -rf ~/.config/nvim/colors
	rm -rf ~/.config/nvim
	mkdir ~/.config/nvim
	cp ~/github/vim-resources/_vimrc ~/.config/nvim/init.vim
	cp ~/github/vim-resources/vimfiles/* ~/.config/nvim/ -rf
all:gvim neovim
