" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif
execute pathogen#infect()

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype plugin on
set tabstop=2
set shiftwidth=2
set expandtab
set wildmenu
set confirm
set visualbell
set clipboard=unnamed

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

source /Users/josh/.vim/bundle/matchit/plugin/matchit.vim
source /Users/josh/.vim/bundle/ruby-matchit.vim

nmap s :w <enter>
nmap Q :q <enter>
nmap <space> i_<esc>r
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file
endif
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching
set nobackup
set nowritebackup
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
" map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

autocmd BufWritePre * :%s/\s\+$//e " get rid of white space on save
let html_no_rendering=1
let mapleader = ","
" map <leader>o :tabnew
map <leader>o :e
" map <leader>n :tabnext<ENTER>
" map <leader>b :tabprev<ENTER>
" map <leader>r :set colorcolumn=80<enter>
map <leader>r :so %<enter>
map <leader>rr :set colorcolumn=0<enter>
map <leader>1 :set invnu<enter>
map <leader>m :noh <enter>
map <leader>f <C-w>
map <leader>h <c-w>s
map <leader>v <c-w>v
map <leader>n <c-w>t<c-w>K
map <leader>b <c-w>t<c-w>H
" map <leader>t :TagbarOpenAutoClose <ENTER>
map <leader>p :NERDTreeToggle <enter>
noremap ! :mksession! .vim_session <CR> :qall!<enter>
noremap ~ :qall<enter>
inoremap jk <ESC>
vnoremap . :norm.<CR>
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256
set nu
filetype plugin indent on
syntax enable
set background=dark

" paydro's line numbers
" set relativenumber

" cursor line highlighting
" set cursorline
" hi CursorLine           term=NONE cterm=NONE guibg=#333333


colorscheme benokai

" ctrl p
map <leader>t :CtrlP <enter>
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode = ''
let g:ctrlp_follow_symlinks=1
let g:ctrlp_regexp = 1
let g:ctrlp_match_window = 'top, order:ttb, min:!, max:10, results:10'

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " " if the comment character for a given filetype happens to be @
  " " then use let Comment=
  " function CommentLines
  "   "let Comment=
  "     exe ":s@^@
  "       exe ":s@$@
  "       endfunction
  "       " map visual mode keycombo
  "       vmap co :call CommentLines
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif
