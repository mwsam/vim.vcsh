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

" Enable reading .vimrc/.exrc/.gvimrc in the current directory, securely.
set exrc
set secure

" Solid line for window borders.
set fillchars=vert:│,fold:—

set foldlevel=99
set foldmethod=indent
set formatoptions+=ronlj

" Make gvim looks like vim.
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
nnoremap ^ 0

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

" Browse location or quickfix list depending on which window is visible.
nnoremap <expr> <C-n> IsBufferExist('location list') ?
  \ ':lnext<CR>' :
  \ ':cnext<CR>'
nnoremap <expr> <C-p> IsBufferExist('location list') ?
  \ ':lprevious<CR>' :
  \ ':cprevious<CR>'

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
  \ exe 'normal ' . nr . "[\t"<CR>

map <Leader>] :TagbarToggle<CR>
nmap <Leader>; :call cosco#commaOrSemiColon()<CR>
imap <Leader>; <C-o>:call cosco#commaOrSemiColon()<CR>
" map <Leader>. :Unite -start-insert file_rec<CR>
map <Leader>. :Unite file<CR>
map <Leader>/ :Ag! ''<Left>
map <Leader>a <Plug>(EasyAlign)
map <Leader>b :buffer#<CR>
map <Leader>c :TComment<CR>
map <Leader>e :NERDTreeToggle .<CR>
map <Leader>E :NERDTreeFind<CR>
map <Leader>f :ChooseWin<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gd :Gsdiff<CR>
map <Leader>gl :Glog<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gw :Gwrite<CR>
map <Leader>jd :TernDoc<CR>
map <Leader>jf :TernRefs<CR>
map <Leader>jg :TernDef<CR>
map <Leader>jr :TernRename<CR>
map <Leader>jt :TernType<CR>
map <Leader>m <Plug>(quickhl-manual-this)
map <Leader>M <Plug>(quickhl-manual-reset)
map <Leader>ov :tabedit $MYVIMRC<CR>
map <Leader>oV :edit $MYVIMRC<CR>
nmap <Leader>s :%s//
vmap <Leader>s :s//
map <Leader>tn :tabnew<CR>

" Put a window onto its own tab.
map <Leader>to <C-w>T

map <Leader>tq :tabclose<CR>
map <Leader>ts :tab split<CR>
map <Leader>tt :tabnext<C-r>=g:lasttab<CR><CR>
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

colorscheme hybrid
highlight ExtraWhitespace ctermbg=darkred
highlight IndentGuidesOdd ctermbg=235
highlight IndentGuidesEven ctermbg=236
highlight LineNr ctermfg=darkgrey
highlight OverLength ctermbg=darkred

" Show trailing whitespace and spaces before a tab.
match ExtraWhitespace /\s\+$\| \+\ze\t/
" Highlight line over 80 chars.
match OverLength /\%>80v.\+/


" Custom variable: Last used tab.
let g:lasttab=1

let g:agprg='ag --column --smart-case'
let g:ag_apply_qmappings=0

let g:airline_left_sep='▶'
let g:airline_right_sep='◀'
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif
let g:airline_symbols.linenr='¶'
let g:airline_symbols.branch='⎇'
let g:airline_symbols.paste='Þ'
let g:airline_symbols.whitespace='Ξ'
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline#extensions#tabline#left_sep=' '

let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1

let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
" let g:indent_guides_exclude_filetypes=['help']

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
  \ $HOME . '/.vim/snippets',
  \ $HOME . '/.vim/bundle/vim-snippets/snippets'
  \ ]
let g:neosnippet#disable_runtime_snippets={'_': 1}

let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_synchronize_view=0

let g:numbers_exclude=[
  \ 'gundo',
  \ 'nerdtree',
  \ 'qf',
  \ 'startify',
  \ 'tagbar',
  \ 'undotree',
  \ 'unite',
  \ 'vimshell',
  \ 'w3m'
  \ ]

let g:pymode_options=0
let g:pymode_lint=1
" Only turn on checkers not supported by Syntastic.
let g:pymode_lint_checkers=['mccabe']
let g:pymode_lint_cwindow=0
let g:pymode_breakpoint_bind='<Leader>pb'
let g:pymode_run_bind='<Leader>pE'
let g:pymode_rope_show_doc_bind='<Leader>pd'
let g:pymode_rope_goto_definition_bind='<Leader>pg'
let g:pymode_rope_autoimport_bind='<Leader>pi'
let g:pymode_rope_organize_imports_bind='<Leader>po'
let g:pymode_rope_extract_method_bind='<Leader>pem'
let g:pymode_rope_extract_variable_bind='<Leader>pev'
let g:pymode_rope_move_bind='<Leader>pm'
let g:pymode_rope_rename_bind='<Leader>pr'
let g:pymode_rope_rename_module_bind='<Leader>pRm'
let g:pymode_rope_module_to_package_bind='<Leader>pRp'
let g:pymode_rope_change_signature_bind='<Leader>ps'
let g:pymode_rope_use_function_bind='<Leader>pu'
let g:pymode_syntax_print_as_function=1

let g:session_autoload='no'
let g:session_autosave='no'
let g:session_command_aliases=1
" Use the same session directory as Startify.
let g:session_directory=$HOME . '/.vim/session'

" Signify is too slow, use Git Gutter.
let g:signify_disable_by_default=1
let g:signify_vcs_list=['git']

let g:startify_session_autoload=1
let g:startify_list_order=[
  \ ['   My sessions:'],
  \ 'sessions',
  \ ['   Last recently opened files:'],
  \ 'files',
  \ ['   Last recently modified files in the current directory:'],
  \ 'dir',
  \ ['   My bookmarks:'],
  \ 'bookmarks'
  \ ]

let g:syntastic_aggregate_errors=1
let g:syntastic_always_populate_loc_list=1
" let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
" TODO: Disable HTML syntax checking due to huge lag. It seems OK now.
" let g:syntastic_mode_map={
"   \ 'mode': 'active',
"   \ 'active_filetypes': [],
"   \ 'passive_filetypes': ['html']
"   \ }
let g:syntastic_csslint_options='--ignore=adjoining-classes,ids'
let g:syntastic_javascript_checkers=['jshint']
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
  autocmd BufRead,BufNewFile /etc/nginx/** set filetype=nginx

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

  " Restore cursor position from previous edit session, need .viminfo.
  autocmd BufReadPost *
    \ if line("'\"") <= line('$') |
    \   execute 'normal! g`"zz' |
    \ endif

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

  " Auto open tagbar on supported file types.
  autocmd FileType * nested :call tagbar#autoopen(0)

  " Spell check commit message.
  autocmd Filetype gitcommit setlocal spell textwidth=76

  " Allow hard tab in snippet files so they use shiftwidth when expanded.
  autocmd Filetype neosnippet setlocal noexpandtab

  " Allow reusing startify window to open file.
  autocmd FileType startify setlocal buftype=

  " Don't show trails in insert mode.
  autocmd InsertEnter * setlocal listchars-=trail:∙
  autocmd InsertLeave * setlocal listchars+=trail:∙

  " Remember last used tab.
  autocmd TabLeave * let g:lasttab=tabpagenr()

  " Open Startify and NERDTree only if vim is opened with no argument.
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

" Needed by YankRing if Y is remapped, i.e. to y$.
function! YRRunAfterMaps()
  nnoremap Y :<C-u>YRYankCount 'y$'<CR>
endfunction

" Include vimrc from Python virtualenv if exists.
if filereadable($VIRTUAL_ENV . '/.vimrc')
  source $VIRTUAL_ENV/.vimrc
endif
