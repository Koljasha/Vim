#!/bin/bash

# запуск строго как ./windows.sh или bash windows.sh
# из каталога ..../Vim/ или ..../vim/ (git clone)
# через Git Bash от имени Администратора

# Внимание!!! старые данные ~/vimfiles/ и _vim* будут удалены

echo "------------------------------"
echo "_vimrc for Windows by Koljasha"
echo "------------------------------"
echo

# удаление старого окружения
rm -rf ~/vimfiles/ ~/_vim*
echo "*** Old environment removed"
echo

# установка Vim-plug
curl -fLo ~/vimfiles/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo
echo "*** Vim-plug installed"
echo

# копирование _vimrc
cp vimrc ~/_vimrc
echo "*** _vimrc copied"
echo

# кодировка UTF-8 для gVim
cat /c/Program\ Files\ \(x86\)/Vim/vim80/lang/menu_ru_ru.vim \
	| sed -e '23d' \
	> /c/Program\ Files\ \(x86\)/Vim/vim80/lang/menu_ru_ru.utf-8.vim
echo "*** UTF-8 for gVim patched"
echo

# eVim - "простой" режим
cp /c/Program\ Files\ \(x86\)/Vim/vim80/gvim.exe /c/Program\ Files\ \(x86\)/Vim/vim80/evim.exe
echo "*** eVim installed"
echo

# библиотеки Xkbswitch в "/c/Program Files (x86)/vim/libxkbswitch"
dir="/c/Program Files (x86)/vim/libxkbswitch/"
if [[ ! -e $dir ]]
then
    mkdir "/c/Program Files (x86)/vim/libxkbswitch"
	git clone https://github.com/DeXP/xkb-switch-win
	cp xkb-switch-win/bin/* /c/Program\ Files\ \(x86\)/Vim/libxkbswitch/
	echo "*** Libraries for Vim-xkbswitch installed"
	echo
else
    echo "*** Libraries for Vim-xkbswitch already installed"
	echo
fi

# удаление всех каталогов установки (git clone)
cd ../
rm -rf Vim/
cd ~/
echo "*** Installation directories removed"
echo

# словарь проверки орфографии - (только RU UTF-8)
mkdir ~/vimfiles/spell
cd ~/vimfiles/spell/
curl -O http://ftp.vim.org/vim/runtime/spell/ru.utf-8.sug
curl -O http://ftp.vim.org/vim/runtime/spell/ru.utf-8.spl
cd ~/
echo
echo "*** Dictionary installed"
echo

# конец установки окружения
echo
echo "----------------------------"
echo "----------------------------"

echo
echo "Run :PlugInstall in Vim"
echo

echo "----------------------------"
echo "----------------------------"

