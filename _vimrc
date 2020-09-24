syntax on
filetype plugin indent on
autocmd GUIEnter * simalt ~x
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 System                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set showmatch           " Show matching brackets.
set incsearch           " Incremental search
set mouse=a             " Enable mouse usage (all modes)
set ruler               " Disaply current location of curor
set hlsearch            " Highlight search
set ignorecase          " ignorecase on
set smarttab            " Smart tab
set fileformat=dos
set wrap
set relativenumber
set number              " Show line number
set laststatus=0        " Always show statusline
set wildmenu
set smartcase
set nobackup
set noswapfile
set guioptions=         " Remove Menubar and Toolbar


" Keyboard customize
inoremap jk <Esc>
nnoremap j gj
nnoremap k gk

nnoremap n nzzzv
nnoremap N Nzzzv

let mapleader = ","

inoremap <expr> <C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
inoremap <expr> <C-f> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-f>"
inoremap <expr> <C-b> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-b>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

vnoremap <tab> >gv
vnoremap <s-tab> <gv
nmap <tab> v>
nmap <s-tab> v<

unmap <c-i>

" Close preview window automaticly
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Map <Leader>- and <Leader>= to :colder and :cnewer
nnoremap <Leader>- :colder<CR>
nnoremap <Leader>= :cnewer<CR>

" Window split
set winminheight=0
set winminwidth=0
set splitright
set splitbelow
nnoremap <Leader>z <C-w>\|<C-w>_

" Remove trailing whitespace when writing a buffer, but not for diff files.
function RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\t/   /g
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction


let path='$HOME/vimfiles/plugged'

call plug#begin()

Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/VisIncr'
Plug 'vim-scripts/TagHighlight'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-syntastic/syntastic'
Plug 'tomasr/molokai'
Plug 'dimasg/vim-mark'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-unimpaired'
Plug 'jisaacks/GitGutter'
Plug 'sjl/gundo.vim'
Plug 'kien/ctrlp.vim'
Plug 'gregsexton/VimCalc'
Plug 'mhinz/vim-grepper'
Plug 'easymotion/vim-easymotion'
Plug 'nz45s2/vim-cscope-maps'
Plug 'nz45s2/vim-mswin'


call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugin                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-mark
nnoremap <Leader><Leader>m :MarkClear<CR>

" ctrlp
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_lazy_update = 0
let g:ctrlp_max_files = 0
let g:ctrlp_max_height = 70
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.plastic$\|\.svn$\|\v[\/](output)|\v[\/](tools)',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.elf$\|\.o$\
               \|\.lst$\|\.obj$\
               \|\.vsd$\|\.vsdx$\|\.doc$\|\.docx$\
               \|\.xls$\|\.xlsx$\
               \|\.log$\
               \|\.out$\|\.file$\|tags$\|filenametag$\|project.bat$\|\.d$\|\.err$',
    \ 'link': '',
    \ }
let g:ctrlp_clear_cache_on_exit = 0

" gitgutter
let g:gitgutter_realtime = 0
nnoremap <leader>j :GitGutterNextHunk<cr>
nnoremap <leader>k :GitGutterPrevHunk<cr>
highlight clear SignColumn
autocmd ColorScheme * highlight clear SignColumn

" Yankring
let yankring_replace_n_pkey = '<C-k>'
let yankring_replace_n_nkey = '<C-j>'
let g:yankring_max_element_length = 0

" Grepper
nnoremap <Leader>a :Grepper<space>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

if executable("ag")
   set grepprg=ag\ --nogroup\ --nocolor\ --column
   set grepformat=%f:%l:%c%m
   let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
endif

" Cscope
nnoremap <F7> :cs kill -1<CR>
    \:!cscope -Rbqk<CR>
    \:cs add cscope.out<CR>
    \:cs reset<CR>

" Ctag
nnoremap <C-]> :tjump <C-R>=expand("<cword>")<CR><CR>

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python', 'pep8']
let g:syntastic_c_checkers = ['gcc', 'cppcheck']
let g:syntastic_cpp_checkers = ['gcc', 'cppcheck']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 nz45s2                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme molokai
colorscheme molokai
set background=dark


" cursorline
set cursorline
highlight cursorline guibg=NONE gui=underline

" guifont settings
set guifont=DejaVu\ Sans\ Mono:h14

" Delphi C SWREF
set expandtab
set cindent
set tabstop=3
set softtabstop=3
set shiftwidth=3
set colorcolumn=80
set backspace=2

" Python
autocmd FileType python set foldmethod=indent   " set foldmethod to indent if editing a python file
autocmd FileType python set tabstop=4           " set indents to 4 if editing a python file
autocmd FileType python set softtabstop=4       " set indents to 4 if editing a python file
autocmd FileType python set shiftwidth=4        " set indents to 4 if editing a python file



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Fn                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd BufWritePre * call RemoveTrailingWhitespace()
nnoremap <F2> :call RemoveTrailingWhitespace()<CR>

" gundo
nnoremap <F3> :GundoToggle<CR>

" Use leader F4 to call Nerdtree
nnoremap <Leader><F4> :NERDTreeToggle<CR>

" Quick write session with F8
nnoremap <F8> :mksession! ~/.vim_session <CR>

" Load session with F9
nnoremap <F9> :source ~/.vim_session <CR>
" http://stackoverflow.com/questions/9281438/syntax-highlighting-doesnt-work-after-restore-a-previous-vim-session
set sessionoptions-=options

" Yankring
nnoremap <F11> :YRShow<CR>

" A
nnoremap <F12> :A<CR>

" Syntastic
nnoremap <F10> :SyntasticToggleMode<CR>
