syntax on
set syntax=context
set encoding=utf-8
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set number relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

"set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
"Plug 'jremmen/vim-ripgrep'
Plug 'vim-utils/vim-man'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'mbbill/undotree'
"Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'godlygeek/tabular'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'xuhdev/vim-latex-live-preview' ", { 'for': 'tex' }

call plug#end()

colorscheme nord
set background=dark

if executable('rg')
	let g:rg_derive_root='true'
endif

let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:strlp_use_caching = 0

" Toggling line wraping
:function ToggleWrap()
: if (&wrap == 1)
:   set nowrap
: else
:   set wrap linebreak
: endif
:endfunction

map <F8> :call ToggleWrap()<CR>
map! <F8> ^[:call ToggleWrap()<CR>


" Python
let python_highlist_numbers = 1
let python_highligh_builtins = 1
let python_highlight_exceptions = 1
let python_highligh_space_errors = 1

" VimWiki
set nocompatible
filetype plugin on
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_list = [{
	\ 'path': '$HOME/sync/wiki',
	\ 'path_html':'$HOME/sync/wiki/.html',
	\ 'template_path': '$HOME/sync/wiki/.templates',
	\ 'template_default': 'default',
	\ 'template_ext': '.html'}]
nnoremap <Leader>c :VimwikiAll2HTML<CR>

" vim-live-latex-preview
let g:livepreview_previewer = 'zathura'
nnoremap <Leader>t :LLPStartPreview<CR>
set updatetime=1000

" Lightline
set noshowmode
let g:lightline = {
			\ 'colorscheme': 'nord',
			\ }
set laststatus=2

" MarkdownPreview
let g:mkdp_auto_close = 1
set updatetime=100

" NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Run Python with F9
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Converting file to .pdf
" nnoremap <Leader>p :hardcopy > %.ps | !ps2pdf %.ps && rm %.ps<CR>
map <F10> :hardcopy > %.ps <Bar> !ps2pdf %.ps && rm %.ps<CR>

" Copying and pasting
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> "c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Ctrl + Backspace deletes whole word
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>u :UndotreeShow<CR>
nnoremap <LMarkdownPrevieweader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>

nnoremap <silent> <Leader>- :vertical resize -5<CR>

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

nnoremap <silent> <Leader>mp :MarkdownPreview<CR>
nnoremap <silent> <Leader>vt :VimwikiTable<CR>
