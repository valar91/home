ln -s ./home/_bashrc ~/.bashrc
ln -s ./home/_vimrc ~/.vimrc
ln -s ./home/gitconfig/_gitconfig-jj ~/.gitconfig
mkdir ~/.ssh
cp ~/home/_ssh/* ~/.ssh/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
