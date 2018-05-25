" Some useful mappings
let mapleader=","

" So we can specify lines more easily
set number
set relativenumber
set autoread          " reload files when changed on disk, i.e. via `git checkout`
set incsearch         " search as you type
set number            " show line numbers
set ruler             " show where you are

" Wrap lines
set wrap
set textwidth=0
set wrapmargin=0
set conceallevel=0

set smartindent
set autoindent
set expandtab tabstop=2 shiftwidth=2

set ignorecase
set smartcase

set noshowmode

set shell=zsh

if has("autocmd")
  filetype indent plugin on
endif
set omnifunc=syntaxcomplete#Complete
autocmd BufRead,BufNewFile *.es6 setfiletype javascript


" Fix weird C-W mapping issue in nvim
if has('nvim')
  nmap <BS> <C-W>h
endif

nmap <leader>q :q<CR>
nmap <leader>w :w<CR>
nmap <leader>x :x<CR>
nmap <leader>f :FZF<CR>
nmap <leader>g :Rg<space>

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

nnoremap <leader>b :ls<CR>:b<space>

" Rails
autocmd FileType ruby nmap <leader>t :TestFile --format documentation<CR>
autocmd FileType ruby nmap <leader>rs :Estylesheet<space>
autocmd FileType ruby nmap <leader>rv :Eview<space>
autocmd FileType ruby nmap <leader>rj :Ejavascript<space>
autocmd FileType ruby nmap <leader>rm :Emodel<space>
autocmd FileType ruby nmap <leader>rc :Econtroller<space>

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin()
"Plug 'ap/vim-css-color'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/echodoc.vim'
Plug 'airblade/vim-gitgutter'
Plug 'neomake/neomake'
Plug 'bkad/CamelCaseMotion'
Plug 'bronson/vim-trailing-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'justinmk/vim-sneak'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhinz/vim-janah'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/gem-ctags'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
"Plug 'roxma/nvim-completion-manager'
"Plug 'w0ng/vim-hybrid'
Plug 'wellle/targets.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'janko-m/vim-test'
"Plug 'zchee/deoplete-go', { 'do': 'make'}
call plug#end()

" Pretty colors
"syntax enable
set synmaxcol=200
"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
set background=dark
"colorscheme hybrid
"colorscheme hybrid_material
syntax enable

"let g:airline_powerline_fonts = 0
"let g:airline_theme = 'hybridline'

" Make switching between insert and normal mode faster
set timeoutlen=1000 ttimeoutlen=0

let g:splitjoin_ruby_hanging_args = 0

" Camel case mappings
nmap <leader>cw <Plug>CamelCaseMotion_w
nmap <leader>cb <Plug>CamelCaseMotion_b
nmap <leader>ce <Plug>CamelCaseMotion_e
nmap <leader>cge <Plug>CamelCaseMotion_ge

" When writing a buffer, and on normal mode changes (after 750ms).
"call neomake#configure#automake('nw', 750)
"let g:neomake_open_list = 2

" Use deoplete.
let g:deoplete#enable_at_startup = 1

let g:tmuxline_powerline_separators = 0

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'component': {
  \   'readonly': '%{&readonly?"⭤":""}',
  \ }
\ }

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
set updatetime=100
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>t <Plug>(go-test)
