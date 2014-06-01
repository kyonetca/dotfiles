" -----------------------------------------------------------------------------
" Vim Settings
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" General

set nocompatible
let mapleader=","
nnoremap Q <nop>
set shortmess=aIoO
set mouse=a
set mousemodel=popup_setpos
set encoding=utf-8
set nofsync


" -----------------------------------------------------------------------------
" Functions

if filereadable(expand("~/.vim/functions.vim"))
  source ~/.vim/functions.vim
endif


" -----------------------------------------------------------------------------
" Basics

syntax on
filetype plugin indent on
set title
set backupdir=~/.vim/.backups
set directory=~/.vim/.swaps
set undodir=~/.vim/.undo
set notimeout
set ttimeout
set ttimeoutlen=10
set modelines=0
set viminfo='100,<50,s10,h,!
rviminfo


" -----------------------------------------------------------------------------
" Display

" vim {{{

set background=dark
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
  let g:jellyx_show_whitespace = 1
  colorscheme jellyx
endif

" }}}

" gvim {{{

if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions+=c
    set guifont=Monaco\ 16
endif

if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif

" }}}

" cursor {{{

highlight Cursor guifg=black guibg=gray
highlight iCursor guifg=white guibg=white
set guicursor+=n-v-c:blinkon0-block-Cursor
set guicursor+=i:blinkon0-ver25-Cursor/lCursor

" }}}

" listchars {{{

set nolist
set listchars =tab:▷⋅
set listchars+=extends:›
set listchars+=precedes:‹
set listchars+=nbsp:·
set listchars+=trail:·

" }}}


" -----------------------------------------------------------------------------
" Editing

set noautowrite
set noautowriteall
set noautoread
set ffs=unix,dos,mac
set nostartofline
set virtualedit=block
set noerrorbells
set vb t_vb=
set confirm
set showcmd
set report=0
set cursorline
set cuc cul
set undofile
set undolevels=500
set history=500
set laststatus=2
set noshowmatch
set wildmenu
set wildmode=list:longest
set hidden
set splitright
set splitbelow
set winminheight=0
set winminwidth=0
set updatecount=20
set lazyredraw
set ttyfast
set ttymouse=xterm
set backspace=2
set scrolloff=8
set sidescrolloff=8
set sidescroll=8
set linebreak
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround
set matchpairs+=<:>
set foldmethod=indent
set foldlevel=99
set wrap
set number
set relativenumber
set numberwidth=1
set textwidth=70
set linespace=1
set smarttab
set nowrapscan
set incsearch
set hlsearch
set ignorecase
set smartcase
set infercase
set formatoptions=
set formatoptions+=c
set formatoptions+=r
set formatoptions+=o
set formatoptions+=q
set formatoptions+=n
set formatoptions+=2
set formatoptions+=l
set formatoptions+=1


" -----------------------------------------------------------------------------
" Shortcuts

" Editing
" --- selecting {{{

" select all
map <C-A> ggVG
" escape
inoremap jw <Esc>
" remove highlights
nmap <Leader><CR> :nohlsearch<cr>

" }}}
" --- pasting {{{

" yank to end of line
noremap Y y$
" copy to clipboard
map <leader>y "+yy
" paste from clipboard
map <leader>p "+p
" toggle paste mode
set pastetoggle=<F2>

" }}}
" --- proofreading {{{

" find lines longer than 78 characters
nmap ;fl /^.\{-}\zs.\%>79v<cr>
" find two spaces after a period
nmap ;f. /\.\s\s\+\w/s+1<cr>
" find things like 'why ?' and 'now !'
nmap ;f! /\w\s\+[\?\!\;\.\,]/s+1<cr>
" find multiple newlines together
nmap ;fn /\n\{3,\}/s+1<cr>

" }}}
" --- writing {{{

" sudo to write
cnoremap w!! w !sudo tee % >/dev/null
" fix windoze ^M
noremap <Leader>rmm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" }}}
" --- redoing {{{

" maintain location in document while redoing
nmap . .`[

" }}}

" Lines
" --- toggle {{{

" toggle line wrap
map <silent> <F3> :set nowrap!<CR>
imap <silent> <F3> <C-O>:set nowrap!<CR>
" toggle line numbers
map <silent> <F4> :set nonu!<CR>
imap <silent> <F4> <C-O>:set nonu!<CR>
" toggle line endings
map <silent> <F5> :set nolist!<CR>
imap <silent> <F5> <C-O>:set nolist!<CR>
" toggle spell checking
map <silent> <F7> :set spell! spelllang=en_us<CR>
imap <silent> <F7> <C-O>:set spell! spelllang=en_us<CR>

" }}}
" --- scrolling {{{

" scroll four lines at a time
nnoremap <C-E> 4<C-E>
nnoremap <C-Y> 4<C-Y>

" }}}
" --- alignment {{{

nmap <silent> ;al :left<cr>
nmap <silent> ;ac :center<cr>
nmap <silent> ;ar :right<cr>
nmap <silent> ;rr :AlignRight<cr>

" }}}

" Programming
" --- autocompletion {{{

" customize autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold
" change to directory of file
nmap <silent> ,. :cd%:h<cr>

" }}}
" --- merging {{{

" highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" jump to next conflict marker
nmap <silent> ;c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>

" }}}
" --- hex {{{

" toggle between hex and binary, after opening file with `vim -b`
noremap <F9> :call HexMe()<CR>

" }}}

" Navigation
" ---windows {{{

" map alt-[h,j,k,l,=] to resizing a window split
map <silent> <A-h> <C-W><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-W>>
map <silent> <A-=> <C-W>=
" map alt-[s,v] to horizontal and vertical split respectively
map <silent> <A-s> :split<CR>
map <silent> <A-v> :vsplit<CR>
" map alt-[n,p] to moving to next and previous window respectively
map <silent> <A-n> <C-W><C-W>
map <silent> <A-p> <C-W><S-W>
" simultaneously scroll split windows
nmap <leader>sb :call SplitScroll()<CR>

" }}}


" -----------------------------------------------------------------------------
" Filetype Settings

" return to last edit position {{{

autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" }}}

" languages {{{

au BufRead,BufNewFile,BufWrite {*.ejs} set ft=html
au BufRead,BufNewFile,BufWrite {*.markdown,*.md,*.mdk,*.ronn} set ft=markdown
au BufRead,BufNewFile,BufWrite {*.textile} set ft=textile
au BufRead,BufNewFile,BufWrite {*.pl,*.pm,*.t} set ft=perl sw=4 ts=4
au BufRead,BufNewFile,BufWrite {*.json} set ft=javascript
au BufRead,BufNewFile,BufWrite {*.coffee} set ft=coffee
au BufRead,BufNewFile,BufWrite {Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,*.god,.irbrc,irb_tempfile*} set ft=ruby
au BufRead,BufNewFile,BufWrite {Tupfile,*.tup} setf tup
au BufRead,BufNewFile,BufWrite {*.bin} set ft=xxd

" }}}

" omnicompletion {{{

autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,xhtml set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" }}}

" dictionaries {{{

au FileType javascript set dictionary+=$HOME/.vim/dict/javascript.dict
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict

" }}}

" spelling {{{

let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
if version >= 700
set spl=en spell
set nospell
endif

" }}}


" -----------------------------------------------------------------------------
" Plugin Settings

source ~/.vim/settings.vim
