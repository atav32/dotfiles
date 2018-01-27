" ----------------------------------------------------------------------------
" Leader key
" ----------------------------------------------------------------------------
let mapleader = " "

" ----------------------------------------------------------------------------
" Path
" ----------------------------------------------------------------------------
set path=~/**

" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------

" Cconfiguration
if has("win32")
  let g:vim_home_path = "~/vimfiles"
else
  let g:vim_home_path = "~/.vim"
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

                                                                 " == General ==
Plug 'junegunn/seoul256.vim'                                     " Colorscheme
Plug 'gmarik/vundle'                                             " (remove) Install Vundle
Plug 'bling/vim-airline'                                         " Powerline in Vimscript
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }           " Directory explorer
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeToggle' }       " Tabs for nerdtree
Plug 'scrooloose/syntastic'                                      " Syntax checker
Plug 'tpope/vim-surround'                                        " Quickly surround words with symbols
Plug 'tpope/vim-obsession'                                       " (remove) Vim sessions
Plug 'christoomey/vim-tmux-navigator'                            " Doh! That's a Tmux split (no longer!)
Plug 'airblade/vim-gitgutter'                                    " Shows Git diff
Plug 'flazz/vim-colorschemes'                                    " Nice syntax highlighting
Plug 'Lokaltog/vim-easymotion'                                   " Move around better
Plug 'majutsushi/tagbar'                                         " Tags
Plug 'mileszs/ack.vim'                                           " Awk/Ag search
Plug 'Shougo/unite.vim'                                          " Unite
Plug 'Shougo/neomru.vim'
Plug 'chrisbra/vim-diff-enhanced'                                " Smarter diffing
Plug 'blueyed/vim-diminactive'                                   " Dim inactive window (could be very slow)
Plug 'Raimondi/delimitMate'                                      " Autocomplete for punctuation
Plug 'ervandew/supertab'                                         " Tab autocomplete
Plug 'tpope/vim-fugitive'                                        " Git wrapper
Plug 'ntpeters/vim-better-whitespace'                            " Highlight whitespace
Plug 'AndrewRadev/linediff.vim'                                  " Line diffs
Plug 'mikker/seoul256-iTerm'                                     " Seoul iTerm
Plug 'powerline/fonts'                                           " Powerline fonts (Sauce Code Powerline Regular)
Plug 'junegunn/fzf.vim'                                          " FZF plugin for Vim
Plug 'junegunn/goyo.vim'                                         " Page layout
Plug 'junegunn/vim-easy-align'                                   " Aligning columns
Plug 'janko-m/vim-test'                                          " Run tests
Plug 'tomlion/vim-solidity/'                                     " Solidity syntax

                                                                 " == Javascript ==
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }          " Javascript
Plug 'walm/jshint.vim', { 'for': 'javascript' }                  " I can haz good JS style?
Plug 'douglascrockford/JSLint', { 'for': 'javascript' }
Plug 'burnettk/vim-angular', { 'for': 'javascript' }             " Angular
Plug 'mxw/vim-jsx'                                               " ReactJS

                                                                 " == HTML ==
Plug 'htacg/tidy-html5', { 'do': 'make install', 'for': 'html' } " HTML5 syntax
Plug 'mattn/emmet-vim', { 'for': 'html' }                        " Expanding HTML abbreviations
                                                                 " == CSS ==
Plug 'groenewege/vim-less', { 'for': 'less' }                    " syntax highlighting for LESS
Plug 'ap/vim-css-color'                                          " Highligh CSS colors
Plug 'craigemery/vim-autotag'                                    " Auto update ctags
Plug 'wavded/vim-stylus', { 'for': 'styl' }                      " Stylus files

" Initialize plugin system
call plug#end()



" ----------------------------------------------------------------------------
" UI
" ----------------------------------------------------------------------------

autocmd BufEnter * :syntax sync fromstart
filetype on
filetype plugin indent on

set autoread                   " auto reload if file saved externally
set backspace=indent,eol,start " Fixes a problem where I cannot delete text that is existing in the file
set ch=1                       " Command line height
set colorcolumn=100            " vertical line to indicate line width
set complete-=i                " don't autocomplete from included files
set encoding=utf-8             " Enable unicode
set et
set expandtab                  " all tabs are actually spaces
set iskeyword=-                " hyphens are word boundaries
set laststatus=2               " Always show status line
set lazyredraw                 " If we're going to redraw, lets not be lazy about it.
set nocompatible
set nostartofline              " don't jump to the start of a line when scrolling
set number                     " show line numbers
set report=0                   " Tell us about changes
set scrolloff=5                " Keep cursor 5 lines away from the edge of the screen
set showcmd                    " Display commands as I type them
set showmode                   " Show the current mode
set smartindent
set softtabstop=2              " two!
set shiftwidth=2
set timeoutlen=300
set ttimeoutlen=10
set ttimeoutlen=50             " Timeout length when switching modes
set ttyfast
set whichwrap=b,s,h,l,<,>,[,]  " Wrap on other things
set wildignore+=*.class        " Ignore java compiled files
set wildignore+=*.pyc          " Ignore python compiled files
set wildignore+=*.swp          " Ignore vim backups
set wildignore+=.git,.hg,.svn  " Ignore version control repos
set wildmenu                   " Turn on wild menu. Sounds fun.
set wildmode=longest:list,full " make tab completion act like bash, but even better!
syntax enable                  " Turn on Syntax highlighting
syntax sync minlines=1000      " Look for synchronization points 1000 lines before the current position in the file.

if exists('$TMUX')
  set clipboard=
else
  set clipboard=unnamed        "sync with OS clipboard
endif


" ----------------------------------------------------------------------------
" Visual stuff
" ----------------------------------------------------------------------------

set background=dark   " We use a dark terminal so we can play nethack
set mat=5             " show matching brackets for 1/10 of a second
set laststatus=2      " always have a file status line at the bottom, even when theres only one file
set visualbell        " Stop beeping
set virtualedit=block " Allow virtual edit in just block mode.

hi NonText cterm=NONE ctermfg=NONE


" ----------------------------------------------------------------------------
" Searching and replacing
" ---------------------------------------------------------------------------

set showmatch                    " brackets/brace matching
set incsearch                    " show me whats matching as I type my search
set hlsearch                     " Highlight search results

" prepend all searches with \v to get rid of vim's 'crazy default regex characters'
nnoremap / /\v
" make tab % in normal mode. This allows us to jump between brackets.
nnoremap <tab> %
" make tab % in visual mode. this allows us to jump between brackets.
vnoremap <tab> %


" ---------------------------------------------------------------------------
" Python Stuff
" ---------------------------------------------------------------------------
" Gonna use 2 spaces for a while
autocmd FileType python setl sw=2                    " For python, the shift width is four, yes four
autocmd FileType python set softtabstop=2            " For python, tabs are four spaces!
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class " Autoindent my new blocks in python
highlight SpellBad term=reverse ctermbg=1


" ---------------------------------------------------------------------------
" Plugs & Autocmds
" ---------------------------------------------------------------------------

""""""""""""""
"Code Folding"
""""""""""""""
set foldmethod=indent
set foldnestmax=99
set foldlevel=3
let javaScript_fold=1
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR SCHEME
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme seoul256
let g:seoul256_background = 236
colo seoul256

"highlight OverLength      ctermbg=red
highlight ColorColumn     ctermbg=darkgray
highlight ExtraWhitespace ctermbg=red guibg=red


"------------------------------------------------
"" Plugin settings
"------------------------------------------------

"" Emmet
let g:user_emmet_leader_key='<C-G>'

"" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

"" Airline settings
autocmd User AirlineAfterInit call AirlineInit()
function! AirlineInit()
  " Powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''

  " Sections
  let g:airline_inactive_collapse = 1
  let g:airline_section_b = airline#section#create([])
  let g:airline_section_c = airline#section#create(['%{getcwd()}', '/', '%t'])
  let g:airline_section_x = airline#section#create_right([])
  let g:airline_section_y = airline#section#create_right(['%p%%', '%c'])
  let g:airline_section_z = airline#section#create_right(['branch'])
  let g:airline_section_warning = airline#section#create_right(['syntastic'])

  " Tmuxline
  let g:airline#extensions#tmuxline#enabled = 1
endfunction

"" NerdTree settings
let g:nerdtree_tabs_open_on_console_startup = 0
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
map <Leader>t :NERDTreeToggle<Enter>

"" Synstastic settings
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_python_flake8_args = '--config ~/.flake8'
let g:syntastic_python_pylint_args = '--rcfile .pylintrc --load-plugins pylint_django --msg-template="{path}:{line}: [{msg_id}] {msg}" -r n'
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['jshint', 'gjslint']
let g:syntastic_html_tidy_exec = '~/.vim/bundle/tidy-html5/bin/tidy'
let g:syntastic_html_tidy_ignore_errors=['proprietary attribute', 'trimming empty <']

"" Autoequalize splits
autocmd VimResized * wincmd =

"" Easymotion
nmap <Leader>s <Plug>(easymotion-s2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1

"" Tags
nmap <F8> :TagbarToggle<CR>

"" Awk/Ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
if executable('ack')
  set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
  set grepformat=%f:%l:%c:%m
endif
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif

"" Indent Guide
let g:indent_guides_guide_size = 1

let g:NERDTreeDirArrows = 0

"" Vim Diminactive
let g:diminactive_use_colorcolumn = 0
let g:diminactive_use_syntax = 1

"" Vim Fugitive
set diffopt+=vertical

"" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"" Python
if has('python')
python << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
endif


"" ctags
set tags=./.tags;~


" Easier visual indent
vnoremap < <gv
vnoremap > >gv


" Spell check README's
autocmd BufRead,BufNewFile *.md setlocal spell


" Backup/Undo settings
execute "set directory=" . g:vim_home_path . "/swap"
execute "set backupdir=" . g:vim_home_path . "/backup"
execute "set undodir=" . g:vim_home_path . "/undo"
set backup
set writebackup
set undofile


" Arrow keys getting in my way
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" No manual
noremap <S-k> <NOP>


" Pageup/pagedown
noremap gk <C-u>
noremap gj <C-d>


" Scroll bind
command Scb set scrollbind!


" Set filetyps
command Re filetype detect
command Html set filetype=html
command Js set filetype=javascript
command Css set filetype=css
command Less set filetype=less


" paste mode
command Pa set paste!


" Chrome Secure Shell remappings
map <C-e> <C-w>


" Save
nnoremap gs :w<Enter>
nnoremap gss :wq<Enter>
nnoremap gsss :w !sudo tee % >/dev/null<Enter>


" Quit
nnoremap gq :q<Enter>
nnoremap gqq :q!<Enter>
nnoremap gqa :qa<Enter>


" Split commands.
nnoremap <silent> ss :split .<Enter>
nnoremap <silent> vv :vsplit .<Enter>
" vertical ➜ horizontal splits
nnoremap <silent> vs <C-w>t<C-w>K
" horizontal ➜ vertical splits
nnoremap <silent> sv <C-w>t<C-w>H

" Resize splits
nnoremap ++ 10<C-w>+
nnoremap -- 10<C-w>-
nnoremap << 5<C-w><
nnoremap >> 5<C-w>>


" File Explorer
set autochdir
nnoremap gx :Explore<Enter>
nnoremap gb :b#<Enter>


" Typos
command Q q
command W w
command Wq wq


" No Exec mode
noremap Q <NOP>


" Space to fold/unfold code
nmap gz za


" Move cursor line to the center of the screen
nnoremap <Enter> zz


" Remove all console.log
nnoremap gc :g/console.log/d<Enter>


" Line comments
nnoremap g> ^i//<C-c>j
nnoremap g< ^:%s/\/\///c<Enter>y


" Line numbers
nmap <F6> :set invnumber<CR>
command No set invnumber! | GitGutterToggle


" Ack
nmap <Leader>/ :Ack


" fzf
set rtp+=~/.fzf


" unhighlight search
noremap <silent><esc> <esc>:noh<CR><esc>


" replace
nmap ?? :%s/<C-r><C-w>//g<Left><Left>
vmap ?? :s/<C-r><C-w>//g<Left><Left>


" vimrc
command Vimrc e $MYVIMRC
command Vimre source $MYVIMRC

" tabs
nnoremap <C-e>g :tab sball<CR>
nnoremap <C-e>t :tab split<CR>
nnoremap <C-e>q :tabclose<CR>
nnoremap <C-e>h :tabp<CR>
nnoremap <C-e>j :tabp<CR>
nnoremap <C-e>k :tabn<CR>
nnoremap <C-e>l :tabn<CR>

" ----------------------------------------------------------------------------
" Large files
" ----------------------------------------------------------------------------
" file is large from 10mb
let g:LargeFile = 1024 * 1024 * 10
augroup LargeFile
  autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
  " no syntax highlighting etc
  set eventignore+=FileType
  " save memory when other file is viewed
  setlocal bufhidden=unload
  " is read-only (write with :w new_filename)
  setlocal buftype=nowrite
  " no undo possible
  setlocal undolevels=-1
  " display message
  autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction
