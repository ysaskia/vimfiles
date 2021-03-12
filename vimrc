packadd! onedark

" Environement variable for Language Server Protocol
set rtp+=~/.vim/pack/plugins/start/language-client
let g:LanguageClient_serverCommands = {
  \ 'haskell': ['hie-wrapper'],
  \ }
" \ 'javascript': ['/home/yoann/.lsp/ts/node_modules/.bin/javascript-typescript-stdio'],
" \ 'javascript.jsx': ['/home/yoann/.lsp/ts/node_modules/.bin/javascript-typescript-stdio'],
" \ }

set termguicolors

" Select colorshceme to use
colorscheme onedark

" Set character encoding
set encoding=UTF-8

" Enable syntax highlighting
syntax on

" Enable mouse events
set mouse=a

" show mode
set noshowmode

" status line 
set laststatus=2

" display line numbers
set number

" The size of an "indent". It's also measured in spaces, so if your 
" code base indents with tab characters thee you want shiftwidth to 
" equal the number of tab characters times tabstop. This is also used 
" by things like the =, > and < commands.
set shiftwidth=2

" The width of a hard tabstop measured in "spaces" effectively the
"  maximum width of an actual tab character.
set tabstop=2

" Setting thisl to a non-zero value other than tabstop will make the 
" tab key (in insert mode) insert a combination of spaces (and 
" possibly tabs) to simulate tab stops at this width.
set softtabstop=1

" Enabling this will make the tab key (in insert mode) insert spaces 
" instead of tab characters. This also affects the behavior of the 
" retab command.
set expandtab

" Enabling this will make the tab key (in insert mode) insert spaces 
" or tabs to go to the next indent of the next tabstop when the cursor 
" is at the beginning of a line (i.e. the only preceding characters 
" are whitespace).
set smarttab

set autoindent

" Do smart autoindenting when starting a new line. Works for C-like
" programs, but can also be used for other languages.
set smartindent

" Specifies the character used for the vertical split.
set fillchars+=vert:│

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" vim-ale
let g:ale_linters = {'javascript': ['eslint']}
let g:airline#extension#ale#enabled = 1
let g:ale_sign_error = '▼'

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'onedark'

" nerdtree 
"let NERDTreeMinimalUI=1
"let NERDTreeDirArrows=1

" switch konsole colorscheme when using vim and restore it when leaving
" see /usr/share/konsole for base colorscheme 
" see ~/.local/share/konsole for custom colorscheme
" autocmd VimEnter * :silent exec '!konsoleprofile "colors=One Dark"'
" autocmd VimLeave * :silent exec '!konsoleprofile "colors=Linux"'

" cursor shape for windows terminal
" insert mode
let &t_SI .= "\e[6 q"
" replace mode
let &t_SR .= "\e[4 q"
" normal mode (ELSE)
let &t_EI .= "\e[1 q"
