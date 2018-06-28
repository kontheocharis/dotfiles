" <vimconfig.com generated>
" General
set number      " Show line numbers
set wrap      " Wrap lines
set showbreak=+++       " Wrap-broken line prefix
set textwidth=100       " Line wrap (number of cols)
set showmatch   " Highlight matching brace
" set spell       " Enable spell-checking
set visualbell  " Use visual bell (no beeping)
set linebreak

set hlsearch    " Highlight all search results
set smartcase   " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch   " Searches for strings incrementally

set autoindent  " Auto-indent new lines
set cindent     " Use 'C' style program indenting
" set expandtab   " Use spaces instead of tabs
set shiftwidth=4        " Number of auto-indent spaces
set smartindent " Enable smart-indent
set smarttab    " Enable smart-tabs set softtabstop=4       " Number of spaces per Tab set cursorline
set noshowmode
set cursorline

" Advanced
set ruler       " Show row and column ruler information
set showtabline=2       " Show tab bar

set autochdir   " Change working directory to open buffer

set undolevels=1000     " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

" </vimconfig.com generated>

" <dein.vim initialization>

if &compatible
    set nocompatible
endif
" <plugged config>

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'gioele/vim-autoswap'
Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-surround'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-airline/vim-airline'
" Plug 'atelierbram/Base2Tone-vim'
Plug 'wincent/terminus'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-ruby/vim-ruby'
Plug 'kontheocharis/vim-colors-plain'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'rafi/awesome-vim-colorschemes'
"Plug 'trevordmiller/nova-vim'
" Plug 'ayu-theme/ayu-vim'
" Plug 'rakr/vim-two-firewatch'
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-commentary'
Plug 'dkarter/bullets.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'xolox/vim-reload'
Plug 'xolox/vim-misc'
Plug 'danro/rename.vim'
" Plug 'rainglow/vim'

" Typescript stuff
" Plug 'peitalin/vim-jsx-typescript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'sheerun/vim-polyglot'
" Plug 'Boshen/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', { 'do' :'make -f make_mac.mak' }
Plug 'Valloric/YouCompleteMe', { 'do' :'./install.py --clang-completer --system-libclang --omnisharp-completer --cs-completer' }
Plug 'scrooloose/nerdtree'

" Writing stuff
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Plug 'mt3/vim-pantondoc'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Greek
Plug 'bserem/vim-greek-spell'

Plug 'skywind3000/asyncrun.vim'

" Initialize plugin system
call plug#end() " </plugged config>

" <config>
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Color theme
syntax enable
set background=dark
set notermguicolors

let g:nord_italic = 1
let g:nord_italic_comments = 1

colorscheme plain
let g:airline_theme='monochrome'

let &showbreak = '  '

" Reset transparency
hi Normal guibg=NONE ctermbg=NONE

" New lines in normal mode
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

" tabs
nnoremap gT :bprevious<CR>
nnoremap gt :bnext<CR>

" Typescript auto-suggest on dot
if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" NERTtree shortcut
map <C-N> :NERDTreeToggle<CR>

" Goyo stuff
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" remove typescript from polyglot
" let g:polyglot_disabled = ['typescript']

" remove conceals
let g:pandoc#syntax#conceal#use = 0
" let g:pandoc#modules#disabled = ["folding"]

" pandoc word count
let g:airline#extensions#wordcount#filetypes = '\vhelp|markdown|rst|org|text|asciidoc|tex|mail|pandoc'

" pdf
" command! -nargs=1 Silent
" 	    \   execute 'silent !' . <q-args>
" 	    \ | execute 'redraw!'

command! OpenPdf silent !open -a "Skim" out.pdf

nnoremap ;; :w<CR>:AsyncRun make<CR>

" goyo fix q
function! s:goyo_enter()
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
    " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
	if b:quitting_bang
	    qa!
	else
	    qa
	endif
    endif

    " Reset transparency
    hi Normal guibg=NONE ctermbg=NONE
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" greek
set keymap=greek_utf-8
set iminsert=0
set imsearch=-1

autocmd FileType latex,tex,md,markdown,pandoc setlocal spell spelllang=en,el

let g:goyo_height = '100%'

" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" airline
let g:airline#extensions#keymap#enabled = '0'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_skip_empty_sections = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0

autocmd VimLeave * call system('printf "\e[5 q" > $TTY')
" </config>
