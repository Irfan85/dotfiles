" Use Vim settings rather than Vi settings. It will make vim faster.
set nocompatible

" Initialize Vundle plugin manager
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'valloric/youcompleteme'
" Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" Working with Git ----------------------------------------------
Plugin 'Raimondi/delimitMate'
" Opening man pages-----------------------------------------------
Plugin 'jez/vim-superman'
" Navigating splits
Plugin 'christoomey/vim-tmux-navigator'
" Syntax plugins ------------------------------------------------
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'cakebaker/scss-syntax.vim'
" Align CSV files at commas, align Markdown tables, and more
Plugin 'godlygeek/tabular'
" Automaticall insert the closing HTML tag
Plugin 'HTML-AutoCloseTag'

" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on
" Done with initializing Vundle plugin manager

" Initialize Powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
" Done with initializing Powerline

" Always show the statusbar
set laststatus=2

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" ----- Plugin-Specific Settings --------------------------------------

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- jez/vim-superman settings -----
noremap K :SuperMan <cword><CR>

" ----- Plugin-Specific Settings --------------------------------------

" ----- General Settings ----------------------------------------------

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=1000       " keep 1000 lines of command line history
set number             " line numbers
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set incsearch          " do incremental searching
set hlsearch           " highlight search results
set linebreak          " wrap lines on 'word' boundaries
set scrolloff=3        " don't let the cursor touch the edge of the viewport
set splitright         " Vertical splits use right half of screen
set timeoutlen=100     " Lower ^[ timeout
set fillchars=fold:\ , " get rid of obnoxious '-' characters in folds
set tildeop            " use ~ to toggle case as an operator, not a motion
if exists('&breakindent')
  set breakindent      " Indent wrapped lines up to the same level
endif

" Tab settings
set expandtab          " Expand tabs into spaces
set tabstop=2          " default to 2 spaces for a hard tab
set softtabstop=2      " default to 2 spaces for the soft tab
set shiftwidth=2       " for when <TAB> is pressed at the beginning of a line

" Enable mouse input
set mouse=a

" ----- General Settings ----------------------------------------------

