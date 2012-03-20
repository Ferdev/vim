" <Leader> key
let mapleader = ","

" Buffers events
"""""""""""""""""
autocmd BufEnter * :syntax sync fromstart

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" add jst syntax highlighting
au BufNewFile,BufRead *.ejs set filetype=html

"au BufRead,BufNewFile *.txt call s:setupWrapping()

"au BufWritePost *.coffee silent CoffeeMake! | cwindow | redraw!

" Removes trailing spaces in every line
autocmd BufWritePre * :%s/\s\+$//e

""""""""""""""""""""
" .vimrc stuff
" Source the vimrc file after saving it
if has("autocmd")
""autocmd bufwritepost .vimrc source $MYVIMRC
endif
nmap <leader>vrc :tabedit $MYVIMRC<CR>

set nocompatible

set rnu
set ruler
syntax on
call pathogen#infect()

" Set encoding
set encoding=utf-8

" Copy/pastes to/from system clipboard
set clipboard=unnamed

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <Leader>tt :TlistToggle<CR>
map <C-\> :tnext<CR>
let tlist_objc_settings    = 'objc;i:interface;c:class;m:method;p:property'

" Remember last location in file
"if has("autocmd")
""au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  ""\| exe "normal g'\"" | endif
"endif

function s:setupWrapping()
""set wrap
""set wrapmargin=2
""set textwidth=72
endfunction

function s:setupMarkup()
""call s:setupWrapping()
""map <buffer> <Leader>p :Hammer<CR>
endfunction

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>n :tabnew<CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Use modeline overrides
set modeline
set modelines=10


" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Show (partial) command in the status line
" set showcmd

" Include user's local vim config
" if filereadable(expand("~/.vimrc.local"))
"   source ~/.vimrc.local
" endif

" Make Nerd Tree smaller
" let NERDTreeWinSize=30

autocmd VimEnter * wincmd l

set wrap
set relativenumber
set hidden
set ttyfast
set timeout timeoutlen=300 ttimeoutlen=300
set wildignore+=*.jpg,*.jpeg,*.jpeg*,*.png,*.gif,*/public/uploads/*,*/.git/*,*/.bundle/*,*/bin/*,*/log/*,*/tmp/*,*/.sass-cache/*,*/.jhw-cache/*,*/node_modules/*

" fix regexes default regex handling by auto-inserting \v before every
" REGEX.
" Now regexs are Ruby compatible
"nnoremap / /\v
"vnoremap / /\v

" Map ESC to jj and save my pinky
imap jk <ESC>

" Switch between buffers
noremap <tab> <C-w><C-w>
" :bd deletes the current buffer (all windows of)
nmap <leader>d :bd<CR>

" get rid of annoying backup behaviour
set nobackup
set nowritebackup
set noswapfile

" ,a to Ack
nnoremap <leader>a :Ack

" Rotating among results in an ack search
map <C-n> :cn<CR>
map <C-p> :cp<CR>


" ease of use keyboard mappings (why do I care about top/bottom of screen?)
map H ^
map L $
" remap space bar to search
:nmap <Space> /

" Disable the regular keys to get me on the right track
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Better default behaviour with left and right
nnoremap j gj
nnoremap k gk

" easier quitting
" save and close all
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :q!<CR>

" Splits  ,v to open a new vertical split and switch to it
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>l
" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Plugin options

" autoclose plugin
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}', '|':'|' }
let g:AutoCloseProtectedRegions = ["Character"]

" don't need /g after :s or :g
set gdefault

nnoremap <CR> :noh<CR>

" Default color scheme
"set t_Co=256
"set background=dark
set term=screen-256color
colorscheme molokai

" tabs
map  <leader>0 0gt
map  <leader>1 1gt
map  <leader>2 2gt
map  <leader>3 3gt
map  <leader>4 4gt
map  <leader>5 5gt
map  <leader>6 6gt
map  <leader>7 7gt
map  <leader>8 8gt
map  <leader>9 9gt

" set cursorline
" highlight CursorLine guifg=white guibg=darkblue ctermfg=white ctermbg=darkblue
" autocmd InsertEnter * highlight CursorLine guifg=white guibg=blue ctermfg=white ctermbg=blue
" autocmd InsertLeave * highlight CursorLine guifg=white guibg=darkblue ctermfg=white ctermbg=darkblue
autocmd InsertEnter * setlocal cursorline
autocmd InsertLeave * setlocal nocursorline

" Ctrl-P config
silent! nnoremap <unique> <silent> <Leader>t :CtrlP<CR>
silent! nnoremap <unique> <silent> <Leader>b :CtrlPMRU<CR>
let g:ctrlp_regexp_search = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 50

" Powerline config
let g:Powerline_symbols = 'fancy'

" Formats json files
map <leader>jf  <Esc>:%!python -m json.tool<CR>

" VimRoom
nnoremap <silent> <Leader>vr :VimroomToggle<CR>
