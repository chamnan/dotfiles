#!/bin/bash

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh

git clone https://github.com/chamnan/dotfiles.git ~/.dotfiles

ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Font Installation
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf 
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
cp ~/.dotfiles/fonts/Ubuntu\ Mono\ derivative\ Powerline.ttf ~/.fonts
fc-cache -vf ~/.fonts

# Change Termilal Font to Ubuntu Mono derivative Powerline, size 13
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ubuntu Mono derivative Powerline 13"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_system_font --type bool '0'
gconftool-2 --set /apps/gnome-terminal/profiles/Default/scrollback_unlimited --type bool '1'
