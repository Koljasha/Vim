#!/bin/bash

# Print Information after install

echo "----------------------------"
echo "----------------------------"
echo

echo "*** For LiveDown:"
echo "Need Nodejs"
echo "$ npm install -g livedown"
echo "Uncomment in linux.sh before"

echo "----------------------------"
echo

echo "*** For YouCompleteMe:"
echo "* If you not used YCM previously - run:"
echo "$ ~/.vim/plugged/YouCompleteMe/install.py --clang-completer --tern-completer"
echo "-------"
echo "If need .ycm_extra_conf.py uncomment in linux.sh before"
echo "If need .tern-config uncomment in linux.sh before"

echo "----------------------------"
echo

echo "*** For Jedi-Vim:"
echo "Need Jedi"
echo "$ pip install jedi"

echo "----------------------------"
echo

echo "*** For Ack.vim:"
echo "Need The Silver Searcher"

echo "----------------------------"
echo

echo "*** For Tags Plugs:"
echo "Need Ctags"
echo "-------"
echo "If need .ctags for CSS uncomment in linux.sh before"

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

echo
echo "----------------------------"
echo "----------------------------"
echo
