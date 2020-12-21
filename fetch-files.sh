#!/bin/bash

# set path to script location
cd `dirname $0`

cp -v ~/.vimrc .
mkdir -p .vim/
cp -v ~/.vim/c_header.txt .vim/
cp -v ~/.bashrc .
cp -v ~/.gitconfig .

