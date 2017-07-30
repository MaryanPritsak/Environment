#!/bin/bash

set -e
set -x

#
# Update package list
#

sudo apt-get update

#
# Basic packages
#

sudo apt-get install -y \
    wget \
    python-pip

#
# Git
#

sudo apt-get install -y git

git config --global alias.br 'branch'
git config --global alias.ci 'commit'
git config --global alias.co 'checkout'
git config --global alias.gr 'grep -n'
git config --global alias.st 'status'
git config --global alias.sti 'status -uno --ignore-submodules'
git config --global alias.subdate 'submodule update --init --recursive'

#
# Vim
#

sudo apt-get install -y vim vim-nox-py2

# Install Vundle for vim plugins

[ -d ~/.vim/bundle/Vundle.vim ] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# monokai color scheme

mkdir -p ~/.vim/colors/
wget -O ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
pip install --user powerline-status

cat <<EOF > ~/.vimrc
set shiftwidth=4
set smartindent
set cindent
set hlsearch
set incsearch
set expandtab
set number
set ignorecase
set smartcase
set cursorline

syntax enable

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" monokai section
colorscheme monokai

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set laststatus=2
" monokai section
EOF
