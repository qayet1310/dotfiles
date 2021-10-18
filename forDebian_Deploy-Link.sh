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
sudo apt-get update

echo 
echo Running upgrade.
sudo apt-get upgrade

echo 
echo Installing packages.
sudo apt install -y \
build-essential \
libffi-dev \
libssl-dev \
zlib1g-dev \
liblzma-dev \
libbz2-dev \
libreadline-dev \
libsqlite3-dev \
libopencv-dev \
tk-dev \
git \
vim

git config --global user.email "dirkkuyt18mf@gmail.com"
git config --global user.name "qayet1310"

echo Installing pyenv.
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

cd ~/.pynev
git checkout v2.0.3

# .bashrcの更新
echo Updating .bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc

# virtualenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
test -r ~/.bashrc && . ~/.bashrc
source ~/.bash_profile
echo 
echo Installing the colorscheme: vim-atom-dark
mkdir ~/.vim
mkdir ~/.vim/colors
git clone https://github.com/gosukiwi/vim-atom-dark 
cp ./vim-atom-dark/colors/atom-dark-256.vim ~/.vim/colors

. ~/.bashrc
cd $Cpath


for f in .??*
do
    ln -sf $Cpath/$f ~/$f
    echo 'created link ['$f']'
done
