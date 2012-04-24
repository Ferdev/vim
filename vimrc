" Changes leader key
let mapleader                      = ","
let tlist_objc_settings            = 'objc;i:interface;c:class;m:method;p:property'

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

syntax on
call pathogen#infect()

" Buffers events
"""""""""""""""""
au VimEnter * wincmd l
au BufEnter * :syntax sync fromstart
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.ejs  set filetype=html
au BufNewFile,BufRead *.tpl  set filetype=html.erb
au BufNewFile,BufRead *.vimrc  set filetype=vim
au BufRead,BufNewFile *.txt call s:setupWrapping()
au BufWritePre * kz|:%s/\s\+$//e|'z " Removes trailing spaces in every line
au insertenter * setlocal cursorline   " Highlights on cursor line in insert mode
au insertleave * setlocal nocursorline " Highlights off cursor line in normal mode

"au BufWritePost *.coffee silent CoffeeMake! | cwindow | redraw!

" Reloads vimrc file after saving it
augroup AutoReloadVimRC
  au!
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

""""""""""""""""""""""""""""""""""""""""""""
" Settings                                 "
""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                           " Old-vim Rest In Peace
set rnu                                    " Activates relative line numbers
set ruler                                  " Activates ruler
set encoding=utf-8                         " Set encoding
set clipboard=unnamed                      " Copy/pastes to/from system clipboard
set viminfo+=n~/.vim/viminfo               " viminfo stores the the state of your previous editing session
""""""""""""""""""""""""""""""""""""""""""""
set nowrap                                 " Whitespace stuff
set tabstop=2                              " Whitespace stuff
set shiftwidth=2                           " Whitespace stuff
set softtabstop=2                          " Whitespace stuff
set expandtab                              " Whitespace stuff
set list listchars=tab:\ \ ,trail:·        " Whitespace stuff
""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                               " Search stuff
set incsearch                              " Search stuff
set ignorecase                             " Search stuff
set smartcase                              " Search stuff
""""""""""""""""""""""""""""""""""""""""""""
set wildmode=list:longest,list:full        " Tab completion
""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2                           " Status bar
set modelines=5                            " Status bar
""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start             " allow backspacing over everything in insert mode
""""""""""""""""""""""""""""""""""""""""""""
set background=dark                        " Default color scheme
set term=screen-256color                   " Default color scheme
colorscheme molokai                        " Default color scheme
""""""""""""""""""""""""""""""""""""""""""""
" let g:solarized_termcolors=256           " Solarized light background
" set background=light                     " Solarized light background
" colorscheme solarized                    " Solarized light background
""""""""""""""""""""""""""""""""""""""""""""
set modeline                               " Activates modeline support
set modelines=10                           " Checks 10 first or last lines in a file for vim settings overrides
""""""""""""""""""""""""""""""""""""""""""""
set wrap                                   " Sets lines wrap
set hidden                                 " Buffers are just hidden when closing files
set ttyfast                                " Fasth terminal connection
set timeout timeoutlen=300 ttimeoutlen=300 " Timeout for keystrokes
set wildignore+=*.o                        " Ignored files paths                                                "
set wildignore+=*.obj                      " Ignored files paths
set wildignore+=.git                       " Ignored files paths
set wildignore+=*.rbc                      " Ignored files paths
set wildignore+=*.class                    " Ignored files paths
set wildignore+=.svn                       " Ignored files paths
set wildignore+=vendor/gems/*              " Ignored files paths
set wildignore+=*.jpg                      " Ignored files paths
set wildignore+=*.jpeg                     " Ignored files paths
set wildignore+=*.jpeg*                    " Ignored files paths
set wildignore+=*.png                      " Ignored files paths
set wildignore+=*.gif                      " Ignored files paths
set wildignore+=*/public/uploads/*         " Ignored files paths
set wildignore+=*/.git/*                   " Ignored files paths
set wildignore+=*/.bundle/*                " Ignored files paths
set wildignore+=*/bin/*                    " Ignored files paths
set wildignore+=*/log/*                    " Ignored files paths
set wildignore+=*/tmp/*                    " Ignored files paths
set wildignore+=*/.sass-cache/*            " Ignored files paths
set wildignore+=*/.jhw-cache/*             " Ignored files paths
set wildignore+=*/node_modules/*           " Ignored files paths
""""""""""""""""""""""""""""""""""""""""""""
set nobackup                               " get rid of annoying backup behaviour
set nowritebackup                          " get rid of annoying backup behaviour
set noswapfile                             " get rid of annoying backup behaviour
""""""""""""""""""""""""""""""""""""""""""""
set splitright                             " Vertical splits at right side
set splitbelow                             " Horizontal splits below
""""""""""""""""""""""""""""""""""""""""""""
set gdefault                               " don't need /g after :s or :g
""""""""""""""""""""""""""""""""""""""""""""

" undo stuff
if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif

  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile

endif

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal g'\"" | endif
endif

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function! s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" % to bounce from do to end etc.
runtime! macros/matchit.vim

""""""""""""""""""""""""""""""""
"           Mappings           "
""""""""""""""""""""""""""""""""
" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <Leader>tt :TlistToggle<CR> " CTags

" To create new files
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>n :tabnew<CR>
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Map ESC to jj and save my pinky
imap jk <ESC>
imap Jk <ESC>
imap JK <ESC>

" Switch between buffers
nmap <tab> <C-w><C-w>

" :bd deletes the current buffer (all windows of)
nmap <leader>d :bd<CR>

" ,a to Ack
nn <leader>a :Ack

" Rotating among results in an ack search
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" ease of use keyboard mappings (why do I care about top/bottom of screen?)
map H ^
map L $

" remap space bar to search
:nmap <Space> /

" Disable the regular keys to get me on the right track
nn <up> <nop>
nn <down> <nop>
nn <left> <nop>
nn <right> <nop>
ino <up> <nop>
ino <down> <nop>
ino <left> <nop>
ino <right> <nop>

" Better default behaviour with left and right
nn j gj
nn k gk

" easier quitting
" save and close all
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :q!<CR>

" Splits  ,v to open a new vertical split and switch to it
nn <leader>v <C-w>v<C-w>l
nn <leader>h <C-w>s<C-w>l

" Move between splits
nn <C-h> <C-w>h
nn <C-j> <C-w>j
nn <C-k> <C-w>k
nn <C-l> <C-w>l

" Removes highlighted search terms
nn <CR> :noh<CR>

" Numbers to move between tabs
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

" Formats json files
map <leader>jf  <Esc>:%!python -m json.tool<CR>

" Activates VimRoom-mode
nn <silent> <Leader>vr :VimroomToggle<CR>

" Folds all foldings but the current you are in
no <leader>z zMzvzz

" Ruby test Vimux config
map <Leader>tf :RunRubyFocusedTest<CR>
map <Leader>tc :RunRubyFocusedTest<CR>
map <Leader>ta :RunAllRubyTests<CR>
map <Leader>tl :RunLastVimTimuxCommand<CR>
map <Leader>rx :CloseVimTmuxPanes<CR>

" Opens vimrc file in a new tab
nmap <leader>vrc :tabedit $MYVIMRC<CR>

" Gundo toggle
nmap <leader>u :GundoToggle<CR>

" Alignment commands
map <leader>\" :Tabularize /"<CR>
map <leader>= :Tabularize /=<CR>
map <leader>{ :Tabularize /{<CR>
map <leader>} :Tabularize /}<CR>

""""""""""""""""""""""""""""""
"       Plugins config       "
"                            "
""""""""""""""""""""""""""""""
so ~/.vim/config/ctrlp.vimrc
so ~/.vim/config/vim-powerline.vimrc
so ~/.vim/config/vim-autoclose.vimrc
so ~/.vim/config/syntastic.vimrc

