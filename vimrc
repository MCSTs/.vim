"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/


"leader key(/) maps space key 
let mapleader=" "					   

syntax enable
syntax on

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on 

set hidden
set mouse=a
set encoding=utf-8

" Prevent incorrect backgroung redering
let &t_ut=''

" indent distent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set scrolloff=5
set indentexpr=

" Better backspace
set backspace=indent,eol,start

" fold
set foldmethod=indent
set foldlevel=99

" display space and enter keys
"set list
"set listchars=tab:▸\ ,trail:▫

set laststatus=2
set autochdir

" cursor back to the last time position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set number
set relativenumber					        
set ruler
set cursorline


" Prevent auto line split
set wrap						            
set tw=0

"show command 
set showcmd						            

"optional box
set wildmenu						        

"height light search
set hlsearch						        
exec "nohlsearch"		
set incsearch						      

set ignorecase						        
set smartcase						       

" Disabling the default s key
map s <nop>						

" Save & quit
map S :w<CR>
map Q :q<CR>

" let setting effect
map R :source $MYVIMRC<CR>				        

" leader+enter --> noh
noremap <LEADER><CR> :nohlsearch<CR>			

" Open the vimrc file anytime
map <LEADER>rc :e ~/.vim/vimrc<CR>

" ctags
set tags=tags;
set tags=./tags;
set tags+=/usr/include/tags
map <C-p> :!ctags ./* -R<CR><CR>

imap jk <Esc>

" Quick replace <++>
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" skip through
map <C-j> 5j
map <C-k> 5k
map <C-h> 10h
map <C-l> 10l

" === split mapping
map sl :set splitright<CR>:vsplit<CR>			
map sj :set splitbelow<CR>:split<CR>


" === switch window
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>q <C-w>q
map sv <C-w>t<C-w>H 
map sh <C-w>t<C-w>K

" === window size
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" === tab switch
map tn :tabnew<CR>
map tj :tabnext<CR>
map tk :tabprev<CR>


" ===
" === Install Plugins with Vim-Plug
" ===
call plug#begin('~/.vim/plugged')

" Decorate
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'bling/vim-bufferline'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" Visual enhancement
Plug 'nathanaelkane/vim-indent-guides'

" distraction free writing mode
Plug 'junegunn/goyo.vim' 

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Rainbow
Plug 'luochen1990/rainbow'

call plug#end()
" === End Plugins



" === OTHER SETTING-------------------------------------------------- 


" ===
" === Dress up my vim
" ===
"map <LEADER>c1 :set background=dark<CR>:colorscheme snazzy<CR>:AirlineTheme dracula<CR>
"map <LEADER>c2 :set background=light<CR>:colorscheme ayu<CR>:AirlineTheme ayu_light<CR>
"
"set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"" let ayucolor="mirage" " for mirage version of theme
"" let ayucolor="dark"   " for dark version of theme
"" let g:SnazzyTransparent = 1
colorscheme snazzy
set background=dark
" let g:airline_theme='dracula'

"let g:lightline = {
"  \     'active': {
"  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
"  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
"  \     }
"  \ }

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*



" === 
" === Goyo
" === 
map <LEADER>gy :Goyo<CR>


" === 
" === NERDTree
" === 
map tt :NERDTreeToggle<CR>
" change tree sign
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '-'
" Window position
let g:NERDTreeWinPos='left'
" Window size
let g:NERDTreeWinSize=30
" Window show number
let g:NERDTreeShowLineNumbers=1
" Show hidden file
let g:NERDTreeHidden=1


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" ===
" === vim-indent-guide
" ===
"let g:indent_guides_guide_size = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_color_change_percent = 1
"silent! unmap <LEADER>ig
"autocmd WinEnter * silent! unmap <LEADER>ig




" ===
" === rainbow
" ===
" let g:rainbow_active = 1
" let g:rainbow_conf = {
" \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
" \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
" \	'guis': [''],
" \	'cterms': [''],
" \	'operators': '_,_',
" \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
" \	'separately': {
" \		'*': {},
" \		'markdown': {
" \			'parentheses_options': 'containedin=markdownCode contained', "enable rainbow for code blocks only
" \		},
" \		'lisp': {
" \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], "lisp needs more colors for parentheses :)
" \		},
" \		'haskell': {
" \			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], "the haskell lang pragmas should be excluded
" \		},
" \		'vim': {
" \			'parentheses_options': 'containedin=vimFuncBody', "enable rainbow inside vim function body
" \		},
" \		'perl': {
" \			'syn_name_prefix': 'perlBlockFoldRainbow', "solve the [perl indent-depending-on-syntax problem](https://github.com/luochen1990/rainbow/issues/20)
" \		},
" \		'stylus': {
" \			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], "[vim css color](https://github.com/ap/vim-css-color) compatibility
" \		},
" \		'css': 0, "disable this plugin for css files
" \	}
" \}
