"".vimrc
set nocompatible

""sets linefeed
set fileformat=unix

""set back file location
set backupdir=~/.vim/backups
set directory=~/.vim/swapfiles

""turn on syntax
filetype plugin indent on
syntax enable
set ruler

""set color scheme
colorscheme DeepOcean

""set tab size
set tabstop=4
set shiftwidth=4
set softtabstop=4

""something to do with block highlighting
set ve+=block

""turn off all the annoying bells
set noerrorbells
set novisualbell
set vb t_vb=

""enable indent code folding
set foldmethod=manual
set nowrap

""set split opening rules
set splitright
set splitbelow

""keeps wrapped words connected
set linebreak

""""KEY MAPPINGS""""
""remap 'j' and 'k' to move by row and not line
nnoremap j gj
nnoremap k gk

""use this to convert spaces to tabs on selected area
vnoremap ; <S-<>gv<S->>

""set newline after selected line
nmap <CR> o<Esc>

""for osx paste the clipboard
noremap <C-y> :w !pbcopy<CR><CR>

""map Y yanks to end of line
nnoremap Y y$
nnoremap dA d^

""map t to insert space and stay in normal mode
nmap t i<Space><Esc>

""""END KEY MAPPINGS""""

""fat fingering save and quit
command W w
command Q q
command Wq wq
command WQ wq
command QQ qall!
command WW wa!

""pesky problem with not opening a file with sudo and cant write
cnoremap w!! w !sudo tee > /dev/null %

""split a list
command SPLIT s/,/,/g

""converts tabs to 4 spaces
command WS %s/\t/    /g
command TWS %s/[\t ]\+$//g

""set text width
set tw=0

""highlighting
set hlsearch
set incsearch

""shows bad white space practices in RED
highlight ExtraWhitespace ctermbg=red cterm=NONE
match ExtraWhitespace /[^\t]\zs\t\+\|\s\+$\|^\t\+\zs \+/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red cterm=NONE

let $PAGER=''

""Netrw stuff
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:newrw_browse_split = 4
command LE Le
command RE Re
nmap <C-L> :Le<CR>
""autocmd VimEnter * :Le<CR>
