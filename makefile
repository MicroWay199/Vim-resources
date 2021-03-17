gvim:
	rm -rf ~/.vimrc
	rm -rf ~/.vim/colors
	rm -rf ~/.vim
	mkdir ~/.vim
	ln -s ~/v-github/vim-resources/_vimrc ~/.vimrc
	ln -s ~/v-github/vim-resources/vimfiles/colors ~/.vim/colors
neovim:
	rm -rf ~/.config/nvim/init.vim
	rm -rf ~/.config/nvim/colors
	rm -rf ~/.config/nvim
	mkdir ~/.config/nvim
	ln -s ~/v-github/vim-resources/_vimrc ~/.config/nvim/init.vim
	ln -s ~/v-github/vim-resources/vimfiles/colors ~/.config/nvim/colors
all:gvim neovim
