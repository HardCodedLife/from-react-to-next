
pecific Vim Configuration
" No plugins required - uses only built-in Vim features

" ===============================================
" WEB FILE TYPE DETECTION & SYNTAX
" ===============================================
filetype on
filetype indent on
syntax enable

" Enhanced web file detection
augroup WebDev
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascript
  autocmd BufRead,BufNewFile *.tsx set filetype=typescript
  autocmd BufRead,BufNewFile *.vue set filetype=html
  autocmd BufRead,BufNewFile *.json set filetype=json
  autocmd BufRead,BufNewFile .eslintrc,.prettierrc set filetype=json
augroup END

" ===============================================
" INDENTATION FOR WEB LANGUAGES
" ===============================================
" Force 2 spaces for all web languages (override any defaults)
set tabstop=2
set shiftwidth=2 
set softtabstop=2
set expandtab

" Additional override for specific web file types
autocmd FileType html,css,scss,sass,javascript,typescript,json,yaml,xml setlocal
  \ tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ expandtab
  \ autoindent
  \ smartindent

" Force re-indenting existing content to 2 spaces
autocmd BufRead,BufNewFile *.html,*.css,*.scss,*.sass,*.js,*.jsx,*.ts,*.tsx,*.json,*.yaml,*.yml,*.xml 
  \ setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab |
  \ retab

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
" WEB DEVELOPMENT SHORTCUTS
" ===============================================
" Quick HTML tag creation
inoremap <Leader>div <div></div><Esc>F>a
inoremap <Leader>span <span></span><Esc>F>a
inoremap <Leader>p <p></p><Esc>F>a
inoremap <Leader>a <a href=""></a><Esc>F"a
inoremap <Leader>img <img src="" alt=""><Esc>F"a

" CSS shortcuts
inoremap <Leader>color color: ;<Left>
inoremap <Leader>bg background: ;<Left>
inoremap <Leader>margin margin: ;<Left>
inoremap <Leader>padding padding: ;<Left>

" JavaScript shortcuts
inoremap <Leader>func function() {<CR>}<Esc>O
inoremap <Leader>arrow () => {<CR>}<Esc>O<Tab>
inoremap <Leader>const const  = <Left><Left><Left>
inoremap <Leader>let let  = <Left><Left><Left>
inoremap <Leader>cl console.log();<Left><Left>

" ===============================================
" ENHANCED NAVIGATION
" ===============================================
" Jump between HTML tags
nnoremap <Leader>t /<[^/].*><CR>
nnoremap <Leader>T ?<[^/].*><CR>

" Quick navigation to closing tag
nnoremap <Leader>% /<</<CR>

" Better file navigation
set path+=**
set wildmenu
set wildmode=longest:full,full

" Quick file finding for common web files
nnoremap <Leader>fi :find *
nnoremap <Leader>fh :find *.html<Tab>
nnoremap <Leader>fc :find *.css<Tab>
nnoremap <Leader>fj :find *.js<Tab>

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

" Quick color preview (works with hex colors)
autocmd FileType css,html,javascript syntax match cssColor '#[0-9a-fA-F]\{3,6\}' contained

" ===============================================
" AUTO-CLOSE HTML/XML TAGS
" ===============================================
" Automatic closing for XML/HTML tags
autocmd FileType html,xml inoremap </ </<C-X><C-O>

" Auto-close tags when typing >
function! CloseTag()
    let line = getline('.')
    let col = col('.') - 1
    let before = line[:col-1]
    
    " Check if we just typed > after a tag name
    if before =~ '<\w\+[^>]*

" Better comment handling for different file types
autocmd FileType javascript,css nnoremap <buffer> <Leader>/ :s/^/\/\/ /<CR>
autocmd FileType html,xml nnoremap <buffer> <Leader>/ :s/^/<!-- /<CR>:s/$/ -->/<CR>

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
        let tag = matchstr(before, '<\zs\w\+\ze[^>]*

" Better comment handling for different file types
autocmd FileType javascript,css nnoremap <buffer> <Leader>/ :s/^/\/\/ /<CR>
autocmd FileType html,xml nnoremap <buffer> <Leader>/ :s/^/<!-- /<CR>:s/$/ -->/<CR>

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
nnoremap <Leader>o :!open %<CR>)
        " Don't auto-close self-closing tags
        if tag !~ '^\(area\|base\|br\|col\|embed\|hr\|img\|input\|link\|meta\|param\|source\|track\|wbr\)

" Better comment handling for different file types
autocmd FileType javascript,css nnoremap <buffer> <Leader>/ :s/^/\/\/ /<CR>
autocmd FileType html,xml nnoremap <buffer> <Leader>/ :s/^/<!-- /<CR>:s/$/ -->/<CR>

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
            return '</' . tag . '>'
        endif
    endif
    return ''
endfunction

" Auto-close tags in HTML files
autocmd FileType html,xml inoremap > ><C-R>=CloseTag()<CR>

" Alternative simpler auto-close (uncomment if you prefer this)
" autocmd FileType html inoremap <buffer> > ></<C-X><C-O>

" Quick close current tag
autocmd FileType html,xml nnoremap <buffer> <Leader>ct F<lyt>f>a</<C-r>"><Esc>

" Better comment handling for different file types
autocmd FileType javascript,css nnoremap <buffer> <Leader>/ :s/^/\/\/ /<CR>
autocmd FileType html,xml nnoremap <buffer> <Leader>/ :s/^/<!-- /<CR>:s/$/ -->/<CR>

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
pecific Vim Configuration
" No plugins required - uses only built-in Vim features

" ===============================================
" WEB FILE TYPE DETECTION & SYNTAX
" ===============================================
filetype on
filetype indent on
syntax enable

" Enhanced web file detection
augroup WebDev
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascript
  autocmd BufRead,BufNewFile *.tsx set filetype=typescript
  autocmd BufRead,BufNewFile *.vue set filetype=html
  autocmd BufRead,BufNewFile *.json set filetype=json
  autocmd BufRead,BufNewFile .eslintrc,.prettierrc set filetype=json
augroup END

" ===============================================
" INDENTATION FOR WEB LANGUAGES
" ===============================================
" Force 2 spaces for all web languages (override any defaults)
set tabstop=2
set shiftwidth=2 
set softtabstop=2
set expandtab

" Additional override for specific web file types
autocmd FileType html,css,scss,sass,javascript,typescript,json,yaml,xml setlocal
  \ tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ expandtab
  \ autoindent
  \ smartindent

" Force re-indenting existing content to 2 spaces
autocmd BufRead,BufNewFile *.html,*.css,*.scss,*.sass,*.js,*.jsx,*.ts,*.tsx,*.json,*.yaml,*.yml,*.xml 
  \ setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab |
  \ retab

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
" WEB DEVELOPMENT SHORTCUTS
" ===============================================
" Quick HTML tag creation
inoremap <Leader>div <div></div><Esc>F>a
inoremap <Leader>span <span></span><Esc>F>a
inoremap <Leader>p <p></p><Esc>F>a
inoremap <Leader>a <a href=""></a><Esc>F"a
inoremap <Leader>img <img src="" alt=""><Esc>F"a

" CSS shortcuts
inoremap <Leader>color color: ;<Left>
inoremap <Leader>bg background: ;<Left>
inoremap <Leader>margin margin: ;<Left>
inoremap <Leader>padding padding: ;<Left>

" JavaScript shortcuts
inoremap <Leader>func function() {<CR>}<Esc>O
inoremap <Leader>arrow () => {<CR>}<Esc>O<Tab>
inoremap <Leader>const const  = <Left><Left><Left>
inoremap <Leader>let let  = <Left><Left><Left>
inoremap <Leader>cl console.log();<Left><Left>

" ===============================================
" ENHANCED NAVIGATION
" ===============================================
" Jump between HTML tags
nnoremap <Leader>t /<[^/].*><CR>
nnoremap <Leader>T ?<[^/].*><CR>

" Quick navigation to closing tag
nnoremap <Leader>% /<</<CR>

" Better file navigation
set path+=**
set wildmenu
set wildmode=longest:full,full

" Quick file finding for common web files
nnoremap <Leader>fi :find *
nnoremap <Leader>fh :find *.html<Tab>
nnoremap <Leader>fc :find *.css<Tab>
nnoremap <Leader>fj :find *.js<Tab>

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

" Quick color preview (works with hex colors)
autocmd FileType css,html,javascript syntax match cssColor '#[0-9a-fA-F]\{3,6\}' contained

" ===============================================
" AUTO-CLOSE HTML/XML TAGS
" ===============================================
" Automatic closing for XML/HTML tags
autocmd FileType html,xml inoremap </ </<C-X><C-O>

" Auto-close tags when typing >
function! CloseTag()
    let line = getline('.')
    let col = col('.') - 1
    let before = line[:col-1]
    
    " Check if we just typed > after a tag name
    if before =~ '<\w\+[^>]*

" Better comment handling for different file types
autocmd FileType javascript,css nnoremap <buffer> <Leader>/ :s/^/\/\/ /<CR>
autocmd FileType html,xml nnoremap <buffer> <Leader>/ :s/^/<!-- /<CR>:s/$/ -->/<CR>

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
        let tag = matchstr(before, '<\zs\w\+\ze[^>]*

" Better comment handling for different file types
autocmd FileType javascript,css nnoremap <buffer> <Leader>/ :s/^/\/\/ /<CR>
autocmd FileType html,xml nnoremap <buffer> <Leader>/ :s/^/<!-- /<CR>:s/$/ -->/<CR>

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
nnoremap <Leader>o :!open %<CR>)
        " Don't auto-close self-closing tags
        if tag !~ '^\(area\|base\|br\|col\|embed\|hr\|img\|input\|link\|meta\|param\|source\|track\|wbr\)

" Better comment handling for different file types
autocmd FileType javascript,css nnoremap <buffer> <Leader>/ :s/^/\/\/ /<CR>
autocmd FileType html,xml nnoremap <buffer> <Leader>/ :s/^/<!-- /<CR>:s/$/ -->/<CR>

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
            return '</' . tag . '>'
        endif
    endif
    return ''
endfunction

" Auto-close tags in HTML files
autocmd FileType html,xml inoremap > ><C-R>=CloseTag()<CR>

" Alternative simpler auto-close (uncomment if you prefer this)
" autocmd FileType html inoremap <buffer> > ></<C-X><C-O>

" Quick close current tag
autocmd FileType html,xml nnoremap <buffer> <Leader>ct F<lyt>f>a</<C-r>"><Esc>

" Better comment handling for different file types
autocmd FileType javascript,css nnoremap <buffer> <Leader>/ :s/^/\/\/ /<CR>
autocmd FileType html,xml nnoremap <buffer> <Leader>/ :s/^/<!-- /<CR>:s/$/ -->/<CR>

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
pecific Vim Configuration
" No plugins required - uses only built-in Vim features

" ===============================================
" WEB FILE TYPE DETECTION & SYNTAX
" ===============================================
filetype on
filetype indent on
syntax enable

" Enhanced web file detection
augroup WebDev
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascript
  autocmd BufRead,BufNewFile *.tsx set filetype=typescript
  autocmd BufRead,BufNewFile *.vue set filetype=html
  autocmd BufRead,BufNewFile *.json set filetype=json
  autocmd BufRead,BufNewFile .eslintrc,.prettierrc set filetype=json
augroup END

" ===============================================
" INDENTATION FOR WEB LANGUAGES
" ===============================================
" Force 2 spaces for all web languages (override any defaults)
set tabstop=2
set shiftwidth=2 
set softtabstop=2
set expandtab

" Additional override for specific web file types
autocmd FileType html,css,scss,sass,javascript,typescript,json,yaml,xml setlocal
  \ tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ expandtab
  \ autoindent
  \ smartindent

" Force re-indenting existing content to 2 spaces
autocmd BufRead,BufNewFile *.html,*.css,*.scss,*.sass,*.js,*.jsx,*.ts,*.tsx,*.json,*.yaml,*.yml,*.xml 
  \ setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab |
  \ retab

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
" WEB DEVELOPMENT SHORTCUTS
" ===============================================
" Quick HTML tag creation
inoremap <Leader>div <div></div><Esc>F>a
inoremap <Leader>span <span></span><Esc>F>a
inoremap <Leader>p <p></p><Esc>F>a
inoremap <Leader>a <a href=""></a><Esc>F"a
inoremap <Leader>img <img src="" alt=""><Esc>F"a

" CSS shortcuts
inoremap <Leader>color color: ;<Left>
inoremap <Leader>bg background: ;<Left>
inoremap <Leader>margin margin: ;<Left>
inoremap <Leader>padding padding: ;<Left>

" JavaScript shortcuts
inoremap <Leader>func function() {<CR>}<Esc>O
inoremap <Leader>arrow () => {<CR>}<Esc>O<Tab>
inoremap <Leader>const const  = <Left><Left><Left>
inoremap <Leader>let let  = <Left><Left><Left>
inoremap <Leader>cl console.log();<Left><Left>

" ===============================================
" ENHANCED NAVIGATION
" ===============================================
" Jump between HTML tags
nnoremap <Leader>t /<[^/].*><CR>
nnoremap <Leader>T ?<[^/].*><CR>

" Quick navigation to closing tag
nnoremap <Leader>% /<</<CR>

" Better file navigation
set path+=**
set wildmenu
set wildmode=longest:full,full

" Quick file finding for common web files
nnoremap <Leader>fi :find *
nnoremap <Leader>fh :find *.html<Tab>
nnoremap <Leader>fc :find *.css<Tab>
nnoremap <Leader>fj :find *.js<Tab>

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

" Quick color preview (works with hex colors)
autocmd FileType css,html,javascript syntax match cssColor '#[0-9a-fA-F]\{3,6\}' contained

" Automatic closing for XML/HTML tags
autocmd FileType html,xml inoremap </ </<C-X><C-O>

" Better comment handling for different file types
autocmd FileType javascript,css nnoremap <buffer> <Leader>/ :s/^/\/\/ /<CR>
autocmd FileType html,xml nnoremap <buffer> <Leader>/ :s/^/<!-- /<CR>:s/$/ -->/<CR>

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
" No plugins required - uses only built-in Vim features

" ===============================================
" WEB FILE TYPE DETECTION & SYNTAX
" ===============================================
filetype on
filetype indent on
syntax enable

" Enhanced web file detection
augroup WebDev
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascript
  autocmd BufRead,BufNewFile *.tsx set filetype=typescript
  autocmd BufRead,BufNewFile *.vue set filetype=html
  autocmd BufRead,BufNewFile *.json set filetype=json
  autocmd BufRead,BufNewFile .eslintrc,.prettierrc set filetype=json
augroup END

" ===============================================
" INDENTATION FOR WEB LANGUAGES
" ===============================================
" 2 spaces for web languages
autocmd FileType html,css,scss,sass,javascript,typescript,json,yaml,xml setlocal
  \ tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ expandtab
  \ autoindent
  \ smartindent

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
" WEB DEVELOPMENT SHORTCUTS
" ===============================================
" Quick HTML tag creation
inoremap <Leader>div <div></div><Esc>F>a
inoremap <Leader>span <span></span><Esc>F>a
inoremap <Leader>p <p></p><Esc>F>a
inoremap <Leader>a <a href=""></a><Esc>F"a
inoremap <Leader>img <img src="" alt=""><Esc>F"a

" CSS shortcuts
inoremap <Leader>color color: ;<Left>
inoremap <Leader>bg background: ;<Left>
inoremap <Leader>margin margin: ;<Left>
inoremap <Leader>padding padding: ;<Left>

" JavaScript shortcuts
inoremap <Leader>func function() {<CR>}<Esc>O
inoremap <Leader>arrow () => {<CR>}<Esc>O<Tab>
inoremap <Leader>const const  = <Left><Left><Left>
inoremap <Leader>let let  = <Left><Left><Left>
inoremap <Leader>cl console.log();<Left><Left>

" ===============================================
" ENHANCED NAVIGATION
" ===============================================
" Jump between HTML tags
nnoremap <Leader>t /<[^/].*><CR>
nnoremap <Leader>T ?<[^/].*><CR>

" Quick navigation to closing tag
nnoremap <Leader>% /<</<CR>

" Better file navigation
set path+=**
set wildmenu
set wildmode=longest:full,full

" Quick file finding for common web files
nnoremap <Leader>fi :find *
nnoremap <Leader>fh :find *.html<Tab>
nnoremap <Leader>fc :find *.css<Tab>
nnoremap <Leader>fj :find *.js<Tab>

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

" Quick color preview (works with hex colors)
autocmd FileType css,html,javascript syntax match cssColor '#[0-9a-fA-F]\{3,6\}' contained

" Automatic closing for XML/HTML tags
autocmd FileType html,xml inoremap </ </<C-X><C-O>

" Better comment handling for different file types
autocmd FileType javascript,css nnoremap <buffer> <Leader>/ :s/^/\/\/ /<CR>
autocmd FileType html,xml nnoremap <buffer> <Leader>/ :s/^/<!-- /<CR>:s/$/ -->/<CR>

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
