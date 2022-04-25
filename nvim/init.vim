" Leader
let mapleader = " "
set encoding=utf-8
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set guicursor=
set noswapfile
set relativenumber
set number
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

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Octo Issues
nnoremap <leader>fi <cmd>Octo issue list<cr>
nnoremap <leader>ic <cmd>Octo issue close<cr>
nnoremap <leader>io <cmd>Octo issue reopen<cr>
nnoremap <leader>la <cmd>Octo label add<cr>
nnoremap <leader>ca <cmd>Octo comment add<cr>
nnoremap <leader>aa <cmd>Octo assignees add<cr>

" Open github
nnoremap <leader>gb <cmd>GBrowse<cr>

" Stop CoC by default (but Coc is enabled)
let g:coc_start_at_startup=0
nmap <leader>cc :<C-u>CocStart<CR>

" Mouse interaction
set mouse=a

" Disable Copilot on startup
let g:copilot_enabled = 0
nmap <leader>gp :<C-u>Copilot enable<CR>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile
    \ aliases.local,
    \zshenv.local,zlogin.local,zlogout.local,zshrc.local,zprofile.local,
    \*/zsh/configs/*
    \ set filetype=sh
  autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
  autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
  autocmd BufRead,BufNewFile vimrc.local set filetype=vim
augroup END

" ALE linting events
augroup ale
  autocmd!
  autocmd VimEnter *
    \ set updatetime=1000 |
    \ let g:ale_lint_on_text_changed = 0
    autocmd CursorHold * call ale#Queue(0)
    autocmd CursorHoldI * call ale#Queue(0)
    autocmd InsertEnter * call ale#Queue(0)
    autocmd InsertLeave * call ale#Queue(0)
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in fzf for listing files. Lightning fast and respects .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<Space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Set tags for vim-fugitive
set tags^=.git/tags


" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Open NERDTree with Control + O
nnoremap <C-o> <cmd>NERDTree<CR>

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <C-p> :Files<CR>

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" Set blamer delay to 500 ms
let g:blamer_delay = 3000
let g:blamer_enabled = 1

call plug#begin('~/.vim/plugged')
  Plug 'APZelos/blamer.nvim'
  Plug 'airblade/vim-gitgutter'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'morhetz/gruvbox'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/emmet-vim'
  Plug 'scrooloose/nerdtree'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'mbbill/undotree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'dense-analysis/ale'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'pwntester/octo.nvim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'andweeb/presence.nvim'
call plug#end()

colorscheme gruvbox
" lualine
lua << END
require('lualine').setup()
END

" removes whitespaces
fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhiteSpace()
