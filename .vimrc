set nocompatible
set autoindent
set completeopt-=preview

" Useful when working with someone else's code with weird coding style.
set copyindent

set autoread
set background=dark
set backspace+=indent,eol,start

" Copy and paste to system clipboard.
set clipboard=unnamedplus

set cmdheight=1

" Highlight all columns after textwidth.
let &colorcolumn='+' . join(range(1, 256), ',+')

set cryptmethod=blowfish

" Cursor line makes redraw slow, and look bad with lots of split windows.
" set cursorline

set display=lastline
set encoding=utf-8

" No beep and flash.
set noerrorbells
set novisualbell
set t_vb=

" Disable loading of local .vimrc for security.
set noexrc
set secure

" Solid line for window borders.
set fillchars=vert:│,fold:—

set foldlevel=99
set foldmethod=indent
set formatoptions+=ronlj

" Make GVim looks like Vim.
set guioptions=aigt

set history=100
set hlsearch
set ignorecase
set incsearch
set nojoinspaces
set laststatus=2
set lazyredraw
set linebreak
set list
set listchars=tab:❯›,trail:∙,extends:⋯,precedes:⋯,nbsp:▪
set number
set pastetoggle=<F12>
set ruler

" Always put cursor at the screen center.
set scrolloff=999

set sessionoptions-=buffers
set sessionoptions-=help
set shiftwidth=2
set shortmess=a
set showbreak=↪
set showcmd
set showmatch

" This option breaks logical comparison, should only be set for HTML filetype.
" set matchpairs+=<:>

set matchtime=3
set noshowmode
set showtabline=2
set sidescrolloff=4
set smartcase
set smartindent
set smarttab

" Airline integrates Syntastic automatically.
"set statusline=%<%f\ %{SyntasticStatuslineFlag()}\ %h%m%r%=%-14.(%l,%c%V%)\ %P

set switchbuf=useopen
set synmaxcol=1000
set t_Co=256
set tabstop=2
set expandtab
set textwidth=79
set title

" If undo directory doesn't exist then it's like undofile is disabled.
set undodir=~/.vim/.undo//
set undofile

set wildignore+=*.o
set wildignore+=*.obj
set wildignore+=*.pyc
set wildignore+=*/.git/*
set wildignore+=*/.hg/*
set wildignore+=*/.svn/*
set wildignore+=*/bower_components/*
set wildignore+=*/node_modules/*

set wildmenu
set wildmode=list:longest,full


" Move by row rather than line, can move into wrapped line naturally.
nnoremap j gj
nnoremap k gk

" Better documentation lookup instead of man page for keyword under cursor.
" nnoremap K :help <C-r><C-w><CR>
nnoremap K :!zeal --query '<cword>' >/dev/null 2>&1 &<CR><CR>

" Auto centering after jump, but doesn't work well with the last line unless
" all scroll keys also auto center. Using large scrolloff is better.
" nnoremap n nzz
" nnoremap N Nzz
" nnoremap # #zz
" nnoremap % %zz
" nnoremap * *zz
" nnoremap g# g#zz
" nnoremap g* g*zz
" nnoremap <C-o> <C-o>zz
" nnoremap <C-i> <C-i>zz

" No more Ex mode, use it to auto format line.
nnoremap Q gqj
vnoremap Q gqj

" Easier redo as the default U function is useless.
nnoremap U <C-r>

" Paste with paste mode on.
nnoremap <silent> yp :set paste<CR>p:set nopaste<CR>
nnoremap <silent> yP :set paste<CR>P:set nopaste<CR>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Swap keys to reach out to more useful keys with ease.
nnoremap ' `
nnoremap ` '
nnoremap 0 ^
vnoremap 0 ^
nnoremap ^ 0
vnoremap ^ 0

" Increment or decrement number.
nnoremap + <C-a>
nnoremap - <C-x>

" Access to command line.
nnoremap ; :
vnoremap ; :

" Use sane regular expression for searching.
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
cnoremap s// s/\v/gc<Left><Left><Left>

" Horizontal and vertical split.
nnoremap _ :split<CR>
nnoremap <Bar> :vsplit<CR>

" Resize split window.
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-
nnoremap <Left> <C-w><
nnoremap <Right> <C-w>>

" Switch split window.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move window.
nnoremap <C-Left> <C-w>H
nnoremap <C-Down> <C-w>J
nnoremap <C-Up> <C-w>K
nnoremap <C-Right> <C-w>L

" Switch tab.
nnoremap <S-h> gT
nnoremap <S-l> gt

" Move tab.
nnoremap <S-Left> :execute 'tabmove' tabpagenr() - 2<CR>
nnoremap <S-Right> :execute 'tabmove' tabpagenr()<CR>

" Browse location or quickfix list depending on which window is visible,
" default to location list if both lists are invisible.
nnoremap <expr> <C-n> IsBufferExist('location list') ?
  \ ':lnext<CR>' :
  \ IsBufferExist('quickfix list') ?
  \   ':cnext<CR>' :
  \   ':lnext<CR>'
nnoremap <expr> <C-p> IsBufferExist('location list') ?
  \ ':lprevious<CR>' :
  \ IsBufferExist('quickfix list') ?
  \   ':cprevious<CR>' :
  \   ':lprevious<CR>'

" Smash escape.
" NOTE: <Esc> doesn't work properly in command mode, so use go to normal mode.
noremap! jk <C-\><C-n>
noremap! kj <C-\><C-n>
noremap! JK <C-\><C-n>
noremap! KJ <C-\><C-n>

" Make sure pop-up menu doesn't block <CR>.
imap <expr> <CR> pumvisible() ? '<C-y><CR>' : '<Plug>delimitMateCR'

" Tab completion.
imap <expr> <Tab> neosnippet#expandable_or_jumpable() ?
  \ '<Plug>(neosnippet_jump_or_expand)' :
  \ pumvisible() ? '<C-n>' : '<Tab>'
smap <expr> <Tab> neosnippet#expandable_or_jumpable() ?
  \ '<Plug>(neosnippet_jump_or_expand)' :
  \ '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-p>' : '<Tab>'

" Do not reset indent to 1st column when '#' is typed.
inoremap # X#

" Prevent accidental undo while typing, recover by <Esc>u.
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" Change working directory to that of the current file.
cnoremap cd. cd %:p:h
cnoremap lcd. lcd %:p:h

" %% refers to current buffer's path.
cnoremap %% <C-r>=expand('%:p:h')<CR>/

" Allow writing file using sudo, will prompt for password.
cnoremap w!! w !sudo tee % >/dev/null


let mapleader=','
map <Leader><CR> :nohlsearch<CR>

" Show all lines with keyword under cursor and ask which one to jump to.
map <Leader>*
  \ [I:let nr=input('Which one: ')<Bar>
  \ execute 'normal ' . nr . "[\t"<CR>

map <Leader>1 1gt
map <Leader>2 2gt
map <Leader>3 3gt
map <Leader>4 4gt
map <Leader>5 5gt
map <Leader>6 6gt
map <Leader>7 7gt
map <Leader>8 8gt
map <Leader>9 9gt
map <Leader>0 10gt
map <Leader><Tab><Tab> :tabnew<CR>

" Put a window onto its own tab.
map <Leader><Tab>o <C-w>T

map <Leader><Tab>q :tabclose<CR>
map <Leader><Tab>s :tab split<CR>
map <Leader>] :TagbarToggle<CR>
nmap <Leader>; :call cosco#commaOrSemiColon()<CR>
imap <Leader>; <C-o>:call cosco#commaOrSemiColon()<CR>
nmap <Leader>. :w<CR>
imap <Leader>. <Esc>:w<CR>
map <Leader>/ :Ag! ''<Left>
map <Leader>a <Plug>(EasyAlign)
map <Leader>b :buffer#<CR>
map <Leader>c :TComment<CR>
map <Leader>C :TCommentBlock<CR>
map <Leader>e :NERDTreeToggle .<CR>
map <Leader>E :NERDTreeFind<CR>
map <Leader>f :ChooseWin<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gd :Gsdiff<CR>
map <Leader>gl :Glog<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gw :Gwrite<CR>
map <Leader>jd <Plug>(jsdoc)
map <Leader>jD :TernDoc<CR>
map <Leader>jf :TernRefs<CR>
map <Leader>jg :TernDef<CR>
map <Leader>jr :TernRename<CR>
map <Leader>jt :TernType<CR>
map <Leader>m <Plug>(quickhl-manual-this)
map <Leader>M <Plug>(quickhl-manual-reset)
nmap <Leader>s :%s//
vmap <Leader>s :s//
map <Leader>t :tabnext<C-r>=g:lasttab<CR><CR>
map <Leader>Tf :TestFile<CR>
map <Leader>Tn :TestNearest<CR>
map <Leader>Ts :TestSuite<CR>
map <Leader>Tv :TestVisit<CR>
map <Leader>TT :TestLast<CR>
map <Leader>u :UndotreeToggle<CR>

" Echo syntax highlighting group for the keyword under cursor.
nnoremap <silent> <Leader>h
  \ :echo
  \ 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '> ' .
  \ 'trans<' . synIDattr(synID(line('.'),col('.'),0),'name') . '> ' .
  \ 'lo<' . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'
  \ <CR>


runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
syntax on
filetype plugin indent on

colorscheme onedark
highlight ColorColumn ctermbg=234
highlight IndentGuidesOdd ctermbg=235
highlight IndentGuidesEven ctermbg=236
highlight LineNr ctermfg=darkgrey
highlight OverLength ctermbg=darkred

" Highlight line over 80 chars.
match OverLength /\%>80v.\+/


" Custom variable: Last used tab.
let g:lasttab=1

let g:ag_apply_qmappings=0
let g:ag_highlight=1
let g:ag_prg='ag --hidden --skip-vcs-ignores --smart-case --vimgrep'

let g:airline_left_sep='▶'
let g:airline_right_sep='◀'
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif
let g:airline_symbols.linenr='¶'
let g:airline_symbols.branch='⎇'
let g:airline_symbols.paste='Þ'
let g:airline_symbols.whitespace='Ξ'
let g:airline_theme='ubaryd'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline#extensions#tabline#left_sep=' '

let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_lazy_update=1
let g:ctrlp_map='<Leader>o'
let g:ctrlp_open_multiple_files='h'
let g:ctrlp_open_new_file='h'
let g:ctrlp_user_command='ag --files-with-matches --hidden --nocolor --skip-vcs-ignores -g "" %s'

let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1
let g:delimitMate_nesting_quotes=['"']

let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
" let g:indent_guides_exclude_filetypes=['help']

let g:javascript_plugin_jsdoc=1

let g:jsdoc_allow_input_prompt=1
let g:jsdoc_custom_args_hook={
  \   '\(arr\|array\)[0-9]\?$': {
  \     'type': '{array}'
  \   },
  \   '\(cb\|callback\)$': {
  \     'type': '{function}',
  \     'description': 'Function to call once operation is done.'
  \   },
  \   '^e$\|event$': {
  \     'type': '{Event}'
  \   },
  \   '\(el\|element\)$': {
  \     'type': '{Element}'
  \   },
  \   '\(err\|error\)$': {
  \     'type': '{*}',
  \     'description': 'Error if any, null otherwise.'
  \   },
  \   '\(fn\|func\|handler\)$': {
  \     'type': '{function}'
  \   },
  \   '^i$\|\(idx\|index\)[0-9]\?$': {
  \     'type': '{number}'
  \   },
  \   '^_\?\(is\|has\|should\)': {
  \     'type': '{boolean}',
  \   },
  \   '\(key\|name\)[0-9]\?$': {
  \     'type': '{string}'
  \   },
  \   '^l$\|\(len\|length\)$': {
  \     'type': '{number}'
  \   },
  \   '^_\?\(min\|max\)': {
  \     'type': '{number}'
  \   },
  \   '^n$\|^_\?num': {
  \     'type': '{number}'
  \   },
  \   '\(obj\|object\)[0-9]\?$': {
  \     'type': '{object}'
  \   },
  \   '\(opts\|options\)$': {
  \     'type': '{object}',
  \     'description': 'Configuration options.'
  \   },
  \   '\(res\|result\)$': {
  \     'type': '{object}',
  \     'description': 'If specified, will hold the returned result.'
  \   },
  \   '\(str\|string\|text\)[0-9]\?$': {
  \     'type': '{string}'
  \   },
  \   '^_\?d\?\(x\|y\|z\)[0-9]\?$': {
  \     'type': '{number}'
  \   },
  \   '^w$\|^h$\|\(width\|height\)$': {
  \     'type': '{number}'
  \   }
  \ }
let g:jsdoc_custom_args_regex_only=1
let g:jsdoc_input_description=1

" Remember local vimrc loading decisions, but will still ask again if file
" content has been changed since the last time decision was made.
let g:localvimrc_persistent=1

let g:multi_cursor_start_key='g<C-p>'
let g:multi_cursor_start_word_key='g<C-n>'

let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeBookmarksFile=$HOME . '/.vim/NERDTreeBookmarks'
let g:NERDTreeDirArrows=1
let g:NERDTreeIgnore=['\~$', '\.pyc$', '^__pycache__$']
let g:NERDTreeMinimalUI=1
" let g:NERDTreeShowBookmarks=1

let g:neocomplete#data_directory=$HOME . '/.vim/.neocomplete'
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#force_overwrite_completefunc=1
let g:neocomplete#max_list=10

" Snippets directory ordered in decreasing priority.
let g:neosnippet#snippets_directory=[
  \   $HOME . '/.vim/snippets',
  \   $HOME . '/.vim/bundle/vim-snippets/snippets'
  \ ]
let g:neosnippet#disable_runtime_snippets={'_': 1}

let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_synchronize_view=0

let g:numbers_exclude=[
  \   'gundo',
  \   'nerdtree',
  \   'qf',
  \   'startify',
  \   'tagbar',
  \   'undotree',
  \   'unite',
  \   'vimshell',
  \   'w3m'
  \ ]

let g:pasta_disabled_filetypes=[
  \   'coffee',
  \   'ctrlp',
  \   'nerdtree',
  \   'python',
  \   'tagbar',
  \   'yaml'
  \ ]

let g:pymode_options=0
" Disabled due to performance issue.
" See https://github.com/python-mode/python-mode/issues/523
let g:pymode_folding=0
" Only turn on checkers not supported by Syntastic.
let g:pymode_lint_checkers=['mccabe']
let g:pymode_lint_cwindow=0
let g:pymode_rope_lookup_project=0
let g:pymode_rope_regenerate_on_write=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_breakpoint_bind='<Leader>pb'
let g:pymode_rope_autoimport_bind='<Leader>pi'
let g:pymode_rope_change_signature_bind='<Leader>ps'
let g:pymode_rope_extract_method_bind='<Leader>pem'
let g:pymode_rope_extract_variable_bind='<Leader>pev'
let g:pymode_rope_goto_definition_bind='<Leader>pg'
let g:pymode_rope_module_to_package_bind='<Leader>pRp'
let g:pymode_rope_move_bind='<Leader>pm'
let g:pymode_rope_organize_imports_bind='<Leader>po'
let g:pymode_rope_rename_bind='<Leader>pr'
let g:pymode_rope_rename_module_bind='<Leader>pRm'
let g:pymode_rope_show_doc_bind='<Leader>pd'
let g:pymode_rope_use_function_bind='<Leader>pu'
let g:pymode_run_bind='<Leader>pE'
let g:pymode_syntax_print_as_function=1
let g:pymode_syntax_slow_sync=0

let g:session_autoload='no'
let g:session_autosave='no'
let g:session_command_aliases=1
" Use the same session directory as Startify.
let g:session_directory=$HOME . '/.vim/session'

" Signify is too slow, use Git Gutter.
let g:signify_disable_by_default=1
let g:signify_vcs_list=['git']

let g:splitjoin_curly_brace_padding=0

let g:startify_enable_special=0
let g:startify_list_order=[
  \   ['   My sessions:'],
  \   'sessions',
  \   ['   Last recently opened files:'],
  \   'files',
  \   ['   Last recently modified files in the current directory:'],
  \   'dir',
  \   ['   My bookmarks:'],
  \   'bookmarks'
  \ ]
let g:startify_session_autoload=1

let g:syntastic_aggregate_errors=1
let g:syntastic_always_populate_loc_list=1
" let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
" TODO: Disable HTML syntax checking due to huge lag. It seems OK now.
" let g:syntastic_mode_map={
"   \ 'mode': 'active',
"   \ 'active_filetypes': [],
"   \ 'passive_filetypes': ['html']
"   \ }
let g:syntastic_css_csslint_args=
  \ '--ignore=' .
  \   'adjoining-classes,' .
  \   'box-sizing,' .
  \   'ids'
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_php_checkers=['phpcs']
let g:syntastic_php_phpcs_args=
  \ '--standard=Drupal ' .
  \ '--extensions=php,module,inc,install,test,profile,theme ' .
  \ '--report=csv'
let g:syntastic_python_checkers=['pylint', 'py3kwarn']

"let g:tagbar_autofocus=1
let g:tagbar_autoshowtag=1
let g:tagbar_compact=1
let g:tagbar_sort=0

let g:toggle_list_copen_command='botright copen'

let g:undotree_SetFocusWhenToggle=1

let g:vim_markdown_folding_disabled=1

" Prevent markdown files from using vimwiki syntax.
let g:vimwiki_ext2syntax={}

let g:yankring_history_dir=$HOME . '/.vim'
let g:yankring_replace_n_nkey='<Leader>pn'
let g:yankring_replace_n_pkey='<Leader>pp'


augroup langtype
  autocmd!
  autocmd FileType python setlocal shiftwidth=4 tabstop=4
augroup END

augroup filetype
  autocmd!

  autocmd BufRead,BufNewFile *.as set filetype=actionscript

  autocmd BufRead,BufNewFile *.haproxy set filetype=haproxy
  autocmd BufRead,BufNewFile haproxy.cfg set filetype=haproxy

  autocmd BufRead,BufNewFile *.upstart set filetype=upstart

  " Set the correct filetypes for Drupal files.
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.theme set filetype=php
  autocmd BufRead,BufNewFile *.inc set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
  autocmd BufRead,BufNewFile *.engine set filetype=php
  autocmd BufRead,BufNewFile *.profile set filetype=php
  autocmd BufRead,BufNewFile *.test set filetype=php
augroup END

augroup misc
  autocmd!

  " Enhance security when working with encrypted file.
  autocmd BufReadPost *
    \ if &key != '' |
    \   setlocal history=0 secure noshelltemp viminfo= |
    \ endif

  " Reload .vimrc after write.
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC

  " Reload openbox configuration after write.
  autocmd BufWritePost ~/.config/openbox/*.xml
    \ :call system('openbox --reconfigure')

  " Merge X resources configurations after write.
  autocmd BufWritePost ~/.Xresources
    \ :call system('xrdb ~/.Xresources')
  autocmd BufWritePost ~/.Xresources.d/*.Xresources
    \ :call system('xrdb ~/.Xresources')

  " Auto open tagbar on supported file types only when not in diff mode.
  if !&diff
    autocmd FileType * nested :call tagbar#autoopen(0)
  endif

  " Spell check commit message.
  autocmd Filetype gitcommit setlocal spell textwidth=76

  " Do not break long line of markdown file during insertion.
  autocmd Filetype markdown setlocal textwidth=0

  " Allow hard tab in snippet files so they use shiftwidth when expanded.
  autocmd Filetype neosnippet setlocal noexpandtab

  " Allow reusing startify window to open file.
  autocmd FileType startify setlocal buftype=

  " Don't show trails in insert mode.
  autocmd InsertEnter * setlocal listchars-=trail:∙
  autocmd InsertLeave * setlocal listchars+=trail:∙

  " Remember last used tab.
  autocmd TabLeave * let g:lasttab=tabpagenr()

  " Open Startify only if Vim is opened with no arguments.
  autocmd VimEnter *
    \ if !argc() |
    \   Startify |
    \   execute "normal! \<C-w>w" |
    \ endif
augroup END


" Check if buffer with a particular name exists.
function! IsBufferExist(name)
  redir =>buflist
  silent! ls
  redir END
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "' . a:name . '"'),
                  \ 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      return 1
    endif
  endfor
endfunction

" Disable NeoComplete before starting multiple selection due to conflict.
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock') == 2
    execute 'NeoCompleteLock'
  endif
endfunction

" Re-enable NeoComplete after multiple selection is cancelled.
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock') == 2
    execute 'NeoCompleteUnlock'
  endif
endfunction

" Needed by YankRing if Y is remapped, i.e. to y$.
function! YRRunAfterMaps()
  nnoremap Y :<C-u>YRYankCount 'y$'<CR>
endfunction

" Include vimrc from Python virtualenv if exists.
if filereadable($VIRTUAL_ENV . '/.vimrc')
  source $VIRTUAL_ENV/.vimrc
endif
