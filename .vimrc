set nocompatible              " required
filetype off                  " required
filetype plugin on

" ----------------------- Vundle Setup ------------------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive' " Git Stuff
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'

" Javascript and Angular stuff
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'KabbAmine/gulp-vim'
Plugin 'groenewege/vim-less'
Plugin 'skammer/vim-css-color'

" Regular text file highlighting for taking notes
Plugin 'vim-scripts/Txtfmt-The-Vim-Highlighter'

" All of your Plugins must be added before the following line
call vundle#end('~/.vim/plugged')            " required

" -------------------------- End of Vundle Setup -------------------------

" -------------------------- Vim Plug Setup ------------------------------

call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'EdenEast/nightfox.nvim' 
call plug#end()

" -------------------------- End of Vim Plug Setup -----------------------

filetype plugin indent on    " required

" Autocompletion
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Switch themes with F5
call togglebg#map("<F5>")

" Tell NERDTree to hide pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"turn on numbering
set nu

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Set fonts
if has("gui_running")
    if has("gui_win32")
	set guifont=Bitstream\ Vera\ Sans\ Mono:h10
    endif
endif

"------------Javascript load libraries for syntax----------
" autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
" autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
let g:used_javascript_libs = 'underscore,angularjs'

"------------Start Python PEP 8 stuff----------------
" For Python files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" For non python files
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Flag unneeded white space
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" Keep indentation level from previous line:
autocmd FileType python set autoindent

"----------Colors and themes--------------------

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Always dark mode!
set background=dark

" Enable italics for gruvbox
let g:gruvbox_italic=1

" COLOR SCHEME HERE
colorscheme nightfox 

" ---------- For Windows -------------
" Some Windows GUI specific fixes
" backspace does not work on win gui
set backspace=indent,eol,start

" ---------- For Mac ---------------
