" Prithvi Reddy
" My basic .vimrc file, the 

"vundle {{{
set nocompatible                                    " Be iMproved
filetype off                                        " Turn off filetype detection 
set rtp+=~/.vim/bundle/Vundle.vim                   " Set runtime path to include Vundle
call vundle#begin()                                 " Begin list of plugins

Plugin 'VundleVim/vundle.vim'                       " Vundle
Plugin 'vim-airline/vim-airline'                    " Powerline statusline
Plugin 'vim-airline/vim-airline-themes'             " Powerline statusline
Plugin 'tomasr/molokai'                             " Molokai colorsheme
Plugin 'sjl/gundo.vim'                              " Improved undo tree navigation
Plugin 'rking/ag.vim'                               " Silver searcher integration
Plugin 'kien/ctrlp.vim'                             " Fuzzy file, buffer, mru, tag etc finder
Plugin 'scrooloose/nerdtree'                        " File structure navigation for project management
Plugin 'easymotion/vim-easymotion'                  " Corrected motions
Plugin 'vim-syntastic/syntastic'                    " Syntax checking plugin for vim

call vundle#end()                                   " End list of plugins.
filetype plugin indent on                           " Turn on plugin indentation
" }}}

" Colors {{{
syntax on                                           " Enable syntax highlighting
colorscheme molokai                                 " Set colorscheme
" }}}

" Motion settings {{{
set backspace=indent,eol,start                      " Change backspace behaviour
" }}}

" Spaces and Tabs {{{
set tabstop=4
set softtabstop=4
set expandtab
" }}}

" UI layout {{{
set number                                          " Standard line numbering
set relativenumber                                  " Relative line numbering
set showcmd                                         " Show command history
set cursorline                                      " Highlight cursor line
set wildmenu                                        " Show menu 
set showmatch                                       " Show matching braces
" }}}

" Airline Setup {{{
set laststatus=2                                    " Always display statusline
let g:airline#extensions#tabline#enabled=1          " Enable tabline
let g:airline#extensions#tabline#show_buffers=0     " Dont show buffers in tagline
let g:airline_theme='molokai'                       " Set a consistent airline theme
" }}}

" Searching {{{
set incsearch                                       " Incremental search
set hlsearch                                        " Highlight all searched
" }}}

" CtrlP configuration {{{
let g:ctrlp_match_window = 'bottom,order:ttb'       " Order matching files top to bottom
let g:ctrlp_switch_buffer = 0                       " Always open  file in a new buffer
let g:ctrlp_working_path_mode = 0                   " Set ctrlp to respect changes in working directory
" }}}

" Completion and Snippets {{{
" }}}

" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
" }}}

" Folding {{{
set foldenable                                      " Enable folding
set foldmethod=indent                               " Indentation based folding
" }}}

" Backups {{{
" Move backups to the /tmp folder (Or whichever is available)
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp/,~tmp,/var/tmp,/tmp
set writebackup
" }}}

" Leader Shortcuts {{{
let mapleader=","                                   " Remap leader key from \ to , 
nnoremap <leader>u :GundoToggle|                    " super-undo gundo tree
nnoremap <leader>ev :vsp $MYVIMRC<CR>|              " vim open .vimrc   
nnoremap <leader>ez :vsp ~/.zshrc<CR>|              " vim open .zshrc
nnoremap <leader>sv :source $MYVIMRC<CR>|           " resource .vimrc
nnoremap <leader>ip :PluginInstall<CR>|             " install pluggins
nnoremap <leader>s :mksession<CR>|                  " super save session
nnoremap <leader><space> :nohlsearch<CR>|           " end search highlighting
nnoremap <leader>a :Ag |                            " pull up the silver searcher
nnoremap <leader>f :CtrlP |                         " pull up fuzzy file search
nnoremap <leader>n :NERDTreeToggle<CR>|             " navigate filestructure with nerdtree 
" }}}

" Custom Functions {{{
function! NumberToggle()
    if(&relativenumber==1)
        set number
    else
        set relativenumber
    endif
endfunc 
" }}}

" Training Keybindings {{{
" }}}

" Custom Keybindings {{{
inoremap jk <esc>|                                  " remap esc to 
noremap gV `[v`]|                                   " highlight last inserted block
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" }}}

" Misc {{{
set modelines=1                                     " Set number of modelines
" }}}

" vim:foldmethod=marker:foldlevel=0
