" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2006 Nov 16
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

set nocompatible               " be iMproved
filetype off                   " required!
" Setting up vim plugins - the vim plugin bundler
    let iCanHazVundle=1
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        let iCanHazVundle=0
    endif
    call plug#begin('~/.vim/plugged')
    "Add your bundles here
    "uber awesome syntax and errors highlighter
    " Plug 'scrooloose/syntastic'
    " ale
    " Plug 'w0rp/ale'
    Plug 'dense-analysis/ale'
    "T-H-E colorscheme
    Plug 'altercation/vim-colors-solarized' 
    "So awesome, it should be illegal 
    "Plug 'https://github.com/tpope/vim-fugitive' 
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'plasticboy/vim-markdown' 
    " Plug 'vim-scripts/AutoComplPop' 
    " Plug 'https://github.com/Shougo/neocomplete.vim'
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'vim-scripts/taglist.vim'
    Plug 'c9s/bufexplorer'
    "Plug 'https://github.com/fholgado/minibufexpl.vim'
    "Plug 'chazy/cscope_maps'
    Plug 'joe-skb7/cscope-maps'
    "Plug 'vim-scripts/TabBar'
    Plug 'ap/vim-buftabline'
    Plug 'vim-scripts/Gundo'
    Plug 'https://github.com/mhinz/vim-signify'
    " Plug 'https://github.com/kien/ctrlp.vim'
    Plug 'https://github.com/easymotion/vim-easymotion'
    Plug 'junkblocker/patchreview-vim'
    "Plug 'https://github.com/vim-scripts/gtags.vim'
    Plug 'nathanalderson/yang.vim'
    "codequery
    Plug 'Shougo/unite.vim'
    Plug 'devjoe/vim-codequery'
    "jinja"
    Plug 'Glench/Vim-Jinja2-Syntax'
    "fzf"
    " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    " Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    "robotframwork"
    Plug 'mfukar/robotframework-vim'
    "Plug 'https://github.com/nvie/vim-flake8'
    Plug 'pearofducks/ansible-vim'
    "rust"
    Plug 'rust-lang/rust.vim'
    "layout"
    "Rainbow Parentheses Improved"
    Plug 'luochen1990/rainbow'
    Plug 'Yggdroot/indentLine'
    Plug 'ntpeters/vim-better-whitespace'
    "...All your other bundles...
    if iCanHazVundle == 0
        echo "Installing vim plugins, please ignore key map error messages"
        echo ""
        :PlugInstall
    endif

    call plug#end()
" Setting up vim plugins - the vim plugin bundler end

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set nobackup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
"set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  syntax enable
  set hlsearch
  set cursorline
  let g:solarized_termcolors=256
  highlight Comment ctermfg=darkcyan
  set background=dark
  colorscheme desert
  " colorscheme solarized
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=200
  autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  
  autocmd! bufwritepost .vimrc source ~/.vimrc

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
"	 	\ | wincmd p | diffthis


set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set ai
set si

"show tab
"set listchars=tab:>-,trail:~,extends:>,precedes:<
"set listchars=tab:▸\ ,eol:¬
"set listchars=tab:\|\ ,eol:¬,trail:-,extends:>,precedes:<,nbsp:+
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
        let &listchars = "tab:\u21e5,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
    endif
endif
"Invisible character colors 
"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59
" set list listchars=tab:\|_,trail:·
" Enter the right-angle-quote by pressing Ctrl-k then >>
set list
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" set encode
set enc=utf-8
set fencs=utf-8,ucs-bom,big5,latin1

" show number
set number

" taglist 
map <F5> <ESC>:TlistToggle<CR>
map <F9> :Tlist<CR>
let Tlist_Show_One_File=1
let Tlist_File_Fold_Auto_Close=0
let Tlist_Compact_Format=1
let Tlist_WinWidth=50
let Tlist_Auto_Update=1

" BufExplorer
map <F3> <ESC>:BufExplorer<CR>
" open bufexplorer window

" minibufexpl
"map <Leader>mbe :MBEOpen<cr>
"map <Leader>mbc :MBEClose<cr>
"map <Leader>mbt :MBEToggle<cr>

" cctree
"let g:CCTreeDisplayMode = 3
"let g:CCTreeWindowVertical = 1

" omnicppcomplete
" filetype plugin on

" Tabbar
"let g:Tb_MaxSize = 2
"let g:Tb_TabWrap = 1

" tags
set tags=tags;

" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
" autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

set laststatus=2
 " set statusline=%4*%<\ %1*[%F]
 " set statusline+=%4*\ %5*[%{&encoding}, " encoding
 " set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
 " set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>

" status line {
"  set laststatus=2
"  set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
"  set statusline+=\ \ \ [%{&ff}/%Y] 
"  set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
"  set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
"  
"  function! CurDir()
"       let curdir = substitute(getcwd(), $HOME, "~", "")
"  return curdir
"  endfunction
"  
"  function! HasPaste()
"      if &paste
"          return '[PASTE]'
"      else
"          return ''
"      endif
"  endfunction
"  
" }

" airline
set lazyredraw
let g:airline_left_sep='>'
let g:airline_right_sep='<'
let g:airline_theme='simple'
let g:airline_detect_modified=1
" vim-fugitive
let g:airline#extensions#branch#enabled = 0
" syntastic
" let g:airline#extensions#syntastic#enabled = 0
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts=0
let g:airline_mode_map = {} " see source for current list
let g:airline_exclude_filenames = [] " see source for current list
let g:airline_exclude_filetypes = [] " see source for current list
set t_Co=256
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" augroup filetypedetect
"         au BufNewFile,BufRead *.cli      setfiletype cli
" augroup END

" signify
" hunk jumping
let g:signify_vcs_list = [ 'svn', 'git' ]
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_debug = 0
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"" let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_loc_list_height = 5


" A.L.E only in vim8
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_statusline_format = ['E:%d', 'W:%d', 'ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_enter = 1
let g:ale_set_signs = 1
" Check Python files with flake8.
let g:ale_linters = {'python': ['flake8'], 'reStructuredText': ['rstcheck']}
" Fix Python files with autopep8.
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']}
let g:ale_python_flake8_options = '--max-line-length=120'
" from http://0x3f.org/post/replace-syntastic-with-ale/
" 普通模式下，sp前往上一個錯誤或警告，sn前往下一個錯誤或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
" 觸發/關閉語法檢查
nmap <Leader>at :ALEToggle<CR>
" 查看錯誤或警告的詳細信息
nmap <Leader>ad :ALEDetail<CR>
" Bind F8 to fixing problems with ALE
nmap <F8> <Plug>(ale_fix)

" " ctrlP
" let g:ctrlp_working_path_mode = 'ra'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" let g:ctrlp_user_command = {
"             \ 'types': {
"             \ 1: ['.git', 'cd %s && git ls-files -c -o --exclude-standard'],
"             \ 2: ['.hg', 'hg --cwd %s locate -I .'],
"             \ },
"             \ 'fallback': 'find %s -type f'
"             \ }

" "neocomplete
" "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" " Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" " Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" 
" " Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
"             \ 'default' : '',
"             \ 'vimshell' : $HOME.'/.vimshell_hist',
"             \ 'scheme' : $HOME.'/.gosh_completions'
"             \ }
" 
" " Define keyword.
" if !exists('g:neocomplete#keyword_patterns')
"     let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" 
" " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()
" 
" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"     return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"     " For no inserting <CR> key.
"     "return pumvisible() ? "\<C-y>" : "\<CR>"
" endfunction
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" " Close popup by <Space>.
" "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
" 
" " AutoComplPop like behavior.
" "let g:neocomplete#enable_auto_select = 1
" 
" " Shell like behavior(not recommended).
" "set completeopt+=longest
" "let g:neocomplete#enable_auto_select = 1
" "let g:neocomplete#disable_auto_complete = 1
" "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^.
"\t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]
"*\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]
"*\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"gtags
set csprg=gtags-cscope
cs add GTAGS
let s:command = "cs add GTAGS"
exe s:command
"let Gtags_Auto_Map = 1

"buftabline
set hidden
nnoremap <Leader>bh :bprev<CR>
nnoremap <Leader>bl :bnext<CR>

" show indent
nnoremap <F6> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

nnoremap / ms/

"fzf
set rtp+=/.fzf/
map <C-p> :FZF<CR>

"rainbow"
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
