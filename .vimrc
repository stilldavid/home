set nocompatible

syntax on
filetype plugin on
filetype indent on

set list
set lcs=tab:>.     "show tabs
set lcs+=trail:·   "show trailing spaces
set lcs+=extends:# "show line wrap
set lcs+=nbsp:.    "show non breaking spaces

" trailing whitespace remover
"autocmd BufWritePre *.php :%s/\s\+$//e

" font
if has("gui_macvim")
  set guifont=Monaco:h10
endif

" do not beep at me
set novisualbell

" line numbers
set nu
set nowrap

" never write files, man. so lame.
set nobackup
set noswapfile

" hide open buffers instead of closing them
set hidden

" enable mouse for (a)ll, (n)ormal, (v)isual, (i)nsert, or (c)ommand line
" mode -- seems to work in most terminals
set mouse=a

" display commands as-typed + current position in file
set showcmd
set ruler

" keep lots of command-line history
set history=1500

" search 
set incsearch
set ignorecase
"set smartcase
"set gdefault
"set incsearch
"set showmatch
"set hlsearch
"nnoremap / /\v
"vnoremap / /\v

" display tab characters as 8 spaces, indent 2 spaces,
" always use spaces instead of tabs
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smarttab
set smartindent

" leader keys
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>a :Ack
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:let @/=''<CR>
nnoremap <leader>F /{/+1<CR>vi{:sort<CR>

" jj to get out of insert
inoremap jj <ESC>

" for gvim. no toolbar, otherwise these are the defaults:
set guioptions=aegimrLt

" turn off tab expansion for Makefiles
" au BufEnter ?akefile* set noexpandtab
" au BufLeave ?akefile* set expandtab
au FileType make setlocal noexpandtab

" split lines under the cursor
map K i<CR><Esc>g;

map <F2> :NERDTreeToggle<CR>
map <F3> :call FindInNERDTree()<CR>

" tab navigation like firefox
:nmap <C-S-tab> :tabprevious<CR>
:nmap <C-tab> :tabnext<CR>
:map <C-S-tab> :tabprevious<CR>
:map <C-tab> :tabnext<CR>
:imap <C-S-tab> <Esc>:tabprevious<CR>i
:imap <C-tab> <Esc>:tabnext<CR>i
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>
:imap <C-S-D> :CommandT<CR>
:imap <C-S-D> <Esc>:CommandT<CR>

" don't deselect indentation
:vnoremap < <gv
:vnoremap > >gv

" oh man, this is useful
nnoremap ; :

" clear searches
nmap <silent> ,/ :let @/=""<CR>

" forgot sudo?
cmap w!! w !sudo tee % >/dev/null

" retain view/folds
au BufWinLeave notes mkview
au BufWinEnter notes silent loadview

" colorscheme Murphy
colorscheme solarized
if has("gui_macvim")
  set transparency=5
  set background=dark
else
  set background=light
endif

"F7 WordProcessorOn
:map <F7> :set linebreak <CR> :set display+=lastline <CR> :set wrap <CR> :setlocal spell spelllang=en_us <CR>
"F8 WordProcessorOff
:map <F8> :set nowrap <CR> :set nospell <CR>

