"set nocompatible              " be iMproved, required

set tabstop=4
set shiftwidth=4
:let mapleader = "\\"

" show trailing whitespaces as error
match ErrorMsg '\s\+$'
syntax enable

" show statusline, laststatus
" set ls=2


"======================= GVim ================================================
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set guioptions-=T  "remove toolbar
":set guioptions-=m  "remove menu bar
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>


"====================DRAG=====================================================
vmap  <expr>  h        DVB_Drag('left')
vmap  <expr>  l        DVB_Drag('right')
vmap  <expr>  j        DVB_Drag('down')
vmap  <expr>  k        DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

"======================= VUNDLE ===============================================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'dag/vim2hs'
Bundle 'bling/vim-airline'
Bundle 'jordwalke/flatlandia'
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'
Plugin 'itchyny/lightline.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion =1

"Syntastics

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

let g:syntastic_cpp_compiler_options = ' -std=c++11'


let g:haskell_conceal              = 0

"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ }
"set laststatus=2
"set noshowmode
" ====================== WHITESPACE ==============================================

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" On write clear whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Trims trailing White Spaces
function! TrimWS()
     %s/\s\+$//e
endfunction


" Access nolors present in 256 colorspace
let base16colorspace=256

" disable folding
set nofoldenable

"==================== LINE NUMBERS ===============================================
" relatice numbering -- used to jumping around the file
function! RelativeNumberOff()
    set number
    set norelativenumber
endfunc

" toggle relative numbers and normal line numbering
function! ToggleNumbersStyle()
    if(&relativenumber == 1)
        call RelativeNumberOff()
    else
        set relativenumber
    endif
endfunc

" toggle relative numbers and normal line numbering
function! ToggleNumbers()
    set nu!
endfunc


"nnoremap <C-r> :call ToggleNumbersStyle()<cr>
nnoremap <C-n> :call ToggleNumbers()<cr>

" toggle paste mode
set pastetoggle=<F10>

" set colorscheme
colorscheme hy
