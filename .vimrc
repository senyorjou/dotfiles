set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" My Plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'diepm/vim-rest-console'
Plugin 'dkprice/vim-easygrep'
Plugin 'hoelzro/elm-vim'
Plugin 'fatih/vim-go'
Plugin 'kien/ctrlp.vim' " UPDATE THIS!!! Not maintained
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mattn/emmet-vim'
Plugin 'majutsushi/tagbar'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'wakatime/vim-wakatime'
Plugin 'Yggdroot/indentLine'
"Plugin 'Yggdroot/hiPairs'

"Plugin 'taglist.vim'

filetype plugin indent on

set cursorline
set backspace=2 " make backspace work like most other apps
set laststatus=2
set modelines=0
set clipboard=unnamed
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

" Vertical line at 80
set colorcolumn=80

" Color Scheme
syntax enable
" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized

colorscheme molokai
" Change some colors. Map reference --> https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
hi Visual ctermbg=025
hi CursorLine ctermbg=238

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

" ELM
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1

" go-vim
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

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

" Trim whitespace on save
autocmd FileType python,javascript,haskell,elm,css,html  autocmd BufWritePre <buffer> StripWhitespace

autocmd Filetype markdown setlocal wrap
autocmd Filetype markdown setlocal linebreak
autocmd Filetype markdown setlocal nolist
autocmd Filetype markdown setlocal columns=80

" Airline
let g:airline#extensions#tabline#enabled = 1

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
