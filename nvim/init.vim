call plug#begin('~/.nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'hsanson/vim-android'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'itchyny/lightline.vim'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'drmingdrmer/vim-tabbar'
Plug 'udalov/kotlin-vim'
Plug '907th/vim-auto-save'
call plug#end()
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:deoplete#enable_at_startup = 1
let g:JavaComplete_EnableDefaultMappings = 0
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:airline#extensions#tabline#enabled = 1
map <C-n> :NERDTreeToggle<CR>
map <C-t> :Te<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
set tabstop=3
set shiftwidth=3
set expandtab

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
set number
set nowrap
