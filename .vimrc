set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

  " let Vundle manage Vundle - required
  Plug 'VundleVim/Vundle.vim'

  " really nice file tree:
  Plug 'scrooloose/nerdtree'

  " wrap common version control commands:
  Plug 'tpope/vim-fugitive'

  " commands for surrounding chars
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rsi'
  Plug 'tpope/vim-markdown'

  Plug 'scrooloose/nerdcommenter'

  " a bunch of colorschemes + a gui menu listing them
  Plug 'altercation/vim-colors-solarized'
  Plug 'chriskempson/base16-vim'

  " Plug 'sudar/vim-arduino-syntax'
  Plug 'fatih/vim-go'
  Plug 'mustache/vim-mustache-handlebars'

  " Plug 'nvie/vim-flake8'

  Plug 'davidhalter/jedi-vim'

  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'

  Plug 'garbas/vim-snipmate'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'majutsushi/tagbar'

  Plug 'scrooloose/syntastic'
  let g:syntastic_check_on_open = 1
  let g:syntastic_php_checkers = ['php']
  let g:syntastic_python_checkers = ['flake8']

call plug#end()

syntax on
filetype plugin indent on

set list
set lcs=tab:>-     "show tabs
set lcs+=trail:·   "show trailing spaces
set lcs+=extends:# "show line wrap
set lcs+=nbsp:.    "show non breaking spaces

" go lint
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

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
set smartcase
"set gdefault
"set incsearch
"set showmatch
"set hlsearch
"nnoremap / /\v
"vnoremap / /\v

" display tab characters as 8 spaces, indent 2 spaces,
" always use spaces instead of tabs
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smarttab
set smartindent

" leader keys
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>a :Ag
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:let @/=''<CR>
nnoremap <leader>F /{/+1<CR>vi{:sort<CR>

nnoremap <C-p> :FZF<cr>


"vim general ignores
set wildignore+=*.so,*.swp,*.zip,*.exe,*.dll,*.pyc,*.pdf,*.dvi,*.aux
set wildignore+=*.png,*.jpg,*.gif

let g:extesions_ignore = ['exe'
            \'bcf', 'bbl', 'blg', 'fdb_latexmk', 'gls', 'glg', 'alg', 'acr',
            \'run.xml', 'ist', 'glo', 'upb', 'upa', 'acn', 'svg', 'jpeg', 'jpg',
            \'png', 'pyc', '*.pyc']
let g:ignore_fzf = ['build', 'node_modules', 'venv', 'python2_source',
            \'_minted-', '.sass-cache', 'dist',
            \'.git', '.svn', '.hg', '.keep']

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

map <F9> :set invhlsearch<CR>:set invcursorcolumn<CR>:set invcursorline<CR>

" split window navigation (ctrl-j/k)
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>

nnoremap <F4> :noh<CR>

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
let base16colorspace=256  " Access colors present in 256 colorspace
" set termguicolors
colorscheme base16-tomorrow-night
" if has("gui_running")
"   " set transparency=5
"   set background=dark
" else
"   colorscheme Tomorrow
"   set background=light
" endif

"F7 WordProcessorOn
:map <F7> :set linebreak <CR> :set display+=lastline <CR> :set wrap <CR> :setlocal spell spelllang=en_us <CR>
"F8 WordProcessorOff
:map <F8> :set nowrap <CR> :set nospell <CR>

