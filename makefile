gvim:
	rm -rf ~/.vimrc
	ln -s /home/micro/V-github/vim-resources/trunk/_vimrc ~/.vimrc
	ln -s /home/micro/V-github/vim-resources/trunk/vimfiles/colors ~/.vim/colors
neovim:
	rm -rf ~/.config/nvim/init.vim
	ln -s /home/micro/V-github/vim-resources/trunk/_vimrc ~/.config/nvim/init.vim
	ln -s /home/micro/V-github/vim-resources/trunk/vimfiles/colors ~/.config/nvim/colors
all:gvim neovim
