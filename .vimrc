" My Plugins
call plug#begin('~/.vim/plugged')
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'majutsushi/tagbar'
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
call plug#end()


" Plugin 'leafoftree/vim-vue-plugin'
" Plugin 'lifepillar/vim-solarized8'
" Plugin 'psf/black'
" Plugin 'supercollider/scvim.git'
" Plugin 'taglist.vim'
" Plugin 'tidalcycles/vim-tidal'
" Plugin 'tomasr/molokai'
" Plugin 'wakatime/vim-wakatime'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Yggdroot/indentLine'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'bronson/vim-trailing-whitespace'
" Plugin 'diepm/vim-rest-console'
" Plugin 'dkprice/vim-easygrep'
" Plugin 'dyng/ctrlsf.vim'
" Plugin 'elmcast/elm-vim'
" Plugin 'fatih/vim-go'
" Plugin 'kien/ctrlp.vim' " UPDATE THIS!!! Not maintained
" Plugin 'mattn/emmet-vim'
" Plugin 'mattn/webapi-vim'
" Plugin 'mxw/vim-jsx'
" Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Plugin 'pangloss/vim-javascript'
" Plugin 'scrooloose/syntastic'

"set relativenumber
set backspace=2 " make backspace work like most other apps
set clipboard=unnamedplus
set cursorline
set encoding=utf-8
set expandtab
set hidden
set hlsearch
set ignorecase
set laststatus=2
set modelines=0
set nobackup
set noswapfile
set nowrap
set nowritebackup
set number
set shiftwidth=4
set smartcase
set splitright
set synmaxcol=128
set tabstop=4
set ttyscroll=10
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes



" Visual hint for brackets
set showmatch
set matchtime=3
" hide highlighted items
nnoremap <C-h> :nohlsearch<CR>

" Center current line. Use 0 to restore normal
set so=999

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" List buffers and cycle
"nnoremap <C-b> :bd<CR>
"nnoremap <Tab> :bnext<CR>
"nnoremap <S-Tab> :bprevious<CR>

" let vim know here black lives
"let g:black_virtualenv="~/.pyenv/versions/3.6.9/lib/python3.6/site-packages/black"
augroup python
    " clear augroup when reloading vimrc
    au!
    autocmd FileType python set colorcolumn=110
    "autocmd BufWritePre *.py execute ':Black'
augroup END

augroup javascript
    au!
    autocmd FileType javascript  set colorcolumn=110
augroup END

set colorcolumn=110
let g:black_linelength = 110
" Color Scheme
syntax enable
colorscheme gruvbox
let g:gruvbox_contrast_light='hard'
let g:gruvbox_hls_cursor='green'
set background=light

" Quickly select the text that was just pasted.
noremap gV `[v`]

" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv


" CtrlSF
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>


" NERDTree
nmap <leader>f :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.git', '.pyc', 'venv', 'tags']
let NERDTreeQuitOnOpen=1

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_check_on_open = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8'] " add 'pylint' for extra lint
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'


" ELM
"let g:elm_format_autosave = 1
"let g:elm_syntastic_show_warnings = 1

"let g:ycm_semantic_triggers = {
     "\ 'elm' : ['.'],
     "\}

" go-vim
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


" Trim whitespace on save
autocmd FileType python,javascript,haskell,elm,css,html,go,c  autocmd BufWritePre <buffer> StripWhitespace

autocmd Filetype markdown setlocal wrap
autocmd Filetype markdown setlocal linebreak
autocmd Filetype markdown setlocal nolist
autocmd Filetype markdown setlocal columns=80


" Set Jenkinsfile to groovy
au BufNewFile,BufRead Jenkinsfile setf groovy

" Airline
let g:airline#extensions#tabline#enabled = 1

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" YouCompleteMe
"nnoremap <C-j> :YcmCompleter GoTo<CR>
"nnoremap <C-k> :YcmCompleter GetDoc<CR>

" Split
"noremap <Leader>h :<C-u>split<CR>
"noremap <Leader>v :<C-u>vsplit<CR>

" TagBar
nmap <leader>t :TagbarToggle<CR>
"
" TagList Plugin Configuration
" let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
" let Tlist_GainFocus_On_ToggleOpen = 1
" let Tlist_Close_On_Select = 1
" let Tlist_Use_Right_Window = 1
" let Tlist_File_Fold_Auto_Close = 1
" map <F7> :TlistToggle<CR>

" SuperCollider
"let g:sclangTerm = "gnome-terminal -x $SHELL -ic"
"let g:scFlash = 1
"let g:sclangPipeApp    = "~/.vim/bundle/scvim/bin/start_pipe"
"let g:sclangDispatcher = "~/.vim/bundle/scvim/bin/sc_dispatcher"
