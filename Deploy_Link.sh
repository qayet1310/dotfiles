#!/bin/bash

echo "
   ___           __             ___       __    _____ __
  / _ |___ ___  / /__  __ __   / _ |___  / /_  / __(_) /__ ___
 / // / -_) _ |/ / _ |/ // /  / // / _ |/ __/ / _// / / -_|_-<  _
/____/l__/ .__/_/|___/|_, /  /____/|___/|__/ /_/ /_/_/|__/___/ (_)
        /_/          /___/
"

Cpath=`pwd`

echo Running Update.
sudo yum update
echo 
echo Running upgrade.
sudo yum upgrade
echo 
echo Installing the git.
sudo yum install git
echo 
echo Installing the vim.
sudo yum install vim

echo 
echo Installing the Vundle.
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo
echo Installing the colorscheme: vim-atom-dark
mkdir ~/.vim
mkdir ~/.vim/colors
git clone https://github.com/gosukiwi/vim-atom-dark 
cp ./vim-atom-dark/colors/atom-dark-256.vim ~/.vim/colors


cd $Cpath


for f in .??*
do
    ln -sf $Cpath/$f ~/$f
    echo 'created link ['$f']'
done
