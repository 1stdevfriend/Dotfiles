set number
set relativenumber
set cindent
set nocompatible
filetype off

" Vundle runtime
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'mileszs/ack.vim'   
  Plugin 'vim-scripts/taglist.vim'
call vundle#end()            " required
filetype plugin indent on    " required
" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set expandtab
au BufRead,BufNewFile *.h set expandtab
au BufRead,BufNewFile Makefile* set noexpandtab
let g:rainbow_active = 1

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab          " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set encoding=utf-8
set t_Co=256

" ````````````````````````````````````````````````````````````````````````````
" NERD TREE with Ctrl + O
" ````````````````````````````````````````````````````````````````````````````
map <C-o> :NERDTreeToggle<CR>
nnoremap <silent> ff :Files<CR>
nnoremap <silent> gs :Gstatus <CR>
nnoremap <silent> rh :split <CR>
nnoremap <silent> rv :vsplit <CR>

" ````````````````````````````````````````````````````````````````````````````
" Vim-emoji operations
" ````````````````````````````````````````````````````````````````````````````
for e in emoji#list()
      call append(line('$'), printf('%s (%s)', emoji#for(e), e))
endfor
set completefunc=emoji#complete
" %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g

" ````````````````````````````````````````````````````````````````````````````
" Tab Operations
" ````````````````````````````````````````````````````````````````````````````
nnoremap <C-t>h :tabp<cr>
nnoremap <C-t>l :tabn<cr>
nnoremap <C-t>n :tabnew<cr>
nnoremap <C-t>q :tabclose<cr>

" ````````````````````````````````````````````````````````````````````````````
" Emoji for git gutter
" ````````````````````````````````````````````````````````````````````````````
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')

" ````````````````````````````````````````````````````````````````````````````
" Split operations 
" ````````````````````````````````````````````````````````````````````````````
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" make backspaces more powerful
set backspace=indent,eol,start
set laststatus=2
set ruler               " show line and column number
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line
call plug#begin('~/.vim/plugged')
    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/vim-emoji'
    Plug 'junegunn/vim-easy-align'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'frazrepo/vim-rainbow'
    Plug 'tpope/vim-fugitive'
    Plug 'powerline/powerline'
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter' 
    Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'airblade/vim-gitgutter'
    Plug 'itchyny/lightline.vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'airblade/vim-gitgutter'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-surround'
    Plug 'w0rp/ale'
call plug#end()
