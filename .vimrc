" My Plugins
call plug#begin('~/.vim/plugged')
    Plug 'airblade/vim-gitgutter'
    Plug 'diepm/vim-rest-console'
    Plug 'dyng/ctrlsf.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'leafoftree/vim-vue-plugin'
    Plug 'majutsushi/tagbar'
    Plug 'morhetz/gruvbox'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'nvie/vim-flake8'
    Plug 'pbogut/fzf-mru.vim'
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    Plug 'psf/black', { 'tag': '19.10b0' }
    Plug 'sainnhe/gruvbox-material'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/syntastic'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'Valloric/YouCompleteMe'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-python/python-syntax'
call plug#end()


" Plugin 'leafoftree/vim-vue-plugin'
" Plugin 'taglist.vim'
" Plugin 'tidalcycles/vim-tidal'
" Plugin 'wakatime/vim-wakatime'
" Plugin 'Yggdroot/indentLine'
" Plugin 'bronson/vim-trailing-whitespace'
" Plugin 'dkprice/vim-easygrep'
" Plugin 'mattn/emmet-vim'
" Plugin 'mattn/webapi-vim'
" Plugin 'mxw/vim-jsx'
" Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Plugin 'pangloss/vim-javascript'

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
syntax enable


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

" This is for tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set background=dark
set background=light

" colorscheme gruvboxmaterial
let g:gruvbox_material_background = 'soft'  " hard, medium, soft
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_cursor = 'purple'
colorscheme gruvbox-material

" List buffers and cycle
nnoremap <C-b> :Buffers<CR>
nnoremap <C-n> :Files<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap q :bd<CR>

augroup python
    " clear augroup when reloading vimrc
    au!
    autocmd FileType python set colorcolumn=110
    let g:black_linelength = 110
    let g:python_highlight_all = 1
    let g:black_virtualenv="~/.vim_black"
    autocmd BufWritePre *.py execute ':Black'
augroup END

augroup javascript
    au!
    autocmd FileType javascript  set colorcolumn=108
    set shiftwidth=2
    set tabstop=2
augroup END


"autocmd BufWritePre *.js Neoformat
set colorcolumn=110

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
" Open nerdtree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8'] " add 'pylint' for extra lint
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

" YCM
let g:ycm_confirm_extra_conf = 0

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
autocmd FileType python,javascript,haskell,elm,css,html,go,c,ocaml  autocmd BufWritePre <buffer> StripWhitespace

autocmd Filetype markdown setlocal wrap
autocmd Filetype markdown setlocal linebreak
autocmd Filetype markdown setlocal nolist
autocmd Filetype markdown setlocal columns=80


" Set Jenkinsfile to groovy
au BufNewFile,BufRead Jenkinsfile setf groovy

" Airline
let g:airline#extensions#tabline#enabled = 1
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
nnoremap <C-j> :YcmCompleter GoTo<CR>
nnoremap <C-k> :YcmCompleter GetDoc<CR>

" Abbreviations
iabbrev pdb import pdb;pdb.set_trace()

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" TagBar
nmap <leader>t :TagbarToggle<CR>

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
