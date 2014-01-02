" Run pathogen for easily modifying the runtime path 
execute pathogen#infect()
"filetype plugin indent on

"set ignorecase                "makes searches case insensitive
"set list                      "shows whitespace chars
"autocmd GUIEnter * :simalt ~x "maximize the screen
"autocmd BufEnter * :lcd %:p:h "switch to current dir (breaks some scripts)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " get out of horrible vi-compatible mode
filetype on " detect the type of file
set history=1000 " How many lines of history to remember
set clipboard=unnamedplus
"set spell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark " we are using a dark background
syntax on " syntax highlighting on
colorscheme desert 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom 
set cmdheight=1 " the command bar is 2 high
set number " turn on line numbers
set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
set backspace=2 " make backspace work normal
set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
"set mouse=a " use mouse everywhere
set shortmess=atI " shortens messages to avoid 'press a key' prompt 
set report=0 " tell us when anything is changed via :...
" make the splitters between windows be blank
set fillchars=vert:\ ,stl:\ ,stlnc:\ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
set nohlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
"set lines=80 " 80 lines tall
"set columns=160 " 160 cols wide
set so=10 " Keep 10 lines (top/bottom) for scope
set novisualbell " don't blink
set noerrorbells " no noises
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=[ascii\ \%03.3b\ 0x\%02.2B\ y=%04l\ (%p%%)\ x=%04v]\ %F%m%r%h%w
set laststatus=2 " always show the status line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set fo=tcrqn " See Help (complex)
"set ai " autoindent
"set si " smartindent 
"set cindent " do c-style indenting
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify 
set expandtab    " expand tabs to spaces
set wrap " wrap lines  
set linebreak
set nolist
"set smarttab " use tabs at the start of a line, spaces elsewhere

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"    Enable folding, but by default make it act like folding is off, because folding is annoying in anything but a few rare cases
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable " Turn on folding
set foldmethod=indent " Make folding indent sensitive
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen-=search " don't open folds when you search into them
set foldopen-=undo " don't open folds when you undo stuff

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:explVertical=1 " should I split verticially
let g:explWinSize=35 " width of 35 pixels

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Win Manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:winManagerWidth=35 " How wide should it be( pixels)
let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer' " What windows should it

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = "/usr/bin/ctags" " Location of ctags
let Tlist_Sort_Type = "name" " order by 
"let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Compact_Format = 1 " show small meny
let Tlist_Exit_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_File_Fold_Auto_Close = 0 " Do not close tags for other files
let Tlist_Enable_Fold_Column = 0 " Do not show folding tree
"let Tlist_Show_One_File = 1 " Show only the tags within the current buffer

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Minibuf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplModSelTarget = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Matchit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let b:match_ignorecase = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Perl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let perl_extended_vars=1 " highlight advanced perl vars inside strings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Select range, then hit :SuperRetab($width) - by p0g and FallingCow
function! SuperRetab(width) range
	silent! exe a:firstline . ',' . a:lastline . 's/\v%(^ *)@<= {'. a:width .'}/\t/g'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <c-tab> <esc>:bn<cr>
map <c-s-tab> <esc>:bp<cr>
"map <up> <ESC>:Sex<RETURN><ESC><C-W><up> " up arrow (normal mode) brings up a file list
map <f11> <esc>:Tlist<cr><esc><c-w><left> " bring up the tag list
"map <F2> <ESC>ggVG:call SuperRetab()<left>
"map <F12> ggVGg? " encypt the file (toggle)
map <c-c> :sh<cr>
map <c-r> :r!
map <c-s> :sp 
map <c-k> <esc><c-w><up>
map <c-j> <esc><c-w><down>
map <c-h> <esc><c-w><left>
map <c-l> <esc><c-w><right>

map <f5> <esc>:make<cr>
map <f6> <esc>:make install<cr>

" Make up/down move through 'void' spaces such as with multiline sentences
nnoremap k gk
nnoremap j gj

" NERDTree
map <c-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.aux$', '\.idx$', '\.ind$', '\.log$', '\.pdf$', '\.tks$', '\.toc$', '\.ilg$', '\.xlsx$', '\.eps$', '\.graffle$', '\.gz$', '\.doc$', '\.bst$', '\.ist$', '\.png$', '\.docx$', '\.zip$']

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
"au BufNewFile,BufRead *.asp :set ft=aspjscript " all my .asp files ARE jscript
"au BufNewFile,BufRead *.tpl :set ft=html " all my .tpl files ARE html
"au BufNewFile,BufRead *.hta :set ft=html " all my .tpl files ARE html

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xasp <%@language=jscript%><CR><%<CR><TAB><CR><BS>%><ESC><<O<TAB>
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr> 


