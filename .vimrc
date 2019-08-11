set nocompatible              " be iMproved, required
filetype plugin on    " required
set t_Co=256
set term=xterm-256color
syntax on                 " required

autocmd Filetype * AnyFoldActivate               " activate for all filetypes
set foldlevel=0  " close all folds

" My Vim presets
set expandtab
set number
set cursorline
set autoindent
set smartindent
set cindent
filetype indent on
set tags=tags

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
"Plugin 'gcmt/taboo.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'vim-airline/vim-airline'
"Color schemes
Plugin 'crusoexia/vim-dracula'

" Code folding
Plugin 'pseewald/vim-anyfold'

Bundle 'edkolev/promptline.vim'
"Plugin 'maralla/validator.vim'
Plugin 'pangloss/vim-javascript'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'mtikekar/vim-bsv'

"Python plugins
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'python-mode/python-mode'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"Put your non-Plugin stuff after this line

" Airline Customizations
let g:airline_powerline_fonts = 1
let g:Powerline_symbols='unicode'
let g:airline#extensions#tabline#enabled = 1

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

" NERDTree Config
"let NERDTreeMinimalUI = 1

" Vim colorscheme
colorscheme dracula
let g:draculaitalic = 1

"" Validator config
"let g:validator_c_checkers = ['clang-tidy']
"let g:validator_debug = 1

" Taboo config
"set sessionoptions+=tabpages,globals

" Split movement
nnoremap gw <C-W><C-W>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gh <C-W><C-H>
nnoremap gl <C-W><C-L>

"JavaScript config
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1


" Changing cursor from Edit mode to insert mode
if has("autocmd")
        au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
        au InsertEnter,InsertChange *
                                \ if v:insertmode == 'i' | 
                                \   silent execute '!echo -ne "\e[5 q"' | redraw! |
                                \ elseif v:insertmode == 'r' |
                                \   silent execute '!echo -ne "\e[3 q"' | redraw! |
                                \ endif
        au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

let python_highlight_all=1

if filereadable(expand("~/.vimrc_background"))
          let base16colorspace=256
            source ~/.vimrc_background
    endif
