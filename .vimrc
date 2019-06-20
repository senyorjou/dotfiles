set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" My Plugins

"Plugin 'lifepillar/vim-solarized8'
"Plugin 'tomasr/molokai'
"Plugin 'taglist.vim'
"Plugin 'wakatime/vim-wakatime'
Plugin 'airblade/vim-gitgutter'
Plugin 'ambv/black'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'diepm/vim-rest-console'
Plugin 'dkprice/vim-easygrep'
Plugin 'elmcast/elm-vim'
Plugin 'fatih/vim-go'
Plugin 'kien/ctrlp.vim' " UPDATE THIS!!! Not maintained
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'morhetz/gruvbox'
Plugin 'mxw/vim-jsx'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'Yggdroot/indentLine'

filetype plugin indent on

set cursorline
set backspace=2 " make backspace work like most other apps
set laststatus=2
set modelines=0
set clipboard=unnamedplus
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
set expandtab
set tabstop=4
set shiftwidth=4
set nowrap
"set relativenumber
set number
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase
set splitright

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

" List buffers and cycle
nnoremap <C-b> :bd<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

augroup python
    " clear augroup when reloading vimrc
    au!
    autocmd FileType python set colorcolumn=110
    autocmd BufWritePre *.py execute ':Black'
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

" Change some colors. Map reference --> https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
"hi Visual ctermbg=025
"hi CursorLine ctermbg=238

set background=light
let g:gruvbox_contrast_light='medium'



" Quickly select the text that was just pasted.
noremap gV `[v`]

" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.git', '.pyc', 'venv', 'tags']
let NERDTreeQuitOnOpen=1

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1

let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

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
autocmd FileType python,javascript,haskell,elm,css,html,go  autocmd BufWritePre <buffer> StripWhitespace

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
nnoremap <C-j> :YcmCompleter GoTo<CR>
nnoremap <C-k> :YcmCompleter GetDoc<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

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
