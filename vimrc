packadd! onedark

set termguicolors

" Select colorshceme to use
colorscheme onedark

" Enable syntax highlighting
syntax on

" Set character encoding
set encoding=UTF-8

set hidden

" Enable mouse events
set mouse=a

" show mode
set noshowmode

" status line 
set laststatus=2

" Displays line numbers
set number

" The size of an "indent". It's also measured in spaces, so if your 
" code base indents with tab characters thee you want shiftwidth to 
" equal the number of tab characters times tabstop. This is also used 
" by things like the =, > and < commands.
set shiftwidth=2

" The width of a hard tabstop measured in "spaces" effectively the
" maximum width of an actual tab character.
set tabstop=2

" Setting this to a non-zero value other than tabstop will make the 
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

" Tells vim to automatically indent the next line.
set autoindent

" Do smart autoindenting when starting a new line. Works for C-like
" programs, but can also be used for other languages.
set smartindent

" Specifies the character used for the vertical split.
set fillchars+=vert:│

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" 
set lazyredraw

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-javascript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" coc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
  \ pumvisible()            ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() 
  \? "\<C-p>" 
  \: "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() 
  \? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Displays the code documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
  \"javascript": ["eslint"],
  \"haskell": ["hls"]
  \}
let g:airline#extension#ale#enabled = 1
let g:ale_sign_error = '▼'

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'onedark'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let NERDTreeMinimalUI=1
"let NERDTreeDirArrows=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" windows specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32")
  " cursor shape for windows terminal
  " insert mode
  let &t_SI .= "\e[6 q"
  " replace mode
  let &t_SR .= "\e[4 q"
  " normal mode (ELSE)
  let &t_EI .= "\e[1 q"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Konsole specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" switch konsole colorscheme when using vim and restore it when leaving
" see /usr/share/konsole for base colorscheme 
" see ~/.local/share/konsole for custom colorscheme
" autocmd VimEnter * :silent exec '!konsoleprofile "colors=One Dark"'
" autocmd VimLeave * :silent exec '!konsoleprofile "colors=Linux"'
