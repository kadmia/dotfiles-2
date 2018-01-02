" Plugins {{{
let s:rc = expand( "$HOME/.vimrc_plugins" )
if filereadable( s:rc )
  " note that NixOS is handling plugins differently
  " so, there is no .vimrc_plugins file for NixOS configuration
  execute ':source '.s:rc
endif
" }}}

" Basic {{{
syntax on
filetype plugin indent on
set nocompatible
set number
set relativenumber
set nowrap
set showmode
set textwidth=0
set colorcolumn=0
set smartcase
set smarttab
set smartindent
set autoindent
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set incsearch
set hlsearch
set ignorecase
set mouse=a
set history=1000
" set clipboard=unnamedplus,autoselect
" set completeopt=menuone,menu,longest
set t_Co=256
set cmdheight=1
set encoding=utf-8
set fileencodings=utf-8
" set nospell
" set nobackup
" set noswapfile
set undofile
set undodir=~/.vim/undo
set hidden
set nocursorline
set laststatus=2
set backspace=indent,eol,start
set linespace=1
set showmatch
set foldmethod=marker
set foldenable
set foldlevelstart=10
set foldnestmax=10
set listchars=tab:•\ ,trail:•,extends:»,precedes:« 
set list
set showbreak=>>\ 
set lazyredraw
set splitright
set splitbelow
" set diffopt+=iwhite
if exists('g:loaded_fugitive')
  set statusline+=%{fugitive#statusline()}
endif
" if has('win32')
"   set wildignore+=*\\.stack-work\\*,*\\packages\\*,*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox,*.dll,*.exe,*\\obj\\*,*\\bin\\*,*.mdb,*.pdb
" else
set wildignore+=*/.stack-work/*
set wildignore+=*/packages/*
set wildignore+=*/tmp/*
set wildignore+=*/obj/*
set wildignore+=*/bin/*
set wildignore+=*/build/*
set wildignore+=*/elm-stuff/*
set wildignore+=*/.git/*
set wildignore+=*/.cabal-sandbox/*
set wildignore+=*.swp
set wildignore+=*.swo
set wildignore+=*.zip
set wildignore+=*.dll
set wildignore+=*.exe
set wildignore+=*.mdb
set wildignore+=*.pdb
set wildignore+=*.sigdata
set wildignore+=*.optdata
set wildignore+=*.gitattributes
set wildignore+=*.psmdcp
set wildignore+=*.srcsrv
set wildignore+=*.nupkg
set wildignore+=*.png
set wildignore+=*.jpg
set wildignore+=*.jpeg
set wildignore+=*.gif
set wildignore+=*.svg
" endif
set wildmode=longest,list,full
set wildmenu
set wildignorecase
" }}}

" GUI {{{
if has( "gui_running" )
  set columns=153
  set lines=38
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guifont=mplus\ Nerd\ Font\ Ultra-Light\ 14
  set background=dark
  colorscheme vim-material
else
  set background=dark
  colorscheme default
endif
" }}}

" Mapping {{{
let mapleader=","
map <space> <leader>
map <space><space> <leader><leader>
nnoremap <F5> :make<CR>
nnoremap <C-c> :cclose<CR>
nnoremap <space><space> :nohlsearch<CR>
nmap <leader>zz :let &scrolloff=999-&scrolloff<CR>
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>
nmap <C-j> :bd<CR>
nmap <S-Tab> :NERDTreeToggle<CR>
nmap <F2> <Plug>ColorstepPrev
nmap <F3> <Plug>ColorstepNext
nmap <F4> <Plug>ColorstepReload
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
" nnoremap <leader>/ "zyiw:vimgrep /<C-r>z/g **/*<CR>:cw<CR>
nnoremap <leader>/ "zyiw:vimgrep /<C-r>z/gj **/*.%:e<CR>:cw<CR>
nnoremap <leader>g "zyiw:vimgrep /<C-r>z/gj **/*
nnoremap <leader>dd :diffthis<CR>
nnoremap <leader>du :diffupdate<CR>
nnoremap <leader>do :diffoff<CR>
nnoremap <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
" }}}

" Configure airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '
let g:airline_powerline_fonts = 1
let g:airline_theme='material'
" let g:airline_theme = 'quantum'
" }}}

" CtrlP {{{
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_show_hidden = 1
let g:ctrlp_path_nolim = 1
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = '\v[\/]dist$'
" }}}

" Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" }}}

" Haskell {{{
autocmd FileType haskell setlocal keywordprg=hoogle
" let g:haskellmode_completion_ghc = 1
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" let g:haskell_tabular = 1
" let g:hindent_on_save = 0
" let g:hindent_indent_size = 2
" let g:hindent_line_length = 100

hi hsStructure gui=NONE guifg=#2060A0
hi hsStatement gui=NONE guifg=#2060A0
hi hsTypedef gui=NONE guifg=#2060A0
hi hsConditional gui=NONE guifg=#2060A0
hi hsInfix gui=NONE guifg=#2060A0
hi hsType gui=NONE guifg=#008080
hi hsOperator gui=NONE guifg=salmon

autocmd FileType haskell map <silent> <leader>t :GhcModType<CR>
autocmd FileType haskell map <silent> <leader>T :GhcModTypeInsert<CR>
autocmd FileType haskell map <silent> <leader>c :GhcModTypeClear<CR>
autocmd FileType haskell map <silent> <leader>i :GhcModInfo<CR>
autocmd FileType haskell map <silent> <leader>I :GhcModInfoPreview<CR>
autocmd FileType haskell map <silent> <leader>l :GhcModLint<CR>
autocmd FileType haskell map <silent> <leader>e :GhcModExpand<CR>
autocmd FileType haskell map <silent> <leader>g :GhcModSigCodegen<CR>
autocmd FileType haskell map <silent> <leader>s :GhcModSplitFunCase<CR>
autocmd FileType haskell vmap a= :Tabularize /=<CR>
autocmd FileType haskell vmap a; :Tabularize /::<CR>
autocmd FileType haskell vmap a- :Tabularize /-><CR>
autocmd FileType haskell vmap a, :Tabularize /<-<CR>
autocmd FileType haskell vmap al :Tabularize /[\[\\|,]<CR>
" }}}

" Go {{{
autocmd FileType go map <silent> <F2> :GoRename<CR>
autocmd FileType go map <silent> <F3> :GoAlternate<CR>
autocmd FileType go map <silent> <F4> :GoFmt<CR>
autocmd FileType go map <silent> <F5> :GoRun<CR>
autocmd FileType go map <silent> <F6> :GoTest<CR>
autocmd FileType go map <silent> <S-F6> :GoTestFunc<CR>
autocmd FileType go map <silent> <F7> :GoBuild<CR>
autocmd FileType go map <silent> <F8> :GoLint<CR>
autocmd FileType go map <silent> <S-F8> :GoErrCheck<CR>
autocmd FileType go map <silent> <F9> :GoInfo<CR>
autocmd FileType go map <silent> <F12> :GoDef<CR>
" }}}

" Markdown {{{
au BufEnter *.md set tw=80
au BufEnter *.md set filetype=markdown
au BufEnter *.md set syntax=markdown
au BufRead *.md setlocal spell
" }}}

" Vimwiki {{{
let g:vimwiki_list = [{'path':'~/.vimwiki'}]
" }}}

" Xml {{{
" recognize Xml format
au BufEnter *.xml set filetype=xml
au BufEnter *.xml set syntax=xml
au BufReadPre *.xml setlocal foldmethod=indent
" }}}

" Elm {{{
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 0
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1
" }}}

" F# {{{
let g:syntastic_fsharp_checkers=['syntax']
let g:fsharp_only_check_errors_on_write = 0
let g:fsharp_completion_helptext = 1
let g:fsharp_map_keys = 1
" let g:fsharp_map_prefix = 'cp'
let g:fsharp_map_gotodecl = 'g'
let g:fsharp_map_gobackfromdecl = 'b'
au BufCreate,BufEnter *.fsproj set filetype=xml
au BufCreate,BufEnter *.csproj set filetype=xml
" }}}

" NERDTree {{{
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 40
let g:NERDTreeDirArrows = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['\.swp$', '^bin$', '^obj$', '^dist$']
" let g:NERDTreeHighlightCursorline = 1
" let g:NERDTreeCaseSensitiveSort = 1
" let g:NERDTreeMinimalUI = 1
" let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeQuitOnOpen = 1
" let g:NERDTreeShowBookmarks = 1
" let NERDTreeHijackNetrw = 1
let g:NERDChristmasTree = 1
" }}}

" SuperTab {{{
let g:SuperTabDefaultCompletionType = "context"
" }}}

" TaskWarrior {{{
" " default task report type
" let g:task_report_name     = 'next'
" " custom reports have to be listed explicitly to make them available
" let g:task_report_command  = []
" " whether the field under the cursor is highlighted
" let g:task_highlight_field = 1
" " can not make change to task data when set to 1
" let g:task_readonly        = 0
" " vim built-in term for task undo in gvim
" let g:task_gui_term        = 1
" " allows user to override task configurations. Seperated by space. Defaults to ''
" let g:task_rc_override     = 'rc.defaultwidth=999'
" " default fields to ask when adding a new task
" let g:task_default_prompt  = ['due', 'description']
" " whether the info window is splited vertically
" let g:task_info_vsplit     = 0
" " info window size
" let g:task_info_size       = 15
" " info window position
" let g:task_info_position   = 'belowright'
" " directory to store log files defaults to taskwarrior data.location
" let g:task_log_directory   = '~/.task'
" " max number of historical entries
" let g:task_log_max         = '20'
" " forward arrow shown on statusline
" let g:task_left_arrow      = ' <<'
" " backward arrow ...
" let g:task_left_arrow      = '>> '
" }}}
