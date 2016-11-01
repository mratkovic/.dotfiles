"set nocompatible              " be iMproved, required


" ======================= Spaces & Tabs =======================================
set tabstop=4           " 4 space tab
set softtabstop=4       " 4 space tab
set shiftwidth=4
set expandtab           " use spaces for tabs


" ====================== WHITESPACE ===========================================
" show trailing whitespaces as error
match ErrorMsg '\s\+$'

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" On write clear whitespaces
autocmd BufWritePre * :%s/\s\+$//e


" ==================== LINE NUMBERS ===========================================
" toggle relative numbers and normal line numbering
function! ToggleNumbersStyle()
    if(&relativenumber == 1)
     	set number
    	set norelativenumber
    else
        set relativenumber
    endif
endfunc

" toggle relative numbers and normal line numbering
function! ToggleNumbers()
    set nu!
endfunc

nnoremap <C-r> :call ToggleNumbersStyle()<cr>
nnoremap <C-n> :call ToggleNumbers()<cr>

" ==================== MISC ===================================================

" disable folding
set nofoldenable

" toggle paste mode
set pastetoggle=<F10>

" NerdTree
map <C-t> :NERDTreeToggle<CR>

" ======================= COLORS ==============================================

" Enable syntax highlighting
syntax enable

" set colorscheme
colorscheme hy

" Access nolors present in 256 colorspace
let base16colorspace=256


" ======================= GVim ===============================================
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=T  "remove toolbar
"set guioptions-=m  "remove menu bar
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>


" ==================== DRAG ===================================================
" drag plugin in visual mode
vmap  <expr>  h        DVB_Drag('left')
vmap  <expr>  l        DVB_Drag('right')
vmap  <expr>  j        DVB_Drag('down')
vmap  <expr>  k        DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()


" ======================= VUNDLE ==============================================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'

" " All of your Plugins must be added before the following line
call vundle#end()            " required


" ======================= YCM =================================================
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion =1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/ycm_extra_conf.py'

















