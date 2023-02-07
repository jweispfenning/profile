color file
" Maintainer: Tom Regner <vim@tomsdiner.org>
" Last Change:
" Version: 1.2.5
" URL: http://vim.sourceforge.net/script.php?script_id=368

"" Init
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "oceandeep"

"" Console

if version >= 700
    highlight PMenu      cterm=bold ctermbg=DarkGreen ctermfg=Gray
    highlight PMenuSel   cterm=bold ctermbg=Yellow ctermfg=Gray
    highlight PMenuSbar  cterm=bold ctermbg=DarkGreen
    highlight PMenuThumb cterm=bold ctermbg=Yellow
    highlight SpellBad   ctermbg=Red
    highlight SpellRare  ctermbg=Red
    highlight SpellLocal ctermbg=Red
    highlight SpellCap   ctermbg=Yellow
endif

highlight Normal         ctermfg=Gray ctermbg=233
highlight Search         ctermfg=Black ctermbg=Red cterm=NONE
highlight Visual         cterm=reverse
highlight Cursor         ctermfg=Black ctermbg=Green cterm=bold
highlight Special        ctermfg=Brown
highlight Comment        ctermfg=DarkGray
highlight StatusLine     ctermfg=Blue ctermbg=White
highlight Statement      ctermfg=Yellow cterm=NONE
highlight Type           cterm=NONE
highlight Macro          ctermfg=DarkRed
highlight Identifier     ctermfg=DarkYellow
highlight Structure      ctermfg=DarkGreen
highlight String         ctermfg=DarkCyan

" Diff Colors
highlight DiffAdd        ctermbg=DarkBlue ctermfg=White
highlight DiffChange     ctermbg=Yellow   ctermfg=Black
highlight DiffDelete     ctermbg=Gray     ctermfg=Black
highlight DiffText       ctermbg=Red      ctermfg=Black
