" Web Development Specific Vim Configuration
" No plugins required - uses only built-in Vim features

" ===============================================
" WEB FILE TYPE DETECTION & SYNTAX
" ===============================================
filetype on
filetype indent on

" ===============================================
" INDENTATION FOR WEB LANGUAGES
" ===============================================
" 2 spaces for web languages
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent

" ===============================================
" INTUITIVE EDITING ENHANCEMENTS
" ===============================================
" More intuitive line wrapping
set linebreak
set breakindent

" Better backspace behavior
set backspace=indent,eol,start

" Auto-close brackets and quotes
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

" Smart auto-close with newline for braces
inoremap {<CR> {<CR>}<Esc>O

" ===============================================
" VISUAL ENHANCEMENTS
" ===============================================
" Highlight matching HTML tags
set matchpairs+=<:>

" Better search highlighting
set hlsearch
set incsearch
nnoremap <Leader><space> :nohlsearch<CR>

" Show invisible characters (helpful for web dev)
set list
set listchars=tab:▸\ ,trail:·,nbsp:␣

" Visual line selection improvements
vnoremap < <gv
vnoremap > >gv

" ===============================================
" FOLDING FOR CODE ORGANIZATION
" ===============================================
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

" Better folding for JavaScript/CSS blocks
autocmd FileType javascript,css setlocal foldmethod=syntax

" Space to toggle folds
nnoremap <space> za

" ===============================================
" COMPLETION ENHANCEMENTS
" ===============================================
" Enhanced completion for web development
set complete+=k
set completeopt=menuone,longest,preview

" HTML/CSS completion
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" Trigger completion with Tab in insert mode
inoremap <Tab> <C-n>
inoremap <S-Tab> <C-p>

" ===============================================
" BUFFER AND WINDOW MANAGEMENT
" ===============================================
" Easier window splitting
nnoremap <Leader>v <C-w>v
nnoremap <Leader>s <C-w>s

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quick buffer switching
nnoremap <Leader>b :buffer <Tab>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprev<CR>

" ===============================================
" WEB DEV SPECIFIC FEATURES
" ===============================================
" Auto-format JSON
nnoremap <Leader>json :%!python -m json.tool<CR>

" ===============================================
" PRODUCTIVITY SHORTCUTS
" ===============================================
" Save and run common web dev commands
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>

" Quick duplicate line
nnoremap <Leader>d yyp

" Select all
nnoremap <Leader>a ggVG

" Quick search and replace
nnoremap <Leader>r :%s//g<Left><Left>

" Open file in browser (adjust command as needed)
nnoremap <Leader>o :!open %<CR>
