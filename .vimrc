syntax on

" NeoBundle.vim
filetype off
if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle'))
endif

" colorschems
NeoBundle 'fugalh/desert.vim'

" life changing
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'tpope/vim-fugitive'

" unite sources
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'ujihisa/unite-colorscheme'

" language support
NeoBundle 'bbommarito/vim-slim'
NeoBundle 'depuracao/vim-rdoc'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'hallison/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'othree/html5.vim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'vim-ruby/vim-ruby'

NeoBundle 'davidoc/taskpaper.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 't9md/vim-surround_custom_mapping'
NeoBundle 'tyru/caw'

filetype plugin indent on

" indentation
set autoindent
set nosmartindent
set nocindent
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

set ambiwidth=double
set autoread
set autoread
set backspace=indent,eol,start
set nobackup
set nocompatible
set hidden
set hlsearch
set ignorecase
set smartcase
set incsearch
set wrapscan
set history=100
set laststatus=2
set list
set listchars=tab:>.,precedes:<,extends:>,eol:¬
set number
set ruler
set showmatch
set whichwrap=b,s,h,l,<,>,[,]
set complete=.,w,b,u,k,i
set completeopt=menu,preview,longest,menuone
set wildmenu
set wildmode=longest:full,list:longest
set scrolloff=100000
set splitbelow
set swapfile
set modeline
set showcmd
set showmode
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp
set encoding=utf-8
set termencoding=utf-8
set fileformats=unix,dos,mac
set directory=~/swp
set statusline=%<\ %f%=%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']['.&ft.']'}[%3l/%3L,%3c]

let mapleader   = ' '
let g:mapleader = ' '

nnoremap <Leader><Space> :update<CR>
nnoremap <ESC><ESC>      :nohlsearch<CR>

inoremap <buffer><expr> = smartchr#loop(' = ', ' == ', '=')

"" autocmd
"" screenに編集中のファイル名を出す
autocmd BufEnter *       if bufname("") !~ "^\[A-Za-z0-9\]://" | silent! exe '!echo -n "k%\\"' | endif
autocmd FileType sh      inoremap <buffer><expr> = smartchr#loop('=', ' != ')
autocmd FileType ruby    inoremap <buffer><expr> = smartchr#loop(' = ', ' == ', ' === ', '=')
autocmd FileType ruby    inoremap <buffer><expr> , smartchr#loop(',', ' => ')
autocmd FileType coffee  inoremap <buffer><expr> = smartchr#loop(' = ', ' == ', ' === ', '=')
autocmd FileType coffee  inoremap <buffer><expr> \ smartchr#one_of(' ->', '\')
autocmd FileType haskell setlocal et
autocmd FileType haskell inoremap <buffer><expr> = smartchr#loop(' = ', '=')
autocmd FileType haskell inoremap <buffer><expr> . smartchr#one_of(' -> ', '.')
autocmd FileType haskell inoremap <buffer><expr> , smartchr#one_of(' <- ', ',')

"" zencoding.vim
let g:user_zen_leader_key = '<C-e>'

" http://vim-users.jp/2010/07/hack161/
nnoremap   <sid>(command-line-enter) q:
xnoremap   <sid>(command-line-enter) q:
nnoremap   <sid>(command-line-norange) q:<C-u>
nmap     : <sid>(command-line-enter)
xmap     : <sid>(command-line-enter)

autocmd CmdwinEnter * call s:init_cmdwin()

function! s:init_cmdwin()
  nnoremap <buffer>       q     :<C-u>quit<CR>
  nnoremap <buffer>       <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr> <CR>  pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr> <C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr> <BS>  pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr> <C-h> col('.') == 1 ? "\<ESC>:quit\<CR>" : pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr> :     col('.') == 1 ? "VimProcBang " : col('.') == 2 && getline('.')[0] == 'r' ? "<BS>VimProcRead " : ":"
  inoremap <buffer><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  setlocal nonumber
  startinsert!
endfunction

" http://vim-users.jp/2009/07/hack42/
nnoremap <C-w>h <C-w>h:call <SID>good_width()<CR>
nnoremap <C-w>j <C-w>j:call <SID>good_width()<CR>
nnoremap <C-w>k <C-w>k:call <SID>good_width()<CR>
nnoremap <C-w>l <C-w>l:call <SID>good_width()<CR>

function! s:good_width()
  if winwidth(0) < 84
    vertical resize 84
  endif
endfunction

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3

inoremap <expr><CR>   neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><C-h>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>   neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
imap     <C-k> <Plug>(neocomplcache_snippets_expand)
smap     <C-k> <Plug>(neocomplcache_snippets_expand)
imap     <C-s> <Plug>(neocomplcache_start_unite_snippet)

" unite.vim
nnoremap <silent> ;                :<C-u>call <SID>unite_project('-start-insert')<CR>
nnoremap <silent> <Leader>o        :<C-u>UniteWithBufferDir buffer file_mru file<CR>
nnoremap <silent> <Leader>b        :<C-u>Unite buffer<CR>model
nnoremap <silent> <Leader>[        :<C-u>Unite outline<CR>
nnoremap <silent> <Leader>.        :<C-u>Unite source<CR>
nnoremap <silent> <Leader>'        :<C-u>Unite register<CR>
nnoremap <silent> <Leader>/r       :<C-u>Unite -start-insert -no-quit -default-action=split ref/refe<CR>
nnoremap <silent> <Leader>s        :<C-u>Unite -start-insert snippet<CR>
nnoremap <silent> <Leader>w        :<C-u>Unite -immediately window:no-current<CR>
nnoremap <silent> <Leader>r<Space> :<C-u>Unite source -start-insert -input=rails/<CR>
nnoremap <silent> <Leader>rc       :<C-u>Unite rails/controller<CR>
nnoremap <silent> <Leader>rv       :<C-u>Unite rails/view<CR>
nnoremap <silent> <Leader>rm       :<C-u>Unite rails/model<CR>
nnoremap <silent> <Leader>rh       :<C-u>Unite rails/helper<CR>

autocmd FileType unite call s:unite_local_settings()
function! s:unite_local_settings()
  nnoremap <silent><buffer><expr> <C-w>h unite#do_action('left')
  inoremap <silent><buffer><expr> <C-w>h unite#do_action('left')
  nnoremap <silent><buffer><expr> <C-w>l unite#do_action('right')
  inoremap <silent><buffer><expr> <C-w>l unite#do_action('right')
  nnoremap <silent><buffer><expr> <C-w>k unite#do_action('above')
  inoremap <silent><buffer><expr> <C-w>k unite#do_action('above')
  nnoremap <silent><buffer><expr> <C-w>j unite#do_action('below')
  inoremap <silent><buffer><expr> <C-w>j unite#do_action('below')
endfunction

function! s:unite_project(...)
  let opts = (a:0 ? join(a:000, ' ') : '')
  let dir = unite#util#path2project_directory(expand('%'))
  execute 'UniteWithBufferDir' opts 'buffer file_rec:' . dir
endfunction

" surround.vim
let g:surround_custom_mapping = {}
let g:surround_custom_mapping.ruby  = {
  \ '#': "#{\r}",
  \ }
let g:surround_custom_mapping.eruby = {
  \ '-': "<% \r %>",
  \ '=': "<%= \r %>",
  \ '#': "#{\r}",
  \ }

" indent-guides.vim
let g:indent_guides_auto_colors           = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent  = 5
let g:indent_guides_guide_size            = &sw

" colorscheme
function! s:caprice_colorscheme()
  let candidates = s:candidates_colorschemes()
  if len(candidates) <= 0
    return
  endif

  if has('reltime')
    " http://vim-users.jp/2009/11/hack98/
    let match_end = matchend(reltimestr(reltime()), '\d\+\.') + 1
    let pos = reltimestr(reltime())[match_end : ] % len(candidates)
  else
    let pos = 0
  endif

  execute 'colorscheme ' . candidates[pos]
endfunction

function! s:candidates_colorschemes()
  return map(split(globpath(&runtimepath, 'colors/*.vim'), '\n'), 'fnamemodify(v:val, ":t:r")')
endfunction

" autocmd BufEnter * call <SID>caprice_colorscheme()
if &term =~ 'xterm-256color'
  colorscheme desert256mod
else
  colorscheme desert
endif

" vim:set et:
