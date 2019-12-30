" Vundle plugin manager setup
" All plugins should be added on that file
" Do not add Plugins or other Vundle commands in .vimrc
source ~/.vim/configs/vundle.vimrc

"
" SETTINGS
"
"

" Change the leader from '\'
let mapleader=","
" Scroll centering
set scrolloff=9999
" More natural split opening #buffer #split
set splitbelow
set splitright
" Set vim history max
set history=1000
" Set undo history
set undolevels=1000
" Ignore files
set wildignore=*.swp,*.bak,*.pyc,*.class
" Change terminal's title
set title
" dont beep
set visualbell
set noerrorbells
" Highlight searches
set hlsearch
" Dont write backup files
set nobackup
set noswapfile
" Dont close files, buffer them so I can edit without being asked to save it
set hidden
" Highlight spaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.
" Paste toggle
set pastetoggle=<F2>
" Better search
" incsearch executes a search every time a new key is inserted
" ignorecase ignores input case
set incsearch
" YouCompleteMe requires utf8 encoding
set encoding=utf-8
" Set line lines indicators
set number
set relativenumber
" Set colorscheme #visual_studio #colorscheme
colorscheme codedark
" VimAirline theme
let g:airline_theme = 'codedark'
" Theme Compatibility
set t_Co=256
set t_ut=
colorscheme codedark

"
" MAPPINGS
"
"

" Change escape key for command mode, so it doesn't interfeer with alt combos
" and you dont have to stretch your hand
inoremap jj <ESC>
" Copy & Paste maps to system clipboard
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>Y "+y
noremap <leader>P "+p
" Reload shortcut
noremap <leader>e :so ~/.vimrc<CR>
" Save on <leader>w
noremap <leader>w :w<CR>
" Quit file
noremap <leader>q :q<CR>
" Force quit
noremap <leader>!q :q!<CR>
" Quit all
noremap <leader>aq :qa<CR>
" Force quit all
noremap <leader>!aq :qa!<CR>
" Move lines with Alt+j/k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" Disable arrow movement, resize splits instead.
nnoremap <Up> :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
" Shortcuts
nnoremap <leader>o :Files<CR>
nnoremap <leader>O :CtrlP<CR>
" Visual search
vnoremap // y/<C-R>"<CR>
" NerdTree #mappings #toggle
noremap <F6> :NERDTreeToggle<CR>
" ctrlp-funky #mappings
nnoremap <leader>fu :CtrlPFunky<Cr>
nnoremap <leader>fU :execute 'CtrlPFunky ' .expand('<cword>')<Cr>
" TagBar #mapping
noremap <F8> :TagbarToggle<CR>
" Easier window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Tab navigation #tabs #tab #navigation
" (ref: https://vim.fandom.com/wiki/Alternative_tab_navigation)
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap <tab>   :tabnext<CR>
nnoremap <s-tab> :tabprevious<CR>
" Delete backwards words with Ctrl+Backspace
inoremap <C-BS> <C-W>

"
" PLUGINS MODIFICATIONS etc.
"
"


" Highlight TODO and FIXME
augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX):/
          \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo

" Golang Linter
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

" Nerdtree #auto_open
" autocmd vimenter *  NERDTree
" #auto-close
let NERDTreeQuitOnOpen = 1

" Valloric/youcompleteme #autocomplete
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

" leafgarland/typescript-vim #typescript #lintering
autocmd FileType typescript setlocal completeopt+=menu,preview

" GitGutter #signs #colors
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" Enable GitGutter line highlights on changes
let g:gitgutter_highlight_lines = 1

" Auto reload when file changes in the disk
set autoread
au CursorHold, CursorHoldI * checktime " Trigger when cursor stops moving
au FocusGained, BufEnter * :checktime " Trigger on buffer change or terminal focus

" ctrlp #exclude #files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" google/vim-codefmt #autoformat #format #code
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,protoAutoFormatBuffer clang-format
  autocmd Filetype javascript,typescript AutoFormatBuffer prettier
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

" Tagbar #configurations
let g:tagbar_ctags_bin='/snap/bin/universal-ctags.ctags'
let g:tagbar_autofocus=1
let g:tagbar_autopreview=1
" Tagbar #language
let g:tagbar_type_vim = {
	\ 'ctagstype' : 'vim',
	\ 'kinds': [
		\ 'n:filenames',
		\ 'v:variables:1',
		\ 'f:functions',
		\ 'a:autocommands:1',
		\ 'c:commands',
		\ 'm:maps:1'
	\ ]
\ }
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
    \ ],
  \ 'sort' : 0 }

let g:tagbar_type_javascript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
    \ ],
  \ 'sort' : 0 }

" let g:tagbar_type_javascript = {
"      \ 'ctagstype': 'javascript',
"      \ 'kinds': [
"      \ 'A:arrays',
"      \ 'P:properties',
"      \ 'T:tags',
"      \ 'O:objects',
"      \ 'G:generator functions',
"      \ 'F:functions',
"      \ 'C:constructors/classes',
"      \ 'M:methods',
"      \ 'V:variables',
"      \ 'I:imports',
"      \ 'E:exports',
"      \ 'S:styled components',
"      \ ]}

" vim-javascript # jsdocs
let g:javascript_plugin_jsdoc = 1
" vim javascript # concealing characters
set conceallevel=1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
" VimAirline shorten file path name
let g:airline_section_b = '%-0.10{getcwd()}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" to truncate all path sections but the last one, e.g. a branch
"   " 'foo/bar/baz' becomes 'f/b/baz', use
let g:airline#extensions#branch#format = 2

