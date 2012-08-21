""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" basic settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set nowrap
set autoindent
set showmatch
set hlsearch
"set listchars=tab:\ \ ,trail:\ 
set listchars=trail:·,tab:»\ 
set invlist
syntax on
set synmaxcol=120
if exists('+colorcolumn')
  set colorcolumn=80
endif
highlight SpecialKey ctermfg=lightred guifg=lightred
set statusline=%<%{getcwd()}/\ \ %f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" diff mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set diffopt+=vertical
""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function FT_py()
    setlocal tabstop=4 \ 
    setlocal shiftwidth=4
    setlocal expandtab
    setlocal smarttab
endfunction
autocmd BufNewFile,BufRead *.py  call FT_py()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" GoLang
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function FT_go()
	setlocal makeprg=go\ build
endfunction
autocmd BufNewFile,BufRead *.go call FT_go() 
autocmd BufWritePost *.go :silent Fmt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""






""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" XML?
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:xml_syntax_folding=1 "XML folding
au FileType xml setlocal foldmethod=syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""






""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" for gvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
  set lines=60 columns=80
  if has("unnamedplus") " we can use the X11 clipboard by default
    set clipboard=unnamedplus
  endif
  "set guioptions-=m "menu bar
  set guioptions-=T "toolbar
  set guioptions-=r "right-hand scroll bar
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""







""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" for netrw browser
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_browsex_viewer= "xdg-open "
let g:netrw_list_hide='^\..*\.swp,^.*\.pyc$,^\..*$'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""







""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"conque
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-Space> :call conque_term#send_input()<CR>
imap <C-Space> <Esc>:call conque_term#send_input()<CR>
let g:ConqueTerm_SendVisKey='<C-Space>'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" my normal mode commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"basic navigation
map <C-j> <C-w>j<C-w>_
map <C-k> <C-w>k<C-w>_
map <C-h> <C-w>h<C-w>_
map <C-l> <C-w>l<C-w>_

"map : q:i
"map / q/i
"map ? q?i
"these were a little disorienting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""








"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Command commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command CleanWS :retab<CR>m`:%s:\s\+$::g<CR>``
command ClearBuffer Gvgg:d<CR>
function Make_scratch(name)
	execute ':e ' . a:name
	setlocal buftype=nofile
	setlocal bufhidden=hide
	setlocal noswapfile
endfunction
command -nargs=1 Scratch :call Make_scratch("<args>")
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

