set nocompatible              " required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
"filesystem
Plug 'kien/ctrlp.vim'
"Plug 'scrooloose/nerdtree'
"Plug 'jistr/vim-nerdtree-tabs'
"git 
Plug 'tpope/vim-fugitive'
"html
"Plug 'isnowfy/python-vim-instant-markdown'
Plug 'jtratner/vim-flavored-markdown'
"Plug 'suan/vim-instant-markdown'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

Plug 'nelstrom/vim-markdown-preview'

"python syntax checker
Plug 'vim-syntastic/syntastic'
"Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
"auto-completion
Plug 'Valloric/YouCompleteMe'
"Plug 'klen/rope-vim'
"Plugin 'davidhalter/jedi-vim'
"Plug 'ervandew/supertab'
"code folding
Plug 'tmhedberg/SimpylFold'

Plug 'jnurmine/Zenburn'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"let lastatus=2
"evernote itegration
"Plug 'neilagabriel/vim-geeknote'
call plug#end()

" vim-airline
let g:airline#extensions#tabline#enabled = 1
filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1
" vim-instant-markdown
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

"custom keys
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
"call togglebg#map("<F5>")
colorscheme zenburn
set guifont=Monaco:h14

"let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"I don't like swap files
set noswapfile

"turn on numbering
set nu

"python with virtualenv support
py3 << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=80

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za 
let g:SimpylFold_docstring_preview=1
set foldlevel=99
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

"generel 
set hlsearch
set tw=80
let g:ctrlp_follow_symlinks=1
"---- OLD
"filetype plugin indent on
"set tw=80
"set number 
"" Enable folding
"set foldmethod=indent
"set foldlevel=99
"nnoremap <space> za
""show docstring of the fold
"let g:SimpylFold_docstring_preview=1
"au BufNewFile,BufRead *.py
"    \ set tabstop=4 |
"    \ set softtabstop=4 |
"    \ set shiftwidth=4 |
"    \ set textwidth=79 |
"    \ set expandtab |
"    \ set autoindent |
"    \ set fileformat=unix
"au BufNewFile,BufRead *.js, *.html, *.css
"    \ set tabstop=2 |
"    \ set softtabstop=2 |
"    \ set shiftwidth=2 
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"set encoding=utf-8
"
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
""python with virtualenv support
"py3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF
"
"let python_highlight_all=1
"syntax on
""system clipboard (? works on osx) 
"set clipboard=unnamed
