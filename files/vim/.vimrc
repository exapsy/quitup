" Vundle plugin manager setup
" All plugins should be added on that file
" Do not add Plugins or other Vundle commands in .vimrc
source ~/.vim/configs/vundle.vimrc

"
" SETTINGS
"
"

set clipboard+=unnamedplus
" Set for NERDTree icons vim-devicons
set encoding=UTF-8
" Set syntax highlighting
syntax on
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
"set list
"set listchars=tab>.:,trail:.,extends:#,nbsp:.
"autocmd filetype html,xml set listchars-=tab:>.
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

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

"
" MAPPINGS
"
"

" Change escape key for command mode, so it doesn't interfeer with alt combos
" and you dont have to stretch your hand
inoremap jk <esc>
inoremap kj <esc>
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
noremap <leader>qq :q<CR>
" Force quit
noremap <leader>!q :q!<CR>
" Quit all
noremap <leader>aq :qa<CR>
" Force quit all
noremap <leader>!aq :qa!<CR>
" Move lines with Alt+j/k
"nnoremap <A-k> :m .-2<CR>==
"nnoremap <A-j> :m .+1<CR>==
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
noremap <F6> :call OpenNERDTree()<CR>
function! OpenNERDTree()
	if exists('t:NERDTreeBufName')
		let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
	else
		let nerdtree_open = 0
	endif

	if nerdtree_open
		NERDTreeToggle
	else
		let exitmsg = execute(":NERDTreeFind")
		if exitmsg == "\nNERDTree: no file for the current buffer"
			execute(":NERDTreeToggle")
		endif
	endif
endfunction
" ctrlp-funky #mappings
nnoremap <leader>fu :CtrlPFunky<Cr>
nnoremap <leader>fU :execute 'CtrlPFunky ' .expand('<cword>')<Cr>
" TagBar #mapping
noremap <F8> :TagbarToggle<CR>
" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
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
nnoremap ts :vsplit<Space>
nnoremap th :split<Space>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Delete backwards words with Ctrl+Backspace
inoremap <C-BS> <C-W>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Fix coc.nvim not reloading
au FocusGained,BufEnter,CursorHold * nested checktime %

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Open new tab on enter
let NERDTreeMapOpenInTab='<ENTER>'
" GitGutter hunk
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

"
" PLUGINS MODIFICATIONS etc.
"
"

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

" Go Auto import
let g:go_fmt_command = "goimports"

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" COC Autocompletion
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,go setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight TODO and FIXME
augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX):/
          \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo

" Golang Linter
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
"autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

" Nerdtree #auto_open
" autocmd vimenter *  NERDTree
" #auto-close
let NERDTreeQuitOnOpen = 1

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
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"let g:airline_symbols.branch = '⎇'
" VimAirline shorten file path name
"let g:airline_section_b = '%-0.10{getcwd()}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" to truncate all path sections but the last one, e.g. a branch
" 'foo/bar/baz' becomes 'f/b/baz', use
" tabline
let g:airline#extensions#tabline#buf_label_first = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

au VimEnter * call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
au VimEnter * call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
au VimEnter * call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
au VimEnter * call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
au VimEnter * call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
au VimEnter * call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
au VimEnter * call NERDTreeHighlightFile('rb', 'Red', 'none', '#ffa500', '#151515')
au VimEnter * call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
au VimEnter * call NERDTreeHighlightFile('go', 'Magenta', 'none', '#D54763', '#D54763')
