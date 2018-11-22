## Vim

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
Пример для Windows:
```
git clone https://github.com/koljasha/vim && \
cd vim && ./windows.sh && cd .. && \
gvim -c PlugInstall
```

* в .vimrc поправить версию Python и пользователя:
```
" используем PowerLine
	set rtp+=/home/koljasha/soft/conda/lib/python3.6/site-packages/powerline/bindings/vim
```
