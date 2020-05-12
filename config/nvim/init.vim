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
set noshowmode   " hide mode text, since it's already displayed by lightline

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
nmap <leader>g :RG<CR>
nmap <leader>d :Gdiff<CR>
nmap <leader>vm :e $MYVIMRC<CR>

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

nnoremap <leader>b :Buffers<CR>

" Rails
autocmd FileType ruby nmap <leader>t :TestFile --format documentation<CR>
autocmd FileType ruby nmap <C-N> :TestNearest<CR>
autocmd FileType ruby nmap <leader>l :TestLast<CR>
autocmd FileType ruby nmap <leader>rs :Estylesheet<space>
autocmd FileType ruby nmap <leader>rv :Eview<space>
autocmd FileType ruby nmap <leader>rj :Ejavascript<space>
autocmd FileType ruby nmap <leader>rm :Emodel<space>
autocmd FileType ruby nmap <leader>rc :Econtroller<space>

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bronson/vim-trailing-whitespace'
Plug 'fatih/vim-go'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'wellle/targets.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
call plug#end()

" Pretty colors
colorscheme nord
syntax enable

" Make switching between insert and normal mode faster
set timeoutlen=1000 ttimeoutlen=0

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = get(g:,'deoplete#ignore_sources',{})
let g:deoplete#ignore_sources.ruby = ['tag']

let g:lightline = {
  \ 'colorscheme': 'nord',
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

let g:loaded_ruby_provider = 0

let g:ale_fixers = { 'ruby': ['rubocop'] }

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
