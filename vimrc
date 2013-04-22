" Changes leader key
let mapleader = ","

" Buffers events
"""""""""""""""""
"au VimEnter * wincmd l
"au BufEnter * :syntax sync fromstart
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,*.sinew} set ft=ruby
au BufNewFile,BufRead *.json                                                    set filetype=javascript
au BufNewFile,BufRead *.ejs                                                     set filetype=html
au BufNewFile,BufRead *.tpl                                                     set filetype=html.erb
au BufNewFile,BufRead {*.vimrc,*.vim}                                           set filetype=vim
au BufWinLeave * silent! mkview    " Auto-saves foldings
au BufWinEnter * silent! loadview  " Auto-load foldings

if !exists('g:trim_trailing_space') || g:trim_trailing_space != 'no'
  au BufWritePre * :call StripTrailingWhitespaces()
endif

au insertenter * setlocal cursorline   " Highlights on cursor line in insert mode
au insertleave * setlocal nocursorline " Highlights off cursor line in normal mode

"au BufWritePost *.coffee silent CoffeeMake! | cwindow | redraw!

" Reloads vimrc file after saving it
augroup AutoReloadVimRC
  au!
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

let g:ackprg = 'ag --nogroup --nocolor --column'
""""""""""""""""""""""""""""""""""""""""""""
" Settings                                 "
""""""""""""""""""""""""""""""""""""""""""""
syntax on                                  " Enable syntax highlight
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
set modeline                               " Activates modeline support
set modelines=10                           " Checks 10 first or last lines in a file for vim settings overrides
""""""""""""""""""""""""""""""""""""""""""""
set wrap                                   " Sets lines wrap
set hidden                                 " Buffers are just hidden when closing files
set ttyfast                                " Fasth terminal connection
set timeout timeoutlen=500 ttimeoutlen=500 " Timeout for keystrokes
set wildignore+=*.o                        " Ignored files paths
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
set wildignore+=.dat*                      " Ignored files paths
set wildignore+=tags                       " Ignored files paths
set wildignore+=*.sqlite*                  " Ignored files paths
set wildignore+=*/public/uploads/*         " Ignored files paths
set wildignore+=*/.git/*                   " Ignored files paths
set wildignore+=*/.bundle/*                " Ignored files paths
set wildignore+=*/bin/*                    " Ignored files paths
set wildignore+=*/log/*                    " Ignored files paths
set wildignore+=*/tmp/*                    " Ignored files paths
set wildignore+=*/.sass-cache/*            " Ignored files paths
set wildignore+=*/.jhw-cache/*             " Ignored files paths
set wildignore+=*/node_modules/*           " Ignored files paths
set wildignore+=*/vendor/*                 " Ignored files paths
set wildignore+=*/resources/*              " Ignored files paths
set wildignore+=*/build/*                  " Ignored files paths
set wildignore+=*/_site/*                  " Ignored files paths
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
set completeopt=longest,menuone            " Improves autocomplete menu
""""""""""""""""""""""""""""""""""""""""""""
"set foldmethod=syntax                     " Folds based on syntax
set foldnestmax=2                          " Sets max folding level
""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Vundle config
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Vundle bundles
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/SearchFold'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/gist-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-haml'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-surround'
Bundle 'mattn/zencoding-vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'tpope/vim-vividchalk'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/notes.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'Townk/vim-autoclose'
Bundle 'clones/vim-cecutil'
Bundle 'tpope/vim-ragtag'
Bundle 'vim-ruby/vim-ruby'
Bundle 'AndrewRadev/switch.vim'
Bundle 'samsonw/vim-task'
Bundle 'spolu/dwm.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tsaleh/vim-matchit'
Bundle 'benmills/vimux'
Bundle 'pgr0ss/vimux-ruby-test'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'
Bundle 'mutewinter/vim-indent-guides'
Bundle 'xolox/vim-easytags'
Bundle 'roman/golden-ratio'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'chrisbra/NrrwRgn'
Bundle 'nelstrom/vim-markdown-preview'
Bundle 'sjl/gundo.vim'
Bundle 'ervandew/supertab'
Bundle 'danro/rename.vim'
Bundle 'mikewest/vimroom'
Bundle 'SirVer/ultisnips'
Bundle 'xolox/vim-session'
Bundle 'rnaveiras/vim-git-session'
Bundle 'airblade/vim-gitgutter'
Bundle 'ap/vim-css-color'
Bundle 'sjl/vitality.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Vundle config

"""""""""""""""""""""""""""""" Plugins config

so ~/.vim/config/colors.vimrc
so ~/.vim/config/ctrlp.vimrc
so ~/.vim/config/vim-powerline.vimrc
so ~/.vim/config/vim-autoclose.vimrc
so ~/.vim/config/syntastic.vimrc
so ~/.vim/config/vim-task.vimrc
so ~/.vim/config/dwm.vimrc
so ~/.vim/config/vundle.vimrc
so ~/.vim/config/nrrwrgn.vimrc
so ~/.vim/config/vim-markdown-preview.vimrc
so ~/.vim/config/vim-session.vimrc
so ~/.vim/config/vim-easytags.vimrc
so ~/.vim/config/switch.vim.vimrc

"""""""""""""""""""""""""""""" Plugins config

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

""""""""""""""""""""""""""""""""
"           Functions          "
""""""""""""""""""""""""""""""""
fun! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" % to bounce from do to end etc.
runtime! macros/matchit.vim

""""""""""""""""""""""""""""""""
"           Mappings           "
""""""""""""""""""""""""""""""""
vnoremap p "_dP

" ZoomWin configuration
map <leader><leader> :ZoomWin<CR>

" CTags
map <leader>rt :!ctags --extra=+f -R *<CR><CR>
map <leader>tt :TagbarToggle<CR>
map <leader>gd <C-]>


" To create new files
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>n :tabnew<CR>
map <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ct :tabc<CR>
map <leader>to :tabo<CR>

" Map ESC to jj and save my pinky
imap jk <ESC>
imap Jk <ESC>
imap JK <ESC>

" Switch between buffers
"nmap <tab> <C-w><C-w>


" :bd deletes the current buffer (all windows of)
"nmap <leader>d :bd<CR>

" ,a to Ack
nn <leader>a :Ack

" Rotating among results in an ack search
map an :cn<CR>
map ap :cp<CR>

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
"nn <C-h> <C-w>h
"nn <C-j> <C-w>j
"nn <C-k> <C-w>k
"nn <C-l> <C-w>l
nnoremap <C-J> <C-W>w
nnoremap <C-K> <C-W>W


" Removes highlighted search terms
" <C-M> == <CR>
noremap <CR> :noh<CR>

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
nn <silent> <leader>vr :VimroomToggle<CR>
nn 80c :set textwidth=80<CR>

" Folds all foldings but the current you are in
no <leader>z zMzvzz
no aa za
no CC zM
no AA zR

" Ruby test Vimux config
map tf :RunRubyFocusedTest<CR>
map tc :RunRubyFocusedContext<CR>
map ta :RunAllRubyTests<CR>
map tl :RunLastVimTmuxCommand<CR>
map th :CloseVimTmuxPanes<CR>

" Opens vimrc file in a new tab
nmap <leader>vrc :tabedit $MYVIMRC<CR>

" Opens /etc/hosts file
nmap <leader>etc :tabedit /etc/hosts<CR>

" Saves as super-user
nmap <leader>sw :w !sudo tee %<CR>

" Gundo toggle
nmap <leader>u :GundoToggle<CR>

" Alignment commands
nn <leader>\" :Tabularize /"<CR>
nn <leader>=  :Tabularize /=<CR>
nn <leader>=> :Tabularize /=<CR>
nn <leader>{  :Tabularize /{<CR>
nn <leader>}  :Tabularize /}<CR>
nn <leader>;  :Tabularize /;<CR>
nn <leader>\: :Tabularize /\:<CR>

" Nerdtree commands
nn <leader>nt :NERDTreeToggle<CR>

" Use sane regexp
nn / /\v
vn / /\v
" Format commands

nnoremap - :Switch<cr>

" Moving between diffs
nn <leader>nd ]c
nn <leader>pd [c

" Code shortcuts
nn db orequire 'debugger'; debugger<Esc>
nn rb orequire 'ruby-debug'; debugger<Esc>
nn tabu :Tabularize /
nn <tab><tab> :Tabularize /
vn <tab><tab> :Tabularize /
nn // :%s//
nn == :Tabularize /=<CR>
vn == :Tabularize /=<CR>
nn {{ :Tabularize /{<CR>
vn {{ :Tabularize /{<CR>
nn }} :Tabularize /}<CR>
vn }} :Tabularize /}<CR>

nn <C-f> <Nop>

""""""""""""""""""""""""""""""""
"           Macros             "
""""""""""""""""""""""""""""""""
let @r='/def V%zf'
