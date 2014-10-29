" General {{{
" ===========

set nocompatible

call pathogen#infect()

filetype on
filetype plugin on
filetype plugin indent on

set backspace=indent,eol,start
set incsearch
set noignorecase
set nostartofline
set number
set ruler
set scrolloff=3
set showcmd
set showmatch
set splitright
set t_vb=''
set wrap

" Arrow keys move by screen lines rather than file lines
noremap <Up> gk
noremap <Down> gj

" }}}

" Persistence (history, swap, backup and undo) {{{
" ================================================

set history=5000
set viminfo='1024,<0,s100,f0,r/tmp,r/mnt

" Swap files
set dir=~/.vim/_swap//

" Backup files
set backup
set backupdir=~/.vim/_backup/,~/.tmp,.

" Undo files
set undofile
set undodir=~/.vim/_undo/
" }}}

" Encoding {{{
" ============

set encoding=utf-8
set fileencoding=utf-8

" }}}

" Syntax highlighting {{{
" =======================

syntax on

" Highlight tabs and trailing spaces
set list listchars=tab:»·,trail:·
autocmd ColorScheme * highlight SpecialKey guifg=#666

" }}}

" Indentation {{{
" ===============

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

" Filetype-specific indentation settings
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab

vnoremap > >gv
vnoremap < <gv
vmap <Tab> >
vmap <S-Tab> <

" }}}

" Interface {{{
" =============

" NERD_tree
map <F2> :NERDTreeToggle<CR>

" Status line
set laststatus=2
set statusline=%f\ %2*%m\ %1*%h%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}\ %{getfperm(@%)}]\ 0x%B\ %12.(%c:%l/%L%)

" Command mode completion
set wildmode=longest,list
set wildmenu
set wildignore=*.o,*.hi,*.class

" Omni completion
imap <C-Space> <C-X><C-O>
set ofu=syntaxcomplete#Complete
set completeopt=longest,menu

" Folds
function! FoldText()
    let numlines = v:foldend - v:foldstart
    let firstline = getline(v:foldstart)

    return printf("%3d » %s ", numlines, firstline)
endfunction

set foldtext=FoldText()
set fillchars=fold:.
set foldcolumn=0
set foldmethod=marker
set foldlevelstart=1

set foldenable

" }}}

" GUI Specific {{{
" ================

set guifont=Monospace\ 11

" Remove toolbar and menu
set guioptions-=T
set guioptions-=m
" }}}

" Filetype specific stuff {{{
" ===========================

" Haskell
let g:no_haskell_conceal = 1

" }}}
