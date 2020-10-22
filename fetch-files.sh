#!/bin/bash

mkdir -p .config/nvim/
mkdir -p .config/Code\ -\ OSS/User/
cp -r ~/bin .
cp -r ~/.config/nvim/* .config/nvim/
cp -r ~/.config/Code\ -\ OSS/User/settings.json .config/Code\ -\ OSS/User/
cp ~/.bashrc .
cp ~/.gitconfig .

