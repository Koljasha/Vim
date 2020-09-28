## Oh My Vim

* файлы настройки Vim для Linux и Windows
* скрипты установки окружения
  * `./linux.sh`
  * `./windows.sh`

Пример для Linux:
```
git clone https://github.com/koljasha/oh-my-vim.git && \
cd oh-my-vim/ && ./linux.sh && cd .. && \
vim -c PlugInstall
```

* в .vimrc поправить версию Python и пользователя:
```
" используем PowerLine
    set rtp+=/home/koljasha/soft/conda/lib/python3.8/site-packages/powerline/bindings/vim
```

Пример для Windows (**в windows.sh исправить версию Vim и, соответственно, каталоги**)
```
git clone https://github.com/koljasha/oh-my-vim.git && \
cd oh-my-vim/ && ./windows.sh && cd .. && \
gvim -c PlugInstall
```
