set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set guicursor=
set noswapfile
set relativenumber
set number
set nobackup
set undodir=~/.vim/undodir
set undofile
set nowrap
set signcolumn=yes
set scrolloff=8
set nohlsearch
set hidden
set noshowmode
set signcolumn=yes
set lazyredraw
set t_Co=256

" Leader key
let mapleader = " "

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" moving things up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" moving windows 
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" vertical resize
nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

" leader control to source vim file
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" resize to latest window
nnoremap <leader>rp :resize 100<CR>

" paste from clipboard
vnoremap <leader>p "_dP

" copy to clipboard
vnoremap <leader>y "+y
noremap <leader>y "+y
nnoremap <leader>Y gg"+yG

call plug#begin('~/.vim/plugged')
    Plug 'nvim-lua/plenary.nvim'

    " We recommend updating the parsers on update
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'gruvbox-community/gruvbox'
call plug#end()

" removes whitespaces
fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhiteSpace()
