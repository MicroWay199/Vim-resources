gvim:
	rm -rf ~/.vimrc
	rm -rf ~/.vim/colors
	ln -s /home/micro/v-github/vim-resources/trunk/_vimrc ~/.vimrc
	ln -s /home/micro/v-github/vim-resources/trunk/vimfiles/colors ~/.vim/colors
neovim:
	rm -rf ~/.config/nvim/init.vim
	rm -rf ~/.config/nvim/colors
	ln -s /home/micro/v-github/vim-resources/trunk/_vimrc ~/.config/nvim/init.vim
	ln -s /home/micro/v-github/vim-resources/trunk/vimfiles/colors ~/.config/nvim/colors
all:gvim neovim
