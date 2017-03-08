#!/bin/bash

# Print Information after install

echo "----------------------------"
echo "----------------------------"
echo

echo "*** Run in Vim:"
echo ":PlugInstall"

echo "----------------------------"
echo

# PowerLine dir
pldir=$(pip show powerline-status | grep Location | awk '{print $2}')
pldir=$pldir/powerline

echo "*** PowerLine for Vim add to .vimrc:"
plvim=$pldir/bindings/vim
echo "set rtp+="$plvim
echo "(in .vimrc by Koljasha for Linux automatically added)"

echo "----------------------------"
echo

echo "*** PowerLine for Bash add to .bashrc:"
plbash=$pldir/bindings/bash/powerline.sh
echo "powerline-daemon -q"
echo "POWERLINE_BASH_CONTINUATION=1"
echo "POWERLINE_BASH_SELECT=1"
echo ". "$plbash

echo "----------------------------"
echo

echo "*** For LiveDown:"
echo "Need Nodejs with npm"
echo "$ npm install -g livedown"

echo "----------------------------"
echo

echo "*** For YouCompleteMe:"
echo "* Manually change .vimrc"
echo "Uncomment YouCompleteMe"
echo "* If you not used YCM previously - run:"
echo "$ ~/.vim/plugged/YouCompleteMe/install.py --clang-completer --tern-completer"

echo "----------------------------"
echo

echo "*** For Ack.vim:"
echo "Need The Silver Searcher"

echo "----------------------------"
echo

echo "*** For Tags Plugs:"
echo "Need Ctags"

echo
echo "----------------------------"
echo "----------------------------"
echo
