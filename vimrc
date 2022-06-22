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

" share clipboard with system
" (inner registor '+, *')
set clipboard=unnamedplus


" close visual bell & beep
"set visualbell t_vb=
"au GuiEnter * set t_vb=


" copy shortcut key
nnoremap Y y$
vnoremap Y "+y


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
nnoremap S :w<CR>
nnoremap Q :q<CR>

" let setting effect
nnoremap R :source $MYVIMRC<CR>				        

" leader+enter --> noh
noremap <LEADER><CR> :nohlsearch<CR>			

" Open the vimrc file anytime
nnoremap <LEADER>rc :e ~/.vim/vimrc<CR>

" ctags
set tags=./tags;
set tags=tags;
"set tags+=/usr/include/tags
"nnoremap <C-p> :!ctags ./* -R<CR><CR>

inoremap jk <Esc>

" Quick replace <++>
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" skip through
map <C-j> 5j
map <C-k> 5k
map <C-h> 5h
map <C-l> 5l
noremap E $
noremap <C-e> 5<C-e>
noremap <C-y> 5<C-y>

" switch case
noremap ` ~

" skip buffer
nnoremap <Leader>\ <C-^>

" === split mapping
nnoremap sl :set splitright<CR>:vsplit<CR>			
nnoremap sj :set splitbelow<CR>:split<CR>


" === switch window
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j

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



" === Compile and Run with C and C++
map <Leader>,c :call Compile()<CR>
func! Compile()
    exec "w"
    if &filetype == 'c'
        exec "AsyncRun cc % -o %< -Wall -g"
    elseif &filetype == 'cpp'
        exec "AsyncRun g++ % -o %< -Wall -g"
    endif
endfunc


map <Leader>,r :call Run()<CR>
func! Run()
    if &filetype == 'c'
        exec "AsyncRun -mode=term -pos=bottmo -rows=12 ./%<"
    elseif &filetype == 'cpp'
        exec "AsyncRun -mode=term -pos=bottmo -rows=12 ./%<"
    endif
endfunc


map <F5> :call CompileAndRun()<CR>
func! CompileAndRun()
    exec "w"
    if &filetype == 'c'
        exec "AsyncRun -mode=term -pos=bottmo -rows=12 cc % -o %< -Wall -g && ./%<"
    elseif &filetype == 'cpp'
        exec "AsyncRun -mode=term -pos=bottmo -rows=12 g++ % -o %< -Wall -g && ./%<"
    endif
endfunc




" switch relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

nnoremap <Leader><C-q> :call ToggleNumber()<CR>




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


" distraction free writing mode
Plug 'junegunn/goyo.vim' 

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" code-indentLine
Plug 'Yggdroot/indentLine'

" vim-move
Plug 'matze/vim-move'


" Rainbow
Plug 'luochen1990/rainbow'

" wildfier.vim
Plug 'gcmt/wildfire.vim'
" Sround-vim
" https://github.com/tpope/vim-surround

" Visual-multi <--> <C-n>
Plug 'mg979/vim-visual-multi'

" Undo tree <--> L
Plug 'mbbill/undotree'

" vim-terminal
" Plug 'tc50cal/vim-terminal'

" syntax check out
Plug 'dense-analysis/ale'

" code smart complement
" Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Plugin 'ycm-core/YouCompleteMe'
Plug 'Valloric/YouCompleteMe'

" vim -file icon
Plug 'ryanoasis/vim-devicons'

" git-icon
Plug 'Xuyuanp/nerdtree-git-plugin'

" Vim-Wiki 
" <==> filename.wiki : generate wiki with <Enter> key , backspace  key to return
Plug 'vimwiki/vimwiki'

" vim start startify
" Plug 'mhinz/vim-startify'

" quick comment 
" <==> <Space>ci/n to comment...   <Space>ca to switch mode
Plug 'preservim/nerdcommenter'

" insert table 
" <==> <Space>tm to switch mode ,  '|' to generate table
Plug 'dhruvasagar/vim-table-mode'


" calendar-vim
" <==> :Calendar / E / T /?
Plug 'itchyny/calendar.vim'

" fzf
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }


" vimspector
Plug 'puremourning/vimspector'

" wilder
Plug 'gelguy/wilder.nvim'

" vim-cursorword
"Plug 'itchyny/vim-cursorword'

" polyglot
" A collection of language packs for Vim
Plug 'sheerun/vim-polyglot'

" visual-registor
Plug 'junegunn/vim-peekaboo'

" auto generate tags
Plug 'ludovicchabant/vim-gutentags'



call plug#end()
" === End Plugins





" === PLUG SETTING-------------------------------------------------- 


" ===
" === Snazzy
" ===
" let g:SnazzyTransparent = 1
colorscheme snazzy
set background=dark



" ===
" === airline
" ===
"let g:airline_theme='angr'
"let g:airline_theme='base16_harmonic16'
let g:airline_theme='jellybeans'
"let g:airline_theme='alduin'
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enable = 1

let g:airline#extensions#tabline#enabled = 1


" === 
" === Goyo
" === 
nmap <LEADER>gy :Goyo<CR>


" === 
" === NERDTree
" === 
nmap tt :NERDTreeToggle<CR>
" change tree sign
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
" Window position
let g:NERDTreeWinPos='left'
" Window size
let g:NERDTreeWinSize=30
" Window show number
let g:NERDTreeShowLineNumbers=1
" Show hidden file
let g:NERDTreeHidden=1




" ===
" ===FZF 
" ===
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>m :Marks<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>



" ==
" == NERDTree-git
" ==
let g:NERDTreeGitStatusIndicatorMapCustom = {
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



" ==
" == indentLine
" ==
" default to close
let g:indentLine_enabled = 0

" switch, on-off
nnoremap <Leader>lc :IndentLinesToggle<CR>

"indent charactor with 'x'
"let g:indentLine_char = 'c'

" different level indent 'x'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']




" ===
" === wilder
" ===
call wilder#setup({'modes': [':', '/', '?']})


" ===
" === vim-move
" ===
" move in visual mode
let g:move_key_modifier_visualmode = 'S'



" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
nmap L :UndotreeToggle<CR>





" ===
" === Vim-table
" ===
"let g:table_mode_corner='|'
"let g:table_mode_corner_corner='+'
"let g:table_mode_header_fillchar='='




"===
"=== AsyncRun
"===
nmap <LEADER>w :AsyncRun 
nmap <LEADER>tw :AsyncRun -mode=term 
let g:asyncrun_open=8

"=== quickfix
nnoremap <silent> <Leader>q :copen<CR>
nnoremap <silent> <Leader>Q :cclose<CR>

" grep ==> Ripgrep 'rg'
set grepprg=rg\ --vimgrep\ --smart-case\ --follow




" === 
" === vimspector
" === 
"let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>dq :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>ds <Plug>VimspectorStop
nmap <Leader>dp <Plug>VimspectorPause
nmap <Leader>dr <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver




" ===
" === vim-Calendar
" ===
map <LEADER>cd :Calendar -position=here<CR>
map <LEADER>ck :Calendar -view=clock -position=here<CR>



" ===
" === You Complete ME
" ===
"nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap g/ :YcmCompleter GetDoc<CR>
"nnoremap gt :YcmCompleter GetType<CR>
"nnoremap gr :YcmCompleter GoToReferences<CR>
"let g:ycm_autoclose_preview_window_after_completion=0
"let g:ycm_autoclose_preview_window_after_insertion=1
"let g:ycm_use_clangd = 1
""let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']


" ===
" === rainbow
" ===
"au FileType c,cpp,objc,objcpp call rainbow#load()
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_conf = {
\	'separately': {
\		'nerdtree': 0,
\	}
\}

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
