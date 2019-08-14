#!/bin/bash

# запуск строго как ./linux.sh или bash linux.sh
# из каталога ..../oh-my-vim/ (git clone)

# Внимание!!! старые данные ~/.vim/ и .vim* будут удалены

echo "----------------------------"
echo ".vimrc for Linux by Koljasha"
echo "----------------------------"
echo


#проверка YCM
ycmpl=$HOME"/.vim/plugged/YouCompleteMe"
if [[ -e $ycmpl ]]
then
	cp -r $ycmpl ./
	echo "*** Old YCM copied"
	echo 
fi

# удаление старого окружения
rm -rf ~/.vim/ ~/.vim*
echo "*** Old environment removed"
echo

# установка Vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo
echo "*** Vim-plug installed"
echo 

# установка YCM (если был)
ycmpl=./YouCompleteMe
if [[ -e $ycmpl ]]
then
	mkdir -p ~/.vim/plugged
	cp -r $ycmpl ~/.vim/plugged/
	echo "*** New YCM copied"
	echo 
fi

# копирование .vimrc
cp vimrc ~/.vimrc
echo "*** .vimrc copied"
echo 

# копирование .ycm_extra_conf.py
mv .ycm_extra_conf.py ~/.vim/
echo "*** .ycm_extra_conf.py copied"
echo

# копирование .tern-config
mv .tern-config ~/
echo "*** .tern-config copied"
echo

# копирование .ctags
mv .ctags ~/
echo "*** .ctags copied"
echo 

# библиотеки Xkbswitch в "~/.local/libxkbswitch/"
# Make sure you have package libxkbfile-dev installed
file=$HOME"/.local/libxkbswitch/libxkbswitch.so"
if [[ ! -e $file ]]
then
    mkdir ~/.local/libxkbswitch 2>/dev/null
	git clone https://github.com/ierton/xkb-switch
	cd xkb-switch/
	mkdir build && cd build
	cmake ..
	make
	cp libxkbswitch.so ~/.local/libxkbswitch/
	cd ../../
	echo "*** Libraries for Vim-xkbswitch installed"
	echo
else
    echo "*** Libraries for Vim-xkbswitch already installed"
	echo
fi

# установка PowerLine
bash powerline.sh

# установка LiveDown
# livedown=$(npm -g ls | grep livedown | wc -l)
# if [ $livedown != "1"  ]
# then
# 	npm install -g livedown
# fi
# echo "*** LiveDown installed"
# echo

# копирование скрипта вывода в $HOME
cp echo_linux.sh ~/

# удаление всех каталогов установки (git clone)
cd ../
rm -rf oh-my-vim/
cd ~/
echo "*** Installation directories removed"
echo

# словарь проверки орфографии - (только RU UTF-8)
mkdir ~/.vim/spell
cd ~/.vim/spell/
curl -O http://ftp.vim.org/vim/runtime/spell/ru.utf-8.sug
curl -O http://ftp.vim.org/vim/runtime/spell/ru.utf-8.spl
cd ~/
echo
echo "*** Dictionary installed"
echo

# конец установки окружения
echo
echo

# запуск скрипта вывода информации
cd ~
bash echo_linux.sh
rm echo_linux.sh

