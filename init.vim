map s <nop>
map S :w<CR>
map Q :q<CR>
map si :set splitright<CR>:vsplit<CR>
map sn :set nosplitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:split<CR>
map sm :set splitbelow<CR>:split<CR>
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
map tu :tabe<CR>
map tn :-tabnext<CR>
map ti :+tabnext<CR>
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map <LEADER>i <C-w>l
map <LEADER>u <C-w>k
map <LEADER>n <C-w>h
map <LEADER>m <C-w>j

set number
set relativenumber
" set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
" set mouse=a
set laststatus=2
" set clipboard =unnamedplus
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ==========
syntax on 


noremap <LEADER><CR> :nohlsearch<CR>
" vnoremap Y "+y

" ===============================================================================
" coc.nvim
" ===============================================================================
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-yank','coc-java','coc-python','coc-flutter-tools', 'coc-css', 'coc-diagnostic', 'coc-eslint', 'coc-explorer', 'coc-translator','coc-snippets']


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-o> to trigger completion.
inoremap <silent><expr> <c-o> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> <LEADER>h :call ShowDocumentation()<CR>
nnoremap <silent> K :call ShowDocumentation()<CR>
nnoremap tt :CocCommand explorer<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)



" =========================================

" ===============================================================================
" vimtex default compile engine
" ===============================================================================

    let g:vimtex_compiler_latexmk_engines = {
        \ '_'                : '-xelatex',
        \ 'pdfdvi'           : '-pdfdvi',
        \ 'pdfps'            : '-pdfps',
        \ 'pdflatex'         : '-pdf',
        \ 'luatex'           : '-lualatex',
        \ 'lualatex'         : '-lualatex',
        \ 'xelatex'          : '-xelatex',
        \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
        \ 'context (luatex)' : '-pdf -pdflatex=context',
        \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
        \}
" \ '_'                : '-pdf',
" =========================================
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']  " using Neovim
" This code should go in your vimrc or init.vim
" let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
" let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
" let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops
let g:UltiSnipsExpandTrigger       = '<c-e>' 
let g:UltiSnipsJumpForwardTrigger  = '<c-e>'   
let g:UltiSnipsJumpBackwardTrigger = '<c-n>' 


filetype on             " enable filetype detection
filetype plugin on      " load file-specific plugins
filetype indent on      " load file-specific indentation


call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'

" File navigation
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'junegunn/vim-peekaboo'


" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'


Plug 'lervag/vimtex'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Flutter
Plug 'dart-lang/dart-vim-plugin'

call plug#end()

color snazzy
" let g:SnazzyTransparent = 1
