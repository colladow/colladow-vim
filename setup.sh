#!/usr/bin/env bash

vimPath="$HOME/.vim"
autoloadPath="$vimPath/autoload"
bundlePath="$vimPath/bundle"
colorsPath="$vimPath/colors"

# copy vimrc
cp vimrc ~/.vimrc

# pathogen
mkdir -p "$autoloadPath" "$bundlePath" "$colorsPath" && \
curl -LSso "$autoloadPath/pathogen.vim" https://tpo.pe/pathogen.vim

# command-t
git clone https://github.com/wincent/command-t.git "$bundlePath"
cd "$bundlePath/command-t/ruby/command-t"
ruby extconf.rb
make

# bundles
git clone https://github.com/scrooloose/nerdtree.git "$bundlePath/nerdtree"
git clone https://github.com/ervandew/supertab.git "$bundlePath/supertab"
git clone https://github.com/scrooloose/syntastic.git "$bundlePath/syntastic"
git clone https://github.com/tpope/vim-fugitive.git "$bundlePath/vim-fugitive"
git clone https://github.com/pangloss/vim-javascript.git "$bundlePath/vim-javascript"
git clone https://github.com/mxw/vim-jsx.git "$bundlePath/vim-jsx"
git clone https://github.com/groenewege/vim-less "$bundlePath/vim-less"
git clone https://github.com/tpope/vim-surround.git "$bundlePath/vim-surround"

# colors
curl -o "$colorsPath/molokai.vim" https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
curl -o "$colorsPath/molokai_dark.vim" https://raw.githubusercontent.com/fcevado/molokai_dark/master/colors/molokai_dark.vim 

echo "donezo"
