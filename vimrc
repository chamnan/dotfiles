" .vimrc File
" Maintained by: Chamnan Nop
" Email: chamnan.nop@gmail.com

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'othree/html5.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/tComment'
Bundle 'edkolev/tmuxline.vim'
Bundle 'vim-scripts/php.vim-html-enhanced'

" ...

" Set filetype detection on, load plugins and indent.
filetype plugin indent on
filetype plugin on

" A couple options to make vim-airline work correctly.
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Tabs, Spaces and Indentation.
set expandtab " Use spaces for tabs.
set tabstop=2 " Number of spaces to use for tabs.
set shiftwidth=2 " Number of spaces to autoindent.
set softtabstop=2 " Number of spaces for a tab.
set autoindent " Set autoindenting on.
set smartindent

set encoding=utf-8
set t_Co=256
set background=dark
syntax enable

" Fixed vim scrolls very slow
set ttyfast
set ttyscroll=3
set lazyredraw " to avoid scrolling problems

" Forget compatibility with Vi. Who cares.
set nocompatible

" Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

" Backup.
set nobackup
set nowritebackup
set noswapfile

" Write the old file out when switching between files.
set autowrite

" Display current cursor position in lower right corner.
set ruler

" Want a different map leader than \
let mapleader = ","

" Ever notice a slight lag after typing the leader key + command? This lowers
" the timeout.
set timeoutlen=500

" Switch between buffers without saving
set hidden

" Set the color scheme. Change this to your preference.
" Here's 100 to choose from: http://www.vim.org/scripts/script.php?script_id=625
colorscheme hybrid

" Set font type and size. Depends on the resolution. Larger screens, prefer h15
" set guifont=Ubuntu:h15

" Show command in bottom right portion of the screen
set showcmd

" Show lines numbers
set number

" Always show the status line
set laststatus=2

" Prefer a slightly higher line height
set linespace=3

" Better line wrapping 
set wrap
set textwidth=79
set formatoptions=qrn1

" Set incremental searching"
set incsearch

" Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

" Hard-wrap paragraphs of text
nnoremap <leader>q gqip

" Enable code folding
set foldenable

" Hide mouse when typing
set mousehide

" Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf

" Create dictionary for custom expansions
set dictionary+=/Users/Home/.vim/dict.txt

" Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

" Split windows below the current window.
set splitbelow              

" Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

" Set up an HTML5 template for all new .html files
" autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

" Shortcut for editing  vimrc file in a new tab
nmap ev :tabedit $MYVIMRC<cr>

" Change zen coding plugin expansion key to shift + e
let g:user_zen_expandabbr_key = '<C-e>'

" Faster shortcut for commenting. Requires T-Comment plugin
" From https://github.com/tomtom/tcomment_vim
map c <c-_><c-_>

" Saves time; maps the spacebar to colon
nmap <space> :

" Automatically change current directory to that of the file in the buffer
" autocmd BufEnter * cd %:p:h

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<C-x>\<C-o>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" More useful command-line completion
" set wildmenu

" Map escape key to jj -- much faster
imap jj <esc>

" Delete all buffers (via Derek Wyatt)
nmap <silent> da :exec "1," . bufnr('$') . "bd"<cr>

" Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Source the vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
"
" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"------------------------"
"NERDTREE PLUGIN SETTINGS
"------------------------"
"Shortcut for NERDTreeToggle
nmap <silent>nt :NERDTreeToggle<CR>

" Show hidden files in NerdTree
let NERDTreeShowHidden=1

" autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

" Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

"--------------------------"
" PERSONAL SETTINGS 
" -------------------------"

" Switching Tab
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" On/Off Paste mode
set pastetoggle=<F2>

"Clear search Highlight
nnoremap <silent><Leader><space> :noh<CR>

"# ctrlp.vim
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" On ubuntu (running Vim in gnome-terminal)
" " The reason for the double-command on <C-c> is due to some weirdness with
"the X clipboard system.
vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
map <C-a> GVgg
map <C-x> d
map <C-z> u

" Vim completion popup menu enhancement
set completeopt=menuone

if has("autocmd")

	autocmd FileType ruby,eruby,haml set omnifunc=rubycomplete#Complete
	autocmd FileType ruby,eruby,haml let g:rubycomplete_buffer_loading = 1
	autocmd FileType ruby,eruby,haml let g:rubycomplete_rails = 1
	autocmd FileType ruby,eruby,haml let g:rubycomplete_classes_in_global = 1
	autocmd FileType ruby,eruby,haml let g:rubycomplete_include_object = 1
	autocmd FileType ruby,eruby,haml let g:rubycomplete_include_objectspace = 1

endif
