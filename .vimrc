set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

set diffexpr=MyDiff()
function MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	let eq = ''
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			let cmd = '""' . $VIMRUNTIME . '\diff"'
			let eq = '"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" Vim-LaTeX: {{{
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_ViewRule_pdf = 'Acrobat'

" }}}

filetype indent on

""""vim:fdm=marker:ff=unix:noet:ts=4:sw=4

"Learn Vim The Hard Way!

" Basic Settings {{{
echo ">^.^<"

let mapleader=","
set number
set relativenumber
set showmatch
set matchtime=2
" }}}

" Mappings {{{
noremap <leader>- ddp
noremap <leader>_ ddkP
inoremap <c-u> <esc>lvwUi
noremap <c-u> vwU<esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap <> <><esc>i
nnoremap <leader>' i'<esc>ea'<esc>b
nnoremap <leader>" i"<esc>ea"<esc>b
vnoremap <leader>" di""<esc>P 
noremap H 0
noremap L $
"the final killing machine!
inoremap jk <esc>
"and another one
inoremap <esc> <nop>
inoremap <Right> <nop> 
inoremap <Left> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
onoremap in@ :<c-u>execute "normal! /\\w\\+@[a-zA-Z_.]\\+\r:nohlsearch\rgn"<cr><cr>
" }}}

" Abbreviations {{{
iabbrev dthtml <!DOCTYPE HTML>
iabbrev @@ zzdzhangzzd@gmail.com
iabbrev ssig --<cr>Coldice Ray Esedra<cr>zzdzhangzzd@gmail.com
iabbrev mysite crez.sinaapp.com
" }}}

" FileType-specific settings {{{
augroup filetype_cpp
	autocmd!
	autocmd Filetype cpp setlocal wrap
	autocmd FileType cpp nnoremap <localleader>c I//<esc>
	autocmd filetype cpp :iabbrev <buffer> rt return
	autocmd filetype cpp :iabbrev <buffer> return NOPENOPENOPE
augroup END
augroup filetype_html
	autocmd!
	autocmd filetype html nnoremap <buffer> <localleader>f Vatzf
augroup END

augroup markdown
	autocmd!
	autocmd filetype markdown :onoremap ih :<c-u>execute "normal! ?^\\([=-]\\)\\1\\+$\r:nohlsearch\rkvg_"<cr><cr>
	autocmd filetype markdown :onoremap ah :<c-u>execute "normal! ?^\\([=-]\\)\\1\\+$\r:nohlsearch\rg_vk0"<cr><cr>
augroup END
"}}}
"
" Status Line {{{
set statusline=%F\ -\ FileType:\ %y "File path and type
set statusline+=%= "splitter
set statusline+=%c,\ %l/%L "colum, current line/ total line
set laststatus=2
" }}}

"Vimscript file settings ------------------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
