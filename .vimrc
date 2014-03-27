set nocompatible

" this sets up vundle to manage plugins
" https://github.com/gmarik/vundle
" to use:
"   mkdir -p ~/.vim/bundle
"   git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"   vim +BundleInstall

" <vundle-config>

  filetype off

  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  " let Vundle manage Vundle - required
  Bundle 'gmarik/vundle'

  " really nice file tree:
  Bundle 'scrooloose/nerdtree'

  " align text vertically on a string:
  Bundle 'Align'

  " wrap common version control commands:
  Bundle 'vcscommand.vim'
  Bundle 'tpope/vim-fugitive'

  " commands for surrounding chars
  Bundle 'tpope/vim-surround'
  Bundle 'tpope/vim-repeat'

  " a bunch of colorschemes + a gui menu listing them
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'chriskempson/vim-tomorrow-theme.git'
  Bundle 'ColorSchemeMenuMaker'

  Bundle "sudar/vim-arduino-syntax"

  " match lots of things
  Bundle 'edsono/vim-matchit'

  Bundle "MarcWeber/vim-addon-mw-utils"
  Bundle "tomtom/tlib_vim"
  Bundle "stilldavid/vim-snippets"

  Bundle "garbas/vim-snipmate"

  Bundle 'lunaru/vim-less'

  Bundle 'L9'
  Bundle 'FuzzyFinder'
  Bundle 'mileszs/ack.vim'
  " Bundle 'surround.vim'
  Bundle 'ctrlp.vim'

  Bundle 'majutsushi/tagbar'

  Bundle 'scrooloose/syntastic'
  let g:syntastic_check_on_open = 1
  let g:syntastic_php_checkers = ['php']

" </vundle-config>

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
"
" add git status to statusline; otherwise emulate standard line with ruler
set statusline=%<%{fugitive#statusline()}\ %f\ %{tagbar#currenttag('%s()','')}\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set ls=2


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

" Map <CTRL>-O to run PHP parser check
noremap <C-O> :!php -l %<CR>

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

" split window navigation (ctrl-j/k)
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>

" tab navigation like firefox
:nmap <C-S-tab> :tabprevious<CR>
:nmap <C-tab> :tabnext<CR>
:nmap <F6> :TagbarToggle<CR>
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
colorscheme Tomorrow-Night
if has("gui_macvim")
  set transparency=5
  set background=dark
else
  colorscheme Tomorrow
  set background=light
endif

"F7 WordProcessorOn
:map <F7> :set linebreak <CR> :set display+=lastline <CR> :set wrap <CR> :setlocal spell spelllang=en_us <CR>
"F8 WordProcessorOff
:map <F8> :set nowrap <CR> :set nospell <CR>

