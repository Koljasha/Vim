## Oh My Vim

* файлы настройки Vim для Linux и Windows
* скрипты установки окружения
  * `./linux.sh`
  * `./windows.sh`

Пример для Linux:
```
git clone https://github.com/koljasha/vim && \
cd vim && ./linux.sh && cd .. && \
vim -c PlugInstall
```

* в .vimrc поправить версию Python и пользователя:
```
" используем PowerLine
    set rtp+=/home/koljasha/soft/conda/lib/python3.7/site-packages/powerline/bindings/vim
```

Пример для Windows (**в windows.sh исправить версию Vim и каталоги**)
```
git clone https://github.com/koljasha/vim && \
cd vim && ./windows.sh && cd .. && \
gvim -c PlugInstall
```
