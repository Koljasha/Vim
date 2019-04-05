" ----------------------------------------
" vimrc by Koljasha
" ----------------------------------------

" Основные настройки
" ---------------

" убираем совместимость с vi
set nocompatible
" автоматически обновлять файл при его изменении
set autoread
" отключение бекапов
set nobackup
" отключение swap-файлы
set noswapfile
" не выгружать буфер, когда переключаемся на другой файл
set hidden
" .vimrc из каталога запуска
" set exrc
" set secure
" определение типа файла
filetype plugin indent on
" list filetypes:
" :echo glob($VIMRUNTIME . '/syntax/*.vim')
" :echo glob($VIMRUNTIME . '/ftplugin/*.vim')

" подсветка синтаксиса
syntax on
" цветовая схема - (через плагин)
" colorscheme desert
set background=dark
" нумерация строк
set number
" показывать относительные номера строк
set relativenumber
" показывать имя буфера в заголовке терминала
set title
" показывать строку с позицией курсора
set ruler
" включаем отображение команды
set showcmd
" показывать первую парную скобку после ввода второй
" set showmatch
" включить подсветку невидимых символов
" set list
" табы и пробелы
set listchars=space:.,tab:--
" подсветка текущей строки
" set cursorline
" highlight cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" всегда показывать строку статуса
set laststatus=2
" описание строки статуса - (через плагин)
" set statusline=%<%r%m\ %f:%y\ %=\ %-15(%l,%c:%v\ %p%%%)
" set statusline+=\ %{strftime(\"%H:%M\ %d.%m.%Y\ %a\")}
" показывать строку вкладок всегда
set showtabline=2
" 256 цветов
set t_Co=256

" включаем перенос строк
set wrap
" перенос по словам, а не по буквам
set linebreak

" автозавершение команд в командной строке
set wildmenu
set wcm=<TAB>
" вывести весь список сразу доступных вариантов
" set wildmode=list:longest,full

" 4 пробела на tab
" set expandtab
set tabstop=4
" размер сдвига при нажатии на клавиши "<" и ">"
set shiftwidth=4
" включаем умную автоматическую расстановку отступов
set smartindent
" наследовать отступы предыдущей строки
set autoindent

" подсветка поиска
set hlsearch
" автопоиск первого совпадения
set incsearch
" останавливать поиск при достижении конца файла
" set nowrapscan
" игнорировать регистр букв при поиске
set ignorecase

" кодировка по умолчанию
set encoding=utf-8
set termencoding=utf-8
" список кодировок файлов для авто-определения
" set fileencodings=utf-8,koi8-r,cp1251,cp866

" :vsplit открывает окна справа
set splitright
" :split открывает окна снизу
set splitbelow

" ----------------------------------------
" ----------------------------------------

" Горячие клавиши
" ---------------

" если не работает Alt-key or Meta-key в терминале (пример для q)
" execute "set <M-q>=\eq" или использовать Vim-Fixkey

" меняем mapleader на ",", по умолчанию - "\"
let mapleader=","
" устанавливаем задержку после нажатия
set timeoutlen=5000 ttimeoutlen=0

" help по слову при нажатии K
let &keywordprg=':help'

" <Leader>hl - отключение подсветки поиска hlsearch
nmap <Leader>hl :nohlsearch <CR>

" сменить split
nmap <C-Right> <C-W>l
nmap <C-Left> <C-W>h
nmap <C-Up> <C-W>k
nmap <C-Down> <C-W>j

" F4 - ражим вставки (Paste) 
map <F4> :set paste! <CR>
imap <F4> <Esc> :set paste! <CR>

" F5 - сохранение файла
map <F5> :w! <CR>
imap <F5> <Esc> :w! <CR>

" S-F5 - сохранить с sudo
map <S-F5> :execute ':silent w !sudo tee % > /dev/null' <bar> :edit! <cr>

" F6 - проверка орфографии
map <F6> :setlocal spelllang=ru spell! <CR>
" ]s - следующее слово с ошибкой
" [s - предыдущее слово с ошибкой
" z= - замена из списка
" zg - добавить в словарь
" zw - убрать из словаря:
" zG - игнорировать слово:

" F7 - показать пробелы и табы
map <F7> :set list! <CR>

" Shift-F7 - использовать табы вместо пробелов
map <S-F7> :set noet! <CR>

" F8 - отключение нумерации (всей - относительной)
map <F8> :set number! relativenumber! <CR>
map <S-F8> :set relativenumber! <CR>

" F10 - запуск скрипта Python
" nmap <F10> <F5>:!clear;python % <CR>
" imap <F10> <Esc><F5>:!clear;python % <CR>
" vmap <F10> <Esc><F5>:!clear;python % <CR>

" F11 - удаление повторяющихся пробелов + пробелов в конце предложения
" map <F11> :%s/\  */\ /g<CR> <bar> :%s/\ $//g<CR> <bar> <Leader>hl<CR> <bar> <Esc>
" F11 - удаление пустых строк (возможно с пробелами)
" map <F11> :%s/^\s*\n//g<CR> <bar> <Leader>hl<CR> <bar> <Esc>

" F12 - полная русская раскладка (на выборе English)
map <F12> :set keymap=russian-jcukenwin <CR>
imap <F12> <Esc>:set keymap=russian-jcukenwin<CR>i
map <S-F12> :set keymap= <CR>
imap <S-F12> <Esc>:set keymap=<CR>i

" автодополнения i_ctrl-x_:
" ctrl-l - добавить строку
" ctrl-n ctrl-p ctrl-i - добавить слово
" ctrl-f - добавить имя файла
" ctrl-o - добавить из языка (автодополнение)

" eVim - перейти в normal mode: ctrl-l
" ----------------------------------------
" ----------------------------------------

" Плагины
" ---------------
" Vim-plug - менеджер плагинов

" Ack - для The Silver Searcher (для Linux)
" Anyfold - автоматическое свертывание кода (отключен)
" ArgWrap - схлопывание и захлопывание содержимого скобок
" Auto Pairs - парные скобки и ковычки
" Buffer Explorer - переключение открытых буферов
" Color Schemes - цветовые схемы:
	" PaperColor
	" Solarized 8: True Colors
" Ctrlp - нечеткий поиск
" Ctrlsf - изменение в нескольких файлах + Ack(ag), Multiple Cursors (для Linux)
" Easy Align - выравнивание текста по параметрам
" EasyMotion - простые перемещения
" Emmet - автонаписание html, css (для html и css)
" Fixkey - корректная работа Alt-key or Meta-key в терминале
" Git - дополнение для git (для Linux):
	" Fugitive - расширение git для Vim
	" GitGutter - git состояние
	" GV - просмотр коммитов
" Lightline - строка статуса (для Windows, для Linux внешний PowerLine)
" ListToggle - вкл/выкл quickfix и location окон
" Livedown - автопросмотр MarkDown файлов в браузере (для Linux для markdown)
" Matchit - перемещение по тегам HTML (%) (для HTML)
" Matchtag - подсветка тегов HTML (для HTML)
" Move - перемещение текущей строки или выделенных строк вверх или вниз
" MRU - последние открытые файлы
" Multiple Cursors - многокурсорное редактирование
" NERD Commenter - комментирование для различных языков
" NERD Tree - файловый менеджер
" Polyglot - коллекция языковых пакетов для Vim
" Repeat - расширенный повтор по "."
" Session - расширенные сессии для Vim, требует:
" (Misc - различные автонастройки скриптов Vim)
" Startify - стартовый экран
" Supertab - дополнение по <Tab>
" Surround - обернуть текст
" Tags - теги (для Linux):
	" Tagbar - окно-список тегов
	" Tagbar-CSS - теги для css
	" EasyTags - генерация файла тегов (отключен)
" Xkbswitch - смена на En при переходе в командный режим
" YCM + other code (вручную раскомментировать, только для Linux):
	" YCM-Generator - генератор .ycm_extra_conf.py (отключен)
	" YouCompleteMe - автодополнение кода
	" Snippets - набор сниппетов
	" (UltiSnips - движок для сниппетов)
	" Syntastic - синтаксические ошибки кода (в YCM)
" ----------------------------------------

" Vim-plug - менеджер плагинов
" ---------------
" https://github.com/junegunn/vim-plug
" Reload .vimrc and :PlugInstall to install plugins
" --------------

" Specify a directory for plugins
if has('unix')
	call plug#begin('~/.vim/plugged')
elseif has('win32') || has('win64')
	call plug#begin('~\vimfiles\plugged')
endif
" ----------------------------------------

" Ack - для The Silver Searcher
" (нужен установленный The Silver Searcher)
" ---------------
" https://github.com/mileszs/ack.vim
if has('unix')
	Plug 'mileszs/ack.vim'
	" ---------------
	" вызов :Ack <pattern>
	let g:ackprg = 'ag --vimgrep'
	nnoremap <Leader>aa :Ack!<Space>
endif
" ----------------------------------------

" Anyfold - автоматическое свертывание кода
" ---------------
" https://github.com/pseewald/vim-anyfold
" Plug 'pseewald/vim-anyfold'
" ---------------
" свернуть блок - zc
" развернуть блок - zo
" закрыть все блоки - zM
" открыть все блоки - zR
" " начальный уровень
" set foldlevel=0
" " авто-свертывание кода
" let anyfold_activate=1
" " авто-свертывание комментариев
" let anyfold_fold_comments=1
" ----------------------------------------

" ArgWrap - схлопывание и захлопывание содержимого скобок
" ---------------
" https://github.com/FooSoft/vim-argwrap
Plug 'FooSoft/vim-argwrap'
" ---------------
map <Leader>aw :ArgWrap <CR>
" ----------------------------------------

" Auto Pairs - парные скобки и ковычки
" ---------------
" https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'
" ---------------
" System Shortcuts (alt-key or meta-key)
" <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle) - отключено
let g:AutoPairsShortcutToggle = ''
" <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap) - обернуть
" <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump) - отключено
let g:AutoPairsShortcutJump = ''
" <M-b> : BackInsert (g:AutoPairsShortcutBackInsert) - отключено
let g:AutoPairsShortcutBackInsert = ''
" ----------------------------------------

" Buffer Explorer - переключение открытых буферов
" ---------------
" https://github.com/vim-scripts/bufexplorer.zip
Plug 'vim-scripts/bufexplorer.zip'
" ---------------
" <Leader>be - открыть Buffer Explorer
" <Leader>bs - открыть Buffer Explorer (горизонтально)
" <Leader>bv - открыть Buffer Explorer (вертикально)
" ----------------------------------------

" Color Schemes - цветовые схемы:
	" ----------------------------------------
	"
	" PaperColor
	" ---------------
	" https://github.com/NLKNguyen/papercolor-theme
	Plug 'nlknguyen/papercolor-theme'
	" ---------------
	" ----------------------------------------
	"
	" Solarized 8: True Colors
	" ---------------
	" https://github.com/lifepillar/vim-solarized8
	" Plug 'lifepillar/vim-solarized8'
	" ---------------
	" ----------------------------------------
" ----------------------------------------

" Ctrlp - нечеткий поиск
" ---------------
" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'
" ---------------
let g:ctrlp_map = '<Leader>cp'
let g:ctrlp_by_filename = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'rc'
" ----------------------------------------

" Ctrlsf - изменение в нескольких файлах
" ---------------
if has('unix')
	" https://github.com/dyng/ctrlsf.vim
	Plug 'dyng/ctrlsf.vim'
	" ---------------
	nmap <Leader>cf <Plug>CtrlSFPrompt
endif
" ----------------------------------------

" Easy Align - выравнивание текста по параметрам
" ---------------
" https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" ---------------
" Start interactive EasyAlign in visual mode (e.g. vipga) - отключено
" xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip) - отключено
" nmap ga <Plug>(EasyAlign)
" используем <Leader>al вместо ga
xmap <Leader>al <Plug>(EasyAlign)
" ----------------------------------------

" EasyMotion - простые перемещения
" ---------------
" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'
" ---------------
" отключаем зависимость от регистра
let g:EasyMotion_smartcase = 1
" стандартные клавиши, где <Leader> - это <Leader><Leader>
" Default Mapping      | Details
"    ---------------------|----------------------------------------------
"    <Leader>f{char}      | Find {char} to the right. See |f|.
"    <Leader>F{char}      | Find {char} to the left. See |F|.
"    <Leader>t{char}      | Till before the {char} to the right. See |t|.
"    <Leader>T{char}      | Till after the {char} to the left. See |T|.
"    <Leader>w            | Beginning of word forward. See |w|.
"    <Leader>W            | Beginning of WORD forward. See |W|.
"    <Leader>b            | Beginning of word backward. See |b|.
"    <Leader>B            | Beginning of WORD backward. See |B|.
"    <Leader>e            | End of word forward. See |e|.
"    <Leader>E            | End of WORD forward. See |E|.
"    <Leader>ge           | End of word backward. See |ge|.
"    <Leader>gE           | End of WORD backward. See |gE|.
"    <Leader>j            | Line downward. See |j|.
"    <Leader>k            | Line upward. See |k|.
"    <Leader>n            | Jump to latest "/" or "?" forward. See |n|.
"    <Leader>N            | Jump to latest "/" or "?" backward. See |N|.
"    <Leader>s            | Find(Search) {char} forward and backward.
" ----------------------------------------

" Emmet - автонаписание html, css
" ---------------
" https://github.com/mattn/emmet-vim
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'css' ] }
" ---------------
let g:user_emmet_leader_key = '<C-e>'
" для раскрытия:
let g:user_emmet_expandabbr_key = '<C-e>e'
" Default:
" let g:user_emmet_leader_key = '<C-y>'
" let g:user_emmet_expandabbr_key = '<C-y>,'
" let g:user_emmet_expandword_key = '<C-y>;'
" let g:user_emmet_update_tag = '<C-y>u'
" let g:user_emmet_balancetaginward_key = '<C-y>d'
" let g:user_emmet_balancetagoutward_key = '<C-y>D'
" let g:user_emmet_next_key = '<C-y>n'
" let g:user_emmet_prev_key = '<C-y>N'
" let g:user_emmet_imagesize_key = '<C-y>i'
" let g:user_emmet_togglecomment_key = '<C-y>/'
" let g:user_emmet_splitjointag_key = '<C-y>j'
" let g:user_emmet_removetag_key = '<C-y>k'
" let g:user_emmet_anchorizeurl_key = '<C-y>a'
" let g:user_emmet_anchorizesummary_key = '<C-y>A'
" let g:user_emmet_mergelines_key = '<C-y>m'
" let g:user_emmet_codepretty_key = '<C-y>c'
" ----------------------------------------

" Fixkey - корректная работа Alt-key or Meta-key в терминале
" ---------------
" https://github.com/drmikehenry/vim-fixkey
Plug 'drmikehenry/vim-fixkey'
" ---------------
" ----------------------------------------

" Git
if has('unix')
	" Fugitive - расширение Git
	" ---------------
	" https://github.com/tpope/vim-fugitive
	Plug 'tpope/vim-fugitive'
	" ---------------
	"  :Git, :Gstatus, :Gcommit, ...
	" ----------------------------------------
	"
	"  GitGutter - git состояние
	" ---------------
	" https://github.com/airblade/vim-gitgutter
	Plug 'airblade/vim-gitgutter'
	" ---------------
	set updatetime=250
	" :GitGutterToggle
	nmap <Leader>gg :GitGutterToggle <CR>
	" [c и ]c - перемещение между изменениями
	" Изменение:
	" <leader>hp - показать
	" <leader>hs - сохранить
	" <leader>hu - отменить
	" ----------------------------------------
	"
	" GV - просмотр коммитов
	" ---------------
	" https://github.com/junegunn/gv.vim
	Plug 'junegunn/gv.vim'
	" ---------------
	" :GV - открыть просмотр коммитов
	" :GV! - только для данного файла
	" ----------------------------------------
endif
" ----------------------------------------

" Lightline - строка статуса
" (для Linux используем PowerLine)
" ---------------
" https://github.com/itchyny/lightline.vim
if has('win32') || has('win64')
	Plug 'itchyny/lightline.vim'
endif
" ---------------
" настройка после плагинов
" ----------------------------------------

" ListToggle - вкл/выкл quickfix и location окон
" ---------------
" https://github.com/Valloric/ListToggle
Plug 'Valloric/ListToggle'
" ---------------
" for example Ack(ag):
let g:lt_quickfix_list_toggle_map = '<leader>qq'
" for example Syntastic:
let g:lt_location_list_toggle_map = '<leader>ql'
" ----------------------------------------

" Livedown - автопросмотр MarkDown файлов в браузере
" (требуется установленный nodejs with npm)
" $ npm install -g livedown
"  ---------------
" https://github.com/shime/vim-livedown
if has('unix')
	Plug 'shime/vim-livedown', { 'for': 'markdown' }
	" ---------------
	" :LivedownPreview - launch the Livedown server and preview your markdown file
	" :LivedownKill - stop the Livedown server
	" :LivedownToggle - launch/kill the Livedown server
	nmap <Leader>md :LivedownToggle<CR>
	"
	" should markdown preview get shown automatically upon opening markdown buffer
	let g:livedown_autorun = 0
	" should the browser window pop-up upon previewing
	let g:livedown_open = 1
	" the port on which Livedown server will run
	let g:livedown_port = 1337
	" the browser to use
	" let g:livedown_browser = "opera"
endif
" ----------------------------------------

" Matchit - перемещение по тегам HTML (%)
" Matchtag - подсветка тегов HTML
" " ---------------
" https://github.com/tmhedberg/matchit
" https://github.com/gregsexton/MatchTag
Plug 'tmhedberg/matchit', { 'for': 'html' }
Plug 'gregsexton/MatchTag', { 'for': 'html' }
" ---------------
" ----------------------------------------

" Move - перемещение текущей строки или выделенных строк вверх или вниз
" ---------------
" https://github.com/matze/vim-move
Plug 'matze/vim-move'
" ---------------
" команды перемещения на <C-j> и <C-k> вместо <A-j> и <A-k>
let g:move_key_modifier = 'C'
" ----------------------------------------

" MRU - последние открытые файлы
" ---------------
" https://github.com/vim-scripts/mru.vim
Plug 'vim-scripts/mru.vim'
" ---------------
" <Leader>oo - показать список последних файлов
map <Leader>oo :MRU <CR>
" ----------------------------------------

" Multiple Cursors - многокурсорное редактирование
" ---------------
" https://github.com/terryma/vim-multiple-cursors/
Plug 'terryma/vim-multiple-cursors'
" ---------------
" Default mapping
" <C-n> - выделение следующего слова под курсором - отключено
" let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_next_key=''
" <C-p> - выделение предыдущего слова под курсором - отключено
" let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_prev_key=''
" <C-x> - пропустить текущее слово и перейти к следующему - отключено
" let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_skip_key=''
" выход из мультикурсорного режима (вместо <Esc> использовать <CR>)
" let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_quit_key='<CR>'
" многокурсорный поиск по <Leader>mc
nmap <Leader>mc :MultipleCursorsFind 
" редактирование:
" c - удалить и перейти в режим редактирования
" I - вставить в начало
" A - вставить в конец
" ----------------------------------------

" NERD Commenter - комментирование для различных языков
" ---------------
" https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'
" ---------------
" отменить двойной комментарий
" let g:NERDDefaultNesting = 0
" добавить пробелы после комментария
let g:NERDSpaceDelims = 1
" изменение знака комментария
" \ 'lang': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
let g:NERDCustomDelimiters = {
    \ 'python': { 'left': '#'}
    \}
" комментировать:
" [count]|<leader>|cc |NERDComComment|
" раскомментировать:
" [count]|<Leader>|cu |NERDComUncommentLine|
" комментировать/раскомментировать :
" [count]|<Leader>|c<space> |NERDComToggleComment|
" блочный форматированный комментарий:
" [count]<leader>cs |NERDComSexyComment|
" смена комментировано на раскомментировано и наоборот:
" [count]|<Leader>|ci |NERDComInvertComment|
" комментарий в конец строки:
" |<Leader>|cA |NERDComAppendComment|
" ----------------------------------------

" NERD Tree - файловый менеджер
" ---------------
" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" ---------------
" автоматически обновлять буфер после переименовывания файла
let NERDTreeAutoDeleteBuffer = 1
" показать скрытые файлы
" let NERDTreeShowHidden = 1
" нумерация строк
let NERDTreeShowLineNumbers = 1
" открывать с правой стороны
let g:NERDTreeWinPos = "left"
" NERDTreeToggle - <Leader>op
map <Leader>op :NERDTreeToggle <CR>
" ----------------------------------------

" Polyglot - коллекция языковых пакетов для Vim
" ---------------
" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'
" ---------------
" ----------------------------------------

" Repeat - расширенный повтор по "."
" ---------------
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'
" ---------------
" ----------------------------------------

" Vim-Session - расширенные сессии для Vim, требует:
" (Vim-Misc - различные автонастройки скриптов Vim)
" ---------------
" https://github.com/xolox/vim-session
Plug 'xolox/vim-session'
" https://github.com/xolox/vim-misc
Plug 'xolox/vim-misc'
" ---------------
" выключить автосохранение сессии
let g:session_autosave = 'no'
" выключить автозагрузку сессии
let g:session_autoload = 'no'
" :SaveSession name - сохранение сессии (без name - default)
" :OpenSession name - загрузка сессии (без name - default)
" :DeleteSession name - удаление сессии (без name - default)
" ----------------------------------------

" Startify - стартовый экран
" ---------------
"  https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'
" ---------------
" ----------------------------------------

" Supertab - дополнение по <Tab>
" ---------------
" https://github.com/ervandew/supertab
Plug 'ervandew/supertab'
" ---------------
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
" ----------------------------------------

" Surround - обернуть текст
" ---------------
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
" ---------------
" Normal mode:
" ds  - удалить окружение (ds")
" cs  - заменить окружение (cs"')
" ys  - добавить окружение (ysiw")
" yss - добавить окружение на всю линию (yss{)
" ySS - добавить окружение на всю линию вокруг(ySS<p>)
" Visual mode:
" S   - добавить окружение (S<b>)
" ----------------------------------------

" Tags - теги:
" список поддерживаемых языков
" ctags --list-languages
" список тегов для конкретного языка
" ctags --list-kinds=<Lang>
if has('unix')
	" Tagbar - окно-список тегов
	" (нужен установленный ctags)
	" ---------------
	" https://github.com/majutsushi/tagbar
	Plug 'majutsushi/tagbar'
	" ---------------
	nmap <Leader>tt :TagbarToggle<CR>
	let g:tagbar_sort = 0
	let g:tagbar_show_linenumbers = 2
	" ----------------------------------------
	"
	" Tagbar-CSS - тэги для css
	" ---------------
	" https://github.com/mtscout6/vim-tagbar-css
	Plug 'mtscout6/vim-tagbar-css'
	" ---------------
	" нужен файл ~/.ctags с содержимым:
	" --langdef=CSS
	" --langmap=css:.css.less.scss
	" --regex-css=/^[ \t]*@([A-Za-z0-9_-]+)/@\1/v,var,variables/
	" --regex-css=/^[ \t]*\.([A-Za-z0-9_-]+)/.\1/c,class,classes/
	" --regex-css=/^[ \t]*#([A-Za-z0-9_-]+)/#\1/i,id,ids/
	" --regex-css=/^[ \t]*(([A-Za-z0-9_-]+[ \t\n,]+)+)\{/\1/t,tag,tags/
	" --regex-css=/^[ \t]*@media\s+([A-Za-z0-9_-]+)/\1/m,media,medias/
	" ----------------------------------------
	"
	" EasyTags - генерация файла тегов
	" ---------------
	" https://github.com/xolox/vim-easytags
	" Plug 'xolox/vim-easytags'
	" ---------------
	" :UpdateTags -R в новом проекте
	" let g:easytags_file = './tags'
	" let g:easytags_auto_highlight = 0
	" let g:easytags_events = ['BufWritePost']
	" let g:easytags_async = 1
	" ----------------------------------------
endif
" ----------------------------------------

" Xkbswitch - смена на En при переходе в командный режим
" ---------------
" библиотека:
" https://github.com/ierton/xkb-switch - для *nix
" https://github.com/DeXP/xkb-switch-win - для Win 
" https://github.com/myshov/xkbswitch-macosx - для Mac
" плагин:
" https://github.com/lyokha/vim-xkbswitch
Plug 'lyokha/vim-xkbswitch'
" ---------------
let g:XkbSwitchEnabled = 1 
let g:XkbSwitchIMappings = ['ru']
" путь к библиотеке
if has('unix')
	let g:XkbSwitchLib = $HOME.'/.local/libxkbswitch/libxkbswitch.so'
elseif has('win32') || has('win64')
	let g:XkbSwitchLib = 'C:\Program Files (x86)\Vim\libxkbswitch\libxkbswitch64.dll'
endif
" ----------------------------------------

" YouCompleteMe + other code
" 57 строк вниз от if:
" if has('unix')
	" " YCM-Generator - генератор .ycm_extra_conf.py
	" " ---------------
	" " https://github.com/rdnetto/YCM-Generator
	" " Plug 'rdnetto/YCM-Generator'
	" " ---------------
	" " ~/.vim/plugged/YCM-Generator/config_gen.py PROJECT_DIRECTORY
	" " :YcmGenerateConfig or :CCGenerateConfig
	" " ----------------------------------------
	" "
	" " YouCompleteMe - автодополнение кода
	" " https://github.com/Valloric/YouCompleteMe
	" " ---------------
	" Plug 'Valloric/YouCompleteMe'
	" " ---------------
	" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
	" let g:ycm_autoclose_preview_window_after_completion = 1
	" let g:ycm_key_list_select_completion = ['<Down>']
	" let g:ycm_key_list_previous_completion = ['<Up>']
	" " ----------------------------------------
	" "
	" " Snippets - набор сниппетов
	" " UltiSnips - движок для сниппетов
	" " ---------------
	" " https://github.com/honza/vim-snippets
	" Plug 'honza/vim-snippets'
	" " https://github.com/sirver/ultisnips
	" Plug 'sirver/ultisnips'
	" " ---------------
	" " вставить сниппет
	" let g:UltiSnipsExpandTrigger = "<c-a>"
	" " перемещение по сниппету
	" let g:UltiSnipsJumpForwardTrigger = "<c-j>"
	" let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
	" " список сниппетов для слова
	" let g:UltiSnipsListSnippets = "<m-w>"
	" " ----------------------------------------
	" "
	" " Syntastic - синтаксические ошибки кода
	" " ---------------
	" " https://github.com/vim-syntastic/syntastic
	" Plug 'vim-syntastic/syntastic'
	" " ---------------
	" " проверка при сохранении/открытии (кроме ZZ, :wq и :x)
	" " set statusline+=%#warningmsg#
	" " set statusline+=%{SyntasticStatuslineFlag()}
	" " set statusline+=%*
	" let g:syntastic_always_populate_loc_list = 1
	" let g:syntastic_auto_loc_list = 1
	" let g:syntastic_check_on_open = 1
	" let g:syntastic_check_on_wq = 0
	" " отключение / включение
	" map <Leader>sy :SyntasticToggleMode <CR>
	" " : SyntasticInfo - доступные / активные чекеры
	" " : help syntastic-checkers - информация по чекерам
	" " let g:syntastic_<filetype>_checkers = ['<checker-name-1>','<checker-name-2>']
	" " ----------------------------------------
" endif
" ----------------------------------------

" Initialize plugin system
call plug#end()

" ----------------------------------------
" ----------------------------------------

" Цветовая схема
" ---------------

" настройка цветовой схемы
" кодировки, параметров клавиатуры (Windows)
" перенастройка Lightline
if has('unix')
	
	" используем PowerLine
	set rtp+=/home/koljasha/soft/conda/lib/python3.7/site-packages/powerline/bindings/vim
	
	if has('gui_running')
		" для PaperColor:
		colorscheme PaperColor
		"
		" цвет шрифта при проверке орфографии
		" красный цвет - орфографические ошибки
		highlight clear SpellBad
		highlight SpellBad guifg=Red
		" синий цвет - отсутствие заглавной буквы
		highlight clear SpellCap 
		highlight SpellCap guifg=Blue
		"
		" для Solarized:
		" colorscheme solarized8_dark_flat
		"
		" корректный шрифт PowerLine
		set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
	else
		" для PaperColor:
		colorscheme PaperColor
		"
		" цвет шрифта при проверке орфографии
		" красный цвет - орфографические ошибки
		highlight clear SpellBad
		highlight SpellBad ctermfg=Red
		" синий цвет - отсутствие заглавной буквы
		highlight clear SpellCap 
		highlight SpellCap ctermfg=Blue
		"
		" для Solarized:
		" if has('termguicolors')
			" set termguicolors
			" colorscheme solarized8_dark_flat
			"
			" " цвет шрифта при проверке орфографии
			" " красный цвет - орфографические ошибки
			" highlight clear SpellBad
			" highlight SpellBad guifg=Red
			" " синий цвет - отсутствие заглавной буквы
			" highlight clear SpellCap 
			" highlight SpellCap guifg=Blue
		" else
			" colorscheme desert
			" " смена фона для яркости цветов
			" set background=light
			" set background=dark
			"
			" " цвет шрифта при проверке орфографии
			" " красный цвет - орфографические ошибки
			" highlight clear SpellBad
			" highlight SpellBad ctermfg=Red
			" " синий цвет - отсутствие заглавной буквы
			" highlight clear SpellCap 
			" highlight SpellCap ctermfg=Blue
		" endif
	endif

elseif has('win32') || has('win64')
	if has('gui_running')
		" для PaperColor:
		colorscheme PaperColor
		" цвет шрифта при проверке орфографии
		" красный цвет - орфографические ошибки
		highlight clear SpellBad
		highlight SpellBad guifg=Red
		" синий цвет - отсутствие заглавной буквы
		highlight clear SpellCap 
		highlight SpellCap guifg=Blue
		"
		" для Solarized:
		" colorscheme solarized8_dark_flat
		"
		" Шрифт:
		set guifont=courier_new:h11
		
		" настройка Lightline ('colorscheme' : 'solarized')
		let g:lightline = {
		 	\ 'colorscheme' : 'solarized',	
		 	\ 'active' : {
				\ 'left': [ [ 'mode', 'paste' ],
				\			[ 'readonly', 'modified' ],
				\           [ 'relativepath', 'filetype' ]
				\			],
				\ 'right': [ ['percent'],
				\			 ['lineinfo'],
				\			 ['fileencoding']
				\			]
				\ },
			\ }
	else
		colorscheme desert
		
		" цвет шрифта при проверке орфографии
		" красный цвет - орфографические ошибки
		highlight clear SpellBad
		highlight SpellBad ctermfg=Red
		" синий цвет - отсутствие заглавной буквы
		highlight clear SpellCap 
		highlight SpellCap ctermfg=Blue
		
		" настройка Lightline ('colorscheme' : '16color')
		let g:lightline = {
			\ 'colorscheme' : '16color',	
			\ 'active' : {
				\ 'left': [ [ 'mode', 'paste' ],
				\			[ 'readonly', 'modified' ],
				\           [ 'relativepath', 'filetype' ]
				\			],
				\ 'right': [ ['percent'],
				\			 ['lineinfo'],
				\			 ['fileencoding']
				\			]
				\ },
			\ }
	endif

	" корректный backspace
	set backspace=2
	
	" gVim for Windows Кодировка UTF-8
	" (скрипт установки создает нужный файл)
	" отображение кириллицы во внутренних сообщениях программы
	lan mes ru_RU.UTF-8
	" отображение кириллицы в меню
	source $VIMRUNTIME/delmenu.vim
	set langmenu=ru_RU.UTF-8
	source $VIMRUNTIME/menu.vim
	
	" дополнительные настройки gVim
	" set guioptions-=m  "remove menu bar
	" set guioptions-=T  "remove toolbar
	" set guioptions-=r  "remove right-hand scroll bar
	" set guioptions-=L  "remove left-hand scroll bar
endif

" ----------------------------------------
" ----------------------------------------
