gvim:
	rm -rf ~/.vimrc
	rm -rf ~/.vim/colors
	ln -s ~/v-github/vim-resources/_vimrc ~/.vimrc
	ln -s ~/v-github/vim-resources/vimfiles/colors ~/.vim/colors
neovim:
	rm -rf ~/.config/nvim/init.vim
	rm -rf ~/.config/nvim/colors
	ln -s ~/v-github/vim-resources/_vimrc ~/.config/nvim/init.vim
	ln -s ~/v-github/vim-resources/vimfiles/colors ~/.config/nvim/colors
all:gvim neovim
