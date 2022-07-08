"".vimrc
set nocompatible

"" sigh, let your mouse wheel work
set mouse=a

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

""remap 'j' and 'k' to move by row and not line
nnoremap j gj
nnoremap k gk

""set newline after selected line
nmap <CR> o<Esc>

""for osx paste the clipboard
noremap <C-y> :w !pbcopy<CR><CR>

""map Y yanks to end of line
nnoremap Y y$
nnoremap dA d^

""map t to insert space and stay in normal mode
nmap t i<Space><Esc>

""fat fingering save and quit
command W w
command Q q
command Wq wq
command WQ wq
command QQ qall!
command WW wa!

""pesky problem with not opening a file with sudo and cant write
cnoremap w!! w !sudo tee > /dev/null %

""sort stuff on the same line
:vnoremap <C-S> d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

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

""vimpager stuff
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

""start from previous location
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

""Loads highlighting rules
"command APPLYCUSTOM execute printf("set syntax=%s.custom", &syntax)
"autocmd VimEnter * APPLYCUSTOM

""Violation highlighting rules
highlight Violations ctermbg=red ctermfg=black cterm=NONE
match Violations //
""space followed by any number of tabs.
call matchadd('Violations', ' \+\t\+', -1)
""tab followed by any number of spaces.
call matchadd('Violations', '\t\+ \+', -1)
""trailing whitespace
call matchadd('Violations', '\s\+$', -1)
""lines longer than 150 characters
call matchadd('Violations', '\%>150v.\+$', -1)
command NOV highlight clear Violations

"" TESTCASES
"This is a really long line and it is used to make sure that it will always always always highlight how I want and think it will because if it isn't this is just awkward
"
"space then tab: 	:
"space then 2 tabs: 		:
"space then tab then space:		 :
"2 spaces then tab then space:  	 :
"
"tab then space:	 :
"tab then 3 spaces:	   :
"tab then space then tab:	 	:
"2 tabs then space then tab:		 	:
"
"tab then space then text:
	 "hello
"space then tab then text:
	"hello
"valid just a tab then text:
	"hello
"valid 4 spaces then text:
    "hello
"
"Trailing whitespace:
"Hello 
"Hello	
