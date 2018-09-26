""pluggins
call plug#begin('~/.config/nvim/plugged')
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
"Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-fugitive'
Plug 'tweekmonster/impsort.vim'
Plug 'saltstack/salt-vim'
call plug#end()

so ~/.vimrc


"" ctrlp stuff... erick told me to
let g:ctrlp_user_command='rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching=0

"" set back file location
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swapfiles

" maps specific to vimplugs
"" Git Blame
nnoremap <space>gb :Gblame<CR>

"" Import sorts
let g:impsort_textwidth = 104
let g:impsort_lines_after_imports = 2
autocmd BufWritePre *.py ImpSort!

"" TagBar settings
let g:tagbar_expand = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_left = 1
let g:tagbar_show_linenumbers = 1
let g:tagbar_sort = 0
let g:tagbar_width = 60
let g:python3_host_prog = '/Users/jweispfenning/miniconda3/bin/python'
nnoremap <C-f> :TagbarToggle<CR>

"" jedi
let g:jedi#auto_completion = 1
set completeopt-=preview
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-j>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-k>"))
inoremap <expr> <CR>  ((pumvisible())?("\<C-y>"):("\<CR>"))

"" autucomplete menu colors
hi Pmenu ctermbg=black ctermfg=white
hi PmenuSel ctermbg=white ctermfg=black
