#!/bin/bash

echo
echo "*** Install PowerLine form PIP and Patched fonts ***"
echo

# Install PowerLine from pip
pip install powerline-status
pip install powerline-gitstatus
echo
echo "*** PowerLine from PIP installed"
echo

# PowerLine dir
pldir=$(pip show powerline-status | grep Location | awk '{print $2}')
pldir=$pldir/powerline

# ~/.config/powerline/
confdir=$HOME/.config/powerline/
if [[ ! -e $confdir ]]
then
  mkdir -p $confdir
  cp -R $pldir/config_files/* $confdir
  echo "*** ~/.config/powerline/ created and config files сopied"
  echo
else
  echo "*** conig files already created"
  echo
fi

# files with powerline-gitstatus
mv json_colorschemes ~/.config/powerline/colorschemes/default.json
mv json_themes ~/.config/powerline/themes/shell/default.json

# Install fonts

# ~/.local/share/fonts/
font_dir=$HOME/.local/share/fonts/
if [[ ! -e $font_dir ]]
then
  # Patched fonts
  git clone https://github.com/powerline/fonts.git
  cd fonts
  bash install.sh
  cd ..
  rm -rf fonts/
fi

# PowerlineSymbols font
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
mv PowerlineSymbols.otf ~/.local/share/fonts/

# update cache
fc-cache -vf ~/.local/share/fonts/

# ~/.config/fontconfig/conf.d/
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

echo "*** Patched fonts for PowerLine installed"
echo

