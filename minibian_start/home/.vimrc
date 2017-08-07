" This must be first, because it changes other options as side effect
set nocompatible
"---------------------------------
"
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#infect()
"---------------------------------

" change the mapleader (default is \)
let mapleader= ","
"---------------------------------

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
"---------------------------------

nnoremap ; :

set hidden

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

if has('autocmd')
    autocmd filetype python set expandtab
    autocmd filetype html,xml set listchars-=tab:>.
endif

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set pastetoggle=<F2>  " PASTEMODE
nmap <F3> :NERDTreeToggle<CR>  " NERDTree PLUGIN
"---------------------------------
"------------- VUNDLE ------------
filetype off    " Required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

filetype plugin indent on
" BUNDLES:
" original repos on github:
"Plugin 'bling/vim-airline'
"Bundle 'edkolev/tmuxline.vim'
"
Bundle 'tpope/vim-git'
Plugin 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdtree'
Bundle 'junegunn/vim-emoji'
" vim-scripts repos:
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos:
Bundle 'git://git.wincent.com/command-t.git'
"---------------------------------
"---------- COLORSCHEME ----------
set t_Co=256 " REQUIRED for Tmux
if &t_Co >= 256 || has("gui_running")
    colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

"---------------------------------
set laststatus=2
"---------- POWERLINE ------------
"source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim

let g:Powerline_symbols = 'fancy'
"---------------------------------
"------------- EMOJI -------------
" Git Gutter
silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

"" Append Emoji list to current buffer
"for e in emoji#list()
"  call append(line('$'), printf('%s (%s)', emoji#for(e), e))
"endfor

"" Create emoji database for weechat:
"for e in emoji#list()
"  call append(line('$'), printf(':%s:', e))
"  call append(line('$'), printf('%s', emoji#for(e)))
"endfor

" Completion
set completefunc=emoji#complete

" Replace :emoji_name: into Emojis
:command Emoji %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g
"---------------------------------
"---------- Vim-AiRLINE ----------
"set guifont=Literation\ Mono\ for\ Powerline\ 16
"let g:airline_powerline_fonts = 1
"set ttimeoutlen=50
"let g:airline_theme = 'badwolf'
"let g:airline#extensions#hunks#enabled=0
"let g:airline#extensions#branch#enabled=1
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0
"" TMUXLINE
"" make tmuxline have different colors then AiRLINE:
"let g:airline#extensions#tmuxline#enabled = 0
"---------------------------------
"-------------  TMUX  ------------
" Make color scheme look good in TMUX:
" Also make sure to add "export TERM='xterm-256color'" line in your ~/.bashrc
set term=screen-256color
"---------------------------------