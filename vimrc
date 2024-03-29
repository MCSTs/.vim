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

" forbid generate swap file
set nobackup       
set noswapfile     
set nowritebackup  
set noundofile     


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


" Vertical dividing line
set fillchars=stlnc:=,vert:\│


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
" map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" skip through
noremap <C-j> 5j
noremap <C-k> 5k
noremap <C-h> 7h
noremap <C-l> 7l
noremap E $
noremap W ^
noremap <C-e> 5<C-e>
noremap <C-y> 5<C-y>

" switch case
noremap ` ~


"" operator mapping
"inoremap ( ()<Esc>i
"inoremap ) <C-r>=ClosePair(')')<CR>

"inoremap [ []<Esc>i
"inoremap ] <C-r>=ClosePair(']')<CR>

"inoremap { {}<Esc>i
"inoremap } <C-r>=ClosePair('}')<CR>


"function! ClosePair(char)
"    if getline('.')[col('.') - 1] == a:char
"        return "\<Right>"
"    else
"        return a:char
"    endif
"endfunction




" skip buffer
nnoremap <Leader>\ <C-^>

" delete cur-buffer
nnoremap <Leader>D :bdelete<CR>


" imap <include>
inoremap <c-h> <nop>
inoremap <c-h> <c-x><c-x><c-i>


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
Plug 'morhetz/gruvbox'


" Git
" Plug 'rhysd/conflict-marker.vim'
"Plug 'tpope/vim-fugitive'
" Plug 'mhinz/vim-signify'
" Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }


" distraction free writing mode
Plug 'junegunn/goyo.vim' 

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" code-indentLine
Plug 'Yggdroot/indentLine'

" vim-move
Plug 'matze/vim-move'

" AsyncRun
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'

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
"Plug 'dense-analysis/ale'

" code smart complement
"Plug 'ycm-core/YouCompleteMe'

" vim -file icon
Plug 'ryanoasis/vim-devicons'

" git-icon
"Plug 'Xuyuanp/nerdtree-git-plugin'

" Vim-Wiki 
" <==> filename.wiki : generate wiki with <Enter> key , backspace  key to return
" Plug 'vimwiki/vimwiki'

" vim start startify
" Plug 'mhinz/vim-startify'

" quick comment 
" <==> <Space>ci/n to comment...   <Space>ca to switch mode
Plug 'preservim/nerdcommenter'

" insert table 
" <==> <Space>tm to switch mode ,  '|' to generate table
"Plug 'dhruvasagar/vim-table-mode'


" calendar-vim
" <==> :Calendar / E / T /?
"Plug 'itchyny/calendar.vim'

" fzf
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }


" vimspector
"Plug 'puremourning/vimspector'

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

" F / f to repet find
"Plug 'rhysd/clever-f.vim'

" snippets (code segment)
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" easymotion
"Plug 'easymotion/vim-easymotion'

" vim-surround
Plug 'tpope/vim-surround'

" auto-pair
Plug 'jiangmiao/auto-pairs'


" EasyAlign
Plug 'junegunn/vim-easy-align'


call plug#end()
" === End Plugins





" === PLUG SETTING-------------------------------------------------- 



" === 
" === colorTheme
" === 

"let g:airline_theme='base16_harmonic16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#formatter = 'default'

" --> snazzy
"let g:SnazzyTransparent = 1
"colorscheme snazzy

" --> gruvbox
colorschem gruvbox
set background=dark

"let g:gruvbox_contrast_dark = '(soft)'
"let g:gruvbox_color_column = '(purple)'





" === 
" === Goyo
" === 
nmap <LEADER>gy :Goyo<CR>



" ===
" === EasyAlign
" ===
xmap ga <Plug>(EasyAlign)



" ===
" === auto-pair
" ===
let g:AutoPairsMapCh=0
"let g:AutoPairsFlyMode = 1



" === 
" === NERDTree
" === 
nmap tt :NERDTreeToggle<CR>
" change tree sign
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeDirArrowExpandable = '＞'
let g:NERDTreeDirArrowCollapsible = '∨'

" Window position
let g:NERDTreeWinPos='left'
" Window size
let g:NERDTreeWinSize=30
" Window show number
let g:NERDTreeShowLineNumbers=1
" Show hidden file
let g:NERDTreeHidden=1

let NERDTreeMapJumpNextSibling = ""
let NERDTreeMapJumpPrevSibling = ""





" ===
" ===FZF 
" ===
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>m :Marks<CR>
nnoremap <silent> <Leader>HH :History<CR>
nnoremap <silent> <Leader>H: :History:<CR>




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
nnoremap <Leader>C :IndentLinesToggle<CR>
"indent charactor with 'x'
"let g:indentLine_char = '┃│▕▏▕▕▕│▏▌┆║▕▏▏▏▌▍▎｜｜︱︳┊'
let g:indentLine_char = '│'
" different level indent 'x'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']




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
" === vim-surround
" ===
nmap <leader>sl yss
nmap <leader>sw ysiw
nmap <leader>st yst
" -->cs(char)(newChar)
" -->ds(char)
"  . to repeat last motion surround




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
nnoremap <silent> <Leader>cq :cclose<CR>

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
" === snippets 
" ===
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/vim/UltiSnips/', 'UltiSnips']




" ===
" === vim-Calendar
" ===
map <LEADER>cd :Calendar -position=here<CR>
map <LEADER>ck :Calendar -view=clock -position=here<CR>




" ===
" === ALE
" ===
nmap <silent> <Leader>ej <Plug>(ale_next_wrap)
nmap <silent> <Leader>ek <Plug>(ale_previous_wrap)
"let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=C11'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta




 "===
 "=== You Complete ME
 "===
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
"let g:ycm_autoclose_preview_window_after_completion=0
"let g:ycm_autoclose_preview_window_after_insertion=0
"let g:ycm_use_clangd = 1
let g:ycm_key_list_select_completion   = ['<TAB>', '<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
imap <silent> <C-l> <Plug>(YCMToggleSignatureHelp)
nmap <leader>gs <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>gd <Plug>(YCMFindSymbolInDocument)

let g:ycm_open_loclist_on_ycm_diags=0
let g:ycm_show_diagnostics_ui = 0     " Cancel error checking
let g:ycm_auto_hover=''
nmap <Leader>F <plug>(YCMHover)

"let g:ycm_add_preview_to_completeopt = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_min_num_of_chars_for_completion = 1

" add
let g:ycm_server_log_level = 'info'
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1

let g:ycm_key_invoke_completion = '<c-z>'   " open complement
noremap <c-z> <NOP>
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

set completeopt-=preview






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
