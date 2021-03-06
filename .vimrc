" Best view with a 256 color terminal and Powerline fonts

let s:darwin = has('mac')

if !exists("g:os")
  if has("win64") || has("win32") || has("win16")
    let g:os = "Windows"
  else
    let g:os = substitute(system('uname -o'), '\n', '', '')
  endif
endif

" Plugins {

  "auto-install vim-plug
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif

  " Load vim-plug
  call plug#begin('~/.vim/bundle')

  if s:darwin
    let g:plug_url_format = 'git@github.com:%s.git'
  else
    let $GIT_SSL_NO_VERIFY = 'true'
  endif

  Plug 'tpope/vim-sensible'
  "Plug 'edkolev/promptline.vim'
  "Plug 'edkolev/tmuxline.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'breuckelen/vim-resize'
  Plug 't9md/vim-choosewin'
  "Plug 'powerline/powerline'
  "Plug 'tpope/vim-flagship'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'gregsexton/gitv'
  Plug 'junegunn/gv.vim'
  "Plug 'miyakogi/conoline.vim'
  "Plug 'mhinz/vim-signify'
  "Plug 'gcmt/breeze.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] } "Loads only when opening NERDTree }
  "Plug 'jlanzarotta/bufexplorer'
  "Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
  "Plug 'vim-scripts/taglist.vim'
  "Plug 'vim-scripts/cmdalias.vim'
  Plug 'benmills/vimux'
  "Plug 'severin-lemaignan/vim-minimap'
  Plug 'nelstrom/vim-visual-star-search'
  "Plug 'Shougo/neocomplete.vim.git'
  "Plug 'Shougo/neosnippet'
  "Plug 'Shougo/neosnippet-snippets'
  " Plug 'SirVer/ultisnips'
  Plug 'chrisbra/vim-diff-enhanced'
  Plug 'MarcWeber/vim-addon-mw-utils' "requiered by snipmate
  Plug 'tomtom/tlib_vim' "requiered by snipmate
  Plug 'garbas/vim-snipmate'
  Plug 'honza/vim-snippets'
  function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
      !./install.py --clang-completer --gocode-completer
    endif
  endfunction
  Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cpp'], 'do': function('BuildYCM') }
  "Plug 'davidhalter/jedi-vim.git'
  Plug 'ervandew/supertab'
  "Plug 'sjl/gundo.vim'
  Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
  "Plug 'luochen1990/indent-detector.vim'
  " Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tomtom/tcomment_vim'
  "Plug 'scrooloose/nerdcommenter'
  Plug 'ryanoasis/vim-devicons'
  Plug 'nvie/vim-togglemouse'
  "Plug 'LucHermitte/lh-vim-lib'
  "Plug 'LucHermitte/lh-tags'
  "Plug 'LucHermitte/lh-dev'
  "Plug 'LucHermitte/lh-brackets'
  "Plug 'alvan/vim-closetag'
  Plug 'Townk/vim-autoclose'
  Plug 'tpope/vim-endwise'
  " Plug 'godlygeek/tabular'
  "Plug 'neilagabriel/vim-geeknote'
  Plug 'elzr/vim-json'
  Plug 'jamessan/vim-gnupg'
  "Plug 'kopischke/vim-stay'
  "Plug 'kopischke/vim-fetch'
  Plug 'Konfekt/FastFold'
  Plug 'luisdavim/pretty-folds'
  Plug 'scrooloose/syntastic'
  Plug 'metakirby5/codi.vim'
  "Plug 'lilydjwg/colorizer'
  "Plug 'chriskempson/base16-vim'
  Plug 'flazz/vim-colorschemes'
  Plug 'dracula/vim'
  " Plug 'rakr/vim-one'
  Plug 'hashivim/vim-hashicorp-tools'
  Plug 'chr4/nginx.vim'
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'pearofducks/ansible-vim'
  Plug 'cespare/vim-toml'
  Plug 'maralla/vim-toml-enhance'
  Plug 'aquach/vim-mediawiki-editor'
  Plug 'chikamichi/mediawiki.vim'

  call plug#end()
" }

" ColorThemes {
  highlight clear
  set background=dark
  set t_Co=256

  " Overrides
  if has('autocmd')
    au ColorScheme * hi! FoldColumn ctermbg=none ctermfg=none guibg=NONE
    if ! has('gui_macvim')
      au ColorScheme * hi! Normal ctermbg=none guibg=NONE
      au ColorScheme * hi! NonText ctermbg=none guibg=NONE
    endif
    au ColorScheme * hi! Folded ctermbg=none guibg=NONE
    au ColorScheme * hi! CursorLine ctermfg=none guifg=NONE gui=NONE term=NONE cterm=NONE
    if g:os != 'Android'
      set fillchars+=vert:│
    endif
    au ColorScheme * hi VertSplit cterm=none ctermfg=Black ctermbg=none
  endif

  " Use GIU colors
  " if (has("nvim"))
  "   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  " else
  "   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  "   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  " endif
  " if (has("termguicolors"))
  "   set termguicolors
  " endif

  set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12

  if has('gui_macvim')
    set transparency=5
  endif

  color Tomorrow-Night-Bright
  " color one
  " color dracula
" }

" GeneralSettings {
  if ! &diff
    if has('autocmd')
      " Open files allways in new tabs
      au VimEnter * tab all
      " Make vim remember the line where you were the last time
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif
  endif

  if has('autocmd')
    filetype plugin indent on
    au FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=AL
  endif
  if has('syntax') && !exists('g:syntax_on')
    syntax enable
  endif

  " GUI options:
  "set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar

  " Use :help 'option' to see the documentation for the given option.
  set autoindent
  set smartindent
  set backspace=indent,eol,start
  set complete-=i
  set showmatch
  set showmode
  set smarttab
  set scrolloff=1
  if !&diff
    set cursorline
  endif

  set nrformats-=octal
  set shiftround

  " Folding
  set foldmarker={,}
  set foldlevelstart=99
  set foldmethod=marker

  " set clipboard=unnamedplus
  set clipboard=unnamed
  set regexpengine=1
  set ttyfast
  set lazyredraw
  set ttimeout
  set ttimeoutlen=50
  set updatetime=250

  set laststatus=2
  set ruler
  set showcmd
  set wildmenu

  set autoread

  set encoding=utf-8
  set tabstop=2 shiftwidth=2 expandtab
  set listchars=tab:▒░,trail:▓
  set list

  set number
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase

  " In many terminal emulators the mouse works just fine, thus enable it.
  if has('mouse')
    set mouse=a
  endif

  " Enable (better) mouse support under tmux
  if &term =~ '^screen' && exists('$TMUX')
    set mouse+=a
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
    execute "set <xHome>=\e[1;*H"
    execute "set <xEnd>=\e[1;*F"
    execute "set <Insert>=\e[2;*~"
    execute "set <Delete>=\e[3;*~"
    execute "set <PageUp>=\e[5;*~"
    execute "set <PageDown>=\e[6;*~"
    execute "set <xF1>=\e[1;*P"
    execute "set <xF2>=\e[1;*Q"
    execute "set <xF3>=\e[1;*R"
    execute "set <xF4>=\e[1;*S"
    execute "set <F5>=\e[15;*~"
    execute "set <F6>=\e[17;*~"
    execute "set <F7>=\e[18;*~"
    execute "set <F8>=\e[19;*~"
    execute "set <F9>=\e[20;*~"
    execute "set <F10>=\e[21;*~"
    execute "set <F11>=\e[23;*~"
    execute "set <F12>=\e[24;*~"
  endif

  " do not history when leavy buffer
  set hidden

  set nobackup
  set nowritebackup
  set noswapfile
  set fileformats=unix,dos,mac

  set completeopt=menuone,longest,preview
" }

" PluginSettings {

  " vim-resize
  let g:vim_resize_disable_auto_mappings = 1
  nnoremap <silent> <S-Left> :CmdResizeLeft<cr>
  nnoremap <silent> <S-Down> :CmdResizeDown<cr>
  nnoremap <silent> <S-Up> :CmdResizeUp<cr>
  nnoremap <silent> <S-Right> :CmdResizeRight<cr>

  " vim-choosewin
  let g:choosewin_overlay_enable = 1
  nmap - <Plug>(choosewin)

  " matchparen
  let g:matchparen_timeout = 2
  let g:matchparen_insert_timeout = 2

  " GeekNote
  "let g:GeeknoteFormat="markdown"

  " Syntastic
  let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] }
  noremap <C-w>e :SyntasticCheck<CR>
  noremap <C-w>f :SyntasticToggleMode<CR>

  " Gundu
  " let g:gundo_width = 60
  " let g:gundo_preview_height = 40
  " let g:gundo_right = 1

  " MinMap
  let g:minimap_highlight='Visual'

  " IndentLine
  let g:indentLine_faster = 1
  if g:indentLine_faster == 0
   let g:indentLine_leadingSpaceEnabled = 1
  endif
  let g:vim_json_syntax_conceal = 0
  let g:indentLine_char = '┊'
  let g:indentLine_leadingSpaceChar = '˰'
  let g:indentLine_noConcealCursor = ""
  " set conceallevel=1
  " let g:indentLine_conceallevel=1

  " Vim
  let g:indentLine_color_term = 239
  "GVim
  let g:indentLine_color_gui = '#A4E57E'
  " none X terminal
  let g:indentLine_color_tty_light = 7 " (default: 4)
  let g:indentLine_color_dark = 1 " (default: 2)'

  " Conoline
  " if !&diff
  "   let g:conoline_auto_enable = 1
  " endif

  " CtrlP
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
  " NOTE: The following should make CtrlP faster
  "let g:ctrlp_match_window = 'bottom,order:ttb'
  "let g:ctrlp_switch_buffer = 0
  "let g:ctrlp_working_path_mode = 0
  "if executable('ag')
    "set grepprg=ag\ --nogroup\ --nocolor
    "let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    "let g:ctrlp_use_caching = 0
  "endif
  "let g:ctrlp_working_path_mode = 'ra'
  " Always open files in new tabs
  let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<c-t>'],
      \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
      \ }

  " Ultisnip
  " NOTE: <f1> otherwise it overrides <tab> forever
  let g:UltiSnipsExpandTrigger="<C-tab>"
  let g:UltiSnipsJumpForwardTrigger="<C-tab>"
  let g:UltiSnipsJumpBackwardTrigger="<C-S-tab>"
  let g:did_UltiSnips_vim_after = 1

  " make YCM compatible with UltiSnips (using supertab)
  let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
  let g:SuperTabDefaultCompletionType = '<C-n>'
  " Disable YCM
  let g:loaded_youcompleteme = 1

  " Brackets
  let g:usemarks = 0

  " Codi
  " Use pry instead od irb
  " let g:codi#interpreters = {
  " \ 'ruby': {
  "     \ 'bin': ['pry', '-f'],
  "     \ 'prompt': '^[\d\+] pry(\w\+). ',
  "     \ },
  " \ }

  " vim-airline
  " let g:airline_extensions = ['branch', 'tabline', 'whitespace']
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_min_count = 1
  let g:airline#extensions#tabline#show_buffers = 1
  let g:airline_powerline_fonts = 1
  let g:airline_theme='term'
  " let g:airline_theme='powerlineish'
  " let g:airline_theme='one'
" }

" Shortcuts {

  " Don't use Ex mode, use Q for formatting
  map Q gq

  " Use <C-L> to clear the highlighting of :set hlsearch.
  if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
  endif

  inoremap <C-U> <C-G>u<C-U>

  " FIXME: (broken) ctrl s to save
  noremap  <C-s> :update<CR>
  vnoremap <C-s> <C-C>:update<CR>
  inoremap <C-s> <Esc>:update<CR>

  " exit insert mode
  inoremap <C-c> <Esc>

  " Find
  map <C-f> /
  " indend / deindent after selecting the text with (⇧ v), (.) to repeat.
  vnoremap <Tab> >
  vnoremap <S-Tab> <
  " comment / decomment & normal comment behavior
  vmap <C-m> gc
  vmap <C-/> gc
  nnoremap <C-/> gcc
  inoremap <C-/> gcc
  " Disable tComment to escape some entities
  let g:tcomment#replacements_xml={}
  " Text wrap simpler, then type the open tag or ',"
  vmap <C-w> S

  " Cut, Paste, Copy
  vmap <C-x> d
  vmap <C-v> p
  vmap <C-c> y
  nnoremap <F2> :set invpaste paste?<CR>
  set pastetoggle=<F2>
  " Use a scratch file for clipboard
  "vmap <leader>y :w! /tmp/vitmp<CR>
  "nmap <leader>p :r! cat /tmp/vitmp<CR>
  vmap <leader>y "*y
  nmap <leader>p "*p

  " Undo, Redo (broken)
  nnoremap <C-z> :undo<CR>
  inoremap <C-z> <Esc>:undo<CR>
  nnoremap <C-y> :redo<CR>
  inoremap <C-y> <Esc>:redo<CR>
  nnoremap <F5>  :GundoToggle<CR>

  noremap <Leader>i :set list!<CR>

  " Tabs

  " Tab navigation
  nnoremap <S-PageUp>   :tabprevious<CR>
  inoremap <S-PageUp>   <Esc>:tabprevious<CR>i
  nnoremap <S-PageDown> :tabnext<CR>
  inoremap <S-PageDown> <Esc>:tabnext<CR>i
  nnoremap <C-t>        :tabnew<CR>
  inoremap <C-t>        <Esc>:tabnew<CR>i
  nnoremap <C-k>        :tabclose<CR>
  inoremap <C-k>        <Esc>:tabclose<CR>i
  nnoremap <S-h>        gT
  nnoremap <S-l>        gt

  " tab navigation like firefox
  " nnoremap <C-S-tab> :tabprevious<CR>
  " nnoremap <C-tab>   :tabnext<CR>
  " nnoremap <C-t>     :tabnew<CR>
  " inoremap <C-S-tab> <Esc>:tabprevious<CR>i
  " inoremap <C-tab>   <Esc>:tabnext<CR>i
  " inoremap <C-t>     <Esc>:tabnew<CR>

  " lazy ':'
  map ; :

  let mapleader = '\'
  nnoremap <Leader>p :set paste<CR>
  nnoremap <Leader>o :set nopaste<CR>
  noremap  <Leader>g :GitGutterToggle<CR>
  noremap  <Leader>tb :TagbarToggle<CR>
  noremap  <Leader>nt :NERDTreeToggle<CR>
  noremap  <C-\> :NERDTreeToggle<CR>
  nmap     <leader>TB <Plug>ToggleBrackets
  imap     <leader>TB <Plug>ToggleBrackets
  noremap  <leader>co :diffoff!<CR><C-W><C-O>

  "  Window management:
  nnoremap <Leader>sv :windo wincmd K<CR>
  nnoremap <Leader>sh :windo wincmd H<CR>

  " fugitive git bindings
  "vimdiff current vs git head (fugitive extension)
  nnoremap <Leader>gd :Gdiff<cr>
  nnoremap <Leader>gdm :Gdiff master<cr>
  "switch back to current file and closes fugitive buffer
  "nnoremap <Leader>gD :diffoff!<cr><c-w>h:bd<cr>
  nnoremap <Leader>gD <c-w>h<c-w>c
  nnoremap <Leader>ga :Git add %:p<CR><CR>
  nnoremap <Leader>gs :Gstatus<CR>
  nnoremap <Leader>gc :Gcommit -v -q<CR>
  nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
  nnoremap <Leader>ge :Gedit<CR>
  nnoremap <Leader>gr :Gread<CR>
  nnoremap <Leader>gw :Gwrite<CR><CR>
  nnoremap <Leader>gbl :Gblame<CR>
  nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
  nnoremap <Leader>gp :Ggrep<Space>
  nnoremap <Leader>gm :Gmove<Space>
  nnoremap <Leader>gb :Git branch<Space>
  nnoremap <Leader>go :Git checkout<Space>
  nnoremap <Leader>gps :Dispatch! git push<CR>
  nnoremap <Leader>gpl :Dispatch! git pull<CR>
  nnoremap <Leader>g- :Silent Git stash<CR>:e<CR>
  nnoremap <Leader>g+ :Silent Git stash pop<CR>:e<CR>

  " Vimux Aliases
  command -nargs=+ Run VimuxRunCommand <args>
  command -nargs=+ Prompt VimuxPromptCommand <args>
  command CloseRunner VimuxCloseRunner
  command RunAgain VimuxRunLastCommand

" }

command! PU PlugUpdate | PlugUpgrade
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

fun! DiffToggle()
  if &diff
    windo set cursorline
    windo diffoff
  else
    windo set nocursorline
    windo diffthis
  endif
endfun

command! DiffToggle call DiffToggle()
nnoremap <silent> <Leader>df :call DiffToggle()<CR>

fun! TrimWhitespace()
  let l:save_cursor = getpos('.')
  %s/\s\+$//e
  call setpos('.', l:save_cursor)
endfun

command! TrimWhitespace call TrimWhitespace()
noremap <Leader>w :call TrimWhitespace()<CR>
" Some people like to automatically do this before they write a file to disk, like so:
" if has('autocmd')
"   au BufWritePre * :call TrimWhitespace()
" endif

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" vim-mediawiki-editor
let g:mediawiki_editor_url = 'id.wikipedia.org'
let g:mediawiki_editor_path = '/w/'

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif


