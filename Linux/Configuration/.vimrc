"=================== Vundle ===================="
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'scrooloose/nerdtree'
"Plugin 'tomtom/tcomment_vim'
"
"Plugin 'vim-scripts/AutoComplPop'
Plugin 'mattn/emmet-vim'
"Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Chiel92/vim-autoformat'
Plugin 'pangloss/vim-javascript'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neocomplete.vim'
Plugin 'w0rp/ale'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

""==================== NerdTree ===================="
""Automatically open NerdTree
"autocmd vimenter * NERDTree
""Automatically open NerdTree , No files
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""Exit if Only NerdTree left
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""Default Arrows and some variables
"let g:NERDTreeWinSize=20
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
""I : Toggle Hidden Files or let NERDTreeShowHidden=1
""Mapping"
"map <leader>nt :NERDTreeToggle<cr>
"map <leader>nb :NERDTreeFromBookmark
"map <leader>nf :NERDTreeFind<cr>

"====================  ===================="




"==================== Swap Windows  ===================="
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>wm :call DoWindowSwap()<CR>

"====================  ===================="

"==================== Basic Configuration ===================="
let mapleader = ","
set timeoutlen=1000 "1000ms leader is active


set number
set relativenumber

set wildmenu
set wildmode=list:longest,full

set mouse=a
set showcmd
set lazyredraw
set encoding=utf-8
set ttyfast
set showmatch
set matchtime=3

set incsearch
set hlsearch

syntax enable
set background=dark
"set t_Co = 256
"colorscheme Tomorrow-Night

filetype plugin on
"set omnifunc=syntaxcomplete#Complete
"au FileType php setl ofu=phpcomplete#CompletePHP
"au FileType ruby,eruby setl ofu=rubycomplete#Complete
"au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
"au FileType c setl ofu=ccomplete#CompleteCpp
"au FileType css setl ofu=csscomplete#CompleteCSS
au BufNewFile,BufRead *.nut setf c


let g:html_indent_inctags = "main"
imap ,/ </<C-X><C-O>



set autoindent
set scrolloff=999
set scrolloff=10 "Always show 10 lines below the cursor


set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4

"Status Line"
set laststatus=2	"Always display status line
set statusline=%f%m%r%h%w\ [FORMAT=%{&ff}]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]


"================ Mappings ============== "


"Paste without extra tabs "copy to clipboard   +clipboard needed gvim, sudo
"write, reload vim 

set pastetoggle=<F2>
map <F3> "+y
map <F4>  :w !sudo tee %
map <F5> :source ~/.vimrc<CR>


"Esc-Esc = Save"
map <Esc><Esc> :w<Cr>


noremap <F6> :Autoformat<CR>




" resize window "
nnoremap <leader>+ :res +1<CR>
nnoremap <leader>_ :res -1<CR>
nnoremap <leader>- :vertical resize -1<CR>
nnoremap <leader>= :vertical resize +1<CR>

let g:user_emmet_leader_key='<leader><leader>'
let g:formatterpath = ['/usr/lib/node_modules/' ]


"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'


"Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_html_checkers = ['']
"let g:syntastic_css_checkers= ['']
"let g:syntastic_javascript_checkers= ['eslint']
"let g:syntastic__checkers= ['']
"let g:syntastic__checkers= ['']
"let g:syntastic__checkers= ['']
"let g:syntastic__checkers= ['']
"let g:syntastic__checkers= ['']



"Switch Windows
"Ctrl-h behaves like backspace"
"if exists('$TMUX')
"     nmap <BS> <C-W>h     
"endif

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"manually make directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//


"Autosave
"autocmd TextChanged,TextChangedI <buffer> silent write

"gt, gT , n gt
"create new tab
noremap <leader>tn :tabnew 
noremap <leader>tm :tabmove  
noremap <leader>tc :tabclose
noremap <leader>to :tabonly
noremap <leader>td :tabdo 

" Go to tab by number
"noremap <leader>1 1gt
"noremap <leader>2 2gt
"noremap <leader>3 3gt
"noremap <leader>4 4gt
"noremap <leader>5 5gt
"noremap <leader>6 6gt
"noremap <leader>7 7gt
"noremap <leader>8 8gt
"noremap <leader>9 9gt
"noremap <leader>0 :tablast<cr>

" Go to last active tab

au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> < :exe "tabn ".g:lasttab<cr>
vnoremap <silent> > :exe "tabn ".g:lasttab<cr>








"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'









"Use `` to jump back to the exact position 
":-d
"cuts the line above the current line.
"
":-5d
"cuts the 5th line above the current line (but moves the cursor).
"
":-5,-d
"cuts the 5 lines above the current line.
"
":+,+5d
"cuts the 5 lines below the current line.
