set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tomasr/molokai'
Plugin 'Yggdroot/indentLine'
Plugin 'tomtom/tcomment_vim'

call vundle#end()
filetype plugin indent on

set t_Co=256
set encoding=utf-8
set number
set shiftwidth=4
set expandtab
set hlsearch
set synmaxcol=128

" Bind Ctrl+s to save file
map <C-s> :w<CR>

syntax on

colorscheme molokai

let g:rehash256 = 1
let g:indentLine_color_term = 5

"vim-tmux window panning
if $TMUX != ''
    " integrate movement between tmux/vim panes/windows

    fun! TmuxMove(direction)
    " Check if we are currently focusing on a edge window.
    " To achieve that,  move to/from the requested window and
    " see if the window number changed
    let oldw = winnr()
    silent! exe 'wincmd ' . a:direction
    let neww = winnr()
    silent! exe oldw . 'wincmd'
    if oldw == neww
      " The focused window is at an edge, so ask tmux to switch panes
      if a:direction == 'j'
        call system("tmux select-pane -D")
      elseif a:direction == 'k'
        call system("tmux select-pane -U")
      elseif a:direction == 'h'
        call system("tmux select-pane -L")
      elseif a:direction == 'l'
        call system("tmux select-pane -R")
      endif
    else
      exe 'wincmd ' . a:direction
    end
    endfun
    nnoremap <silent> <c-w>j :silent call TmuxMove('j')<cr>
    nnoremap <silent> <c-w>k :silent call TmuxMove('k')<cr>
    nnoremap <silent> <c-w>h :silent call TmuxMove('h')<cr>
    nnoremap <silent> <c-w>l :silent call TmuxMove('l')<cr>
    nnoremap <silent> <c-w><down> :silent call TmuxMove('j')<cr>
    nnoremap <silent> <c-w><up> :silent call TmuxMove('k')<cr>
    nnoremap <silent> <c-w><left> :silent call TmuxMove('h')<cr>
    nnoremap <silent> <c-w><right> :silent call TmuxMove('l')<cr>
endif