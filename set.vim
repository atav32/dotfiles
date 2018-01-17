" ----------------------------------------------------------------------------
" UI
" ----------------------------------------------------------------------------

set autoread                   " auto reload if file saved externally
set backspace=indent,eol,start " fixes a problem where I cannot delete text that is existing in the file
set ch=1                       " command line height
set colorcolumn=100            " vertical line to indicate line width
set complete-=i                " don't autocomplete from included files
set encoding=utf-8             " Enable unicode
set et
set expandtab                  " all tabs are actually spaces
set iskeyword=-                " hyphens are word boundaries
set laststatus=2               " always show status line
set lazyredraw                 " if we're going to redraw, lets not be lazy about it.
set nocompatible
set nostartofline              " don't jump to the start of a line when scrolling
set number                     " show line numbers
set report=0                   " tell us about changes
set scrolloff=5                " keep cursor 5 lines away from the edge of the screen
set showcmd                    " display commands as I type them
set showmode                   " show the current mode
set smartindent
set softtabstop=2              " two!
set shiftwidth=2
set timeoutlen=300
set ttimeoutlen=10
set ttimeoutlen=50             " timeout length when switching modes
set ttyfast
set whichwrap=b,s,h,l,<,>,[,]  " wrap on other things
set wildignore+=*.class        " ignore java compiled files
set wildignore+=*.pyc          " ignore python compiled files
set wildignore+=*.swp          " ignore vim backups
set wildignore+=.git,.hg,.svn  " ignore version control repos
set wildmenu                   " turn on wild menu. Sounds fun.
set wildmode=longest:list,full " make tab completion act like bash, but even better!
syntax enable                  " turn on Syntax highlighting
syntax sync minlines=1000      " look for synchronization points 1000 lines before the current position in the file.



" ----------------------------------------------------------------------------
" Visual stuff
" ----------------------------------------------------------------------------

set background=dark   " We use a dark terminal so we can play nethack
set mat=5             " show matching brackets for 1/10 of a second
set laststatus=2      " always have a file status line at the bottom, even when theres only one file
set visualbell        " Stop beeping
set virtualedit=block " Allow virtual edit in just block mode.



" ----------------------------------------------------------------------------
" Remaps
" ----------------------------------------------------------------------------

" Arrow keys getting in my way
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" No manual
noremap <S-k> <NOP>


" Easier visual indent
vnoremap < <gv
vnoremap > >gv


" Pageup/pagedown
noremap gk <C-u>
noremap gj <C-d>


" Scroll bind
command Scb set scrollbind!


" Set filetyps
command Re filetype detect
command Csh set filetype=csh
command Css set filetype=css
command Html set filetype=html
command Js set filetype=javascript
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


" search tags
nmap \\ :Tags <C-r><C-w>
vmap \\ :Tags <C-r><C-w>


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


" Backup/Undo settings
execute "set directory=" . g:vim_home_path . "/swap"
execute "set backupdir=" . g:vim_home_path . "/backup"
execute "set undodir=" . g:vim_home_path . "/undo"
set backup
set writebackup
set undofile