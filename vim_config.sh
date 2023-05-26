#folder creation

mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged
cd ~/
touch ~/.vimrc

#file configuration

echo "set nocompatible" >> .vimrc
echo "filetype on" >> .vimrc
echo "filetype plugin on" >> .vimrc
echo "filetype indent on" >> .vimrc
echo "syntax on" >> .vimrc
echo "set number" >> .vimrc
echo "set shiftwidth=4" >> .vimrc
echo "set tabstop=4" >> .vimrc
echo "set expandtab" >> .vimrc
echo "set nowrap" >> .vimrc
echo "set showcmd" >> .vimrc
echo "set showmode" >> .vimrc
echo "set hlsearch" >> .vimrc

echo "" >> .vimrc
echo "call plug#begin('~/.vim/plugged') " >> .vimrc
echo "" >> .vimrc
echo "Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }" >> .vimrc
echo "" >> .vimrc
echo "call plug#end()" >> .vimrc

echo "let g:prettier#autoformat = 1" >> .vimrc
echo "let g:prettier#autoformat_require_pragma = 0" >> .vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


