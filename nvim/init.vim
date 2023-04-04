set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

set nowrap
" Better scrolling
set scrolloff=3       " Show next 3 lines while scrolling.
set sidescrolloff=5   " Show next 5 columns while side-scrolling.

" Better searching
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch
set hlsearch
nnoremap <space> :nohlsearch<CR>

set cursorline " Show cursor
set colorcolumn=80 " Ruler on

" set whichwrap+=<,>,[,]

set wildmenu            " visual autocomplete for command menu
set wildmode=longest,list

" Set dracula colorscheme
packadd! dracula
colorscheme dracula

syntax enable

" Enable syntax highlighting
filetype on

" Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Never recognize a .tex file as `plaintex`
let g:tex_flavor = "latex"

" Exit from Terminal Mode using Esc
tnoremap <Esc> <C-\><C-n>

" Neomake configuration
" When writing a buffer (no delay), and on normal mode changes (after 1s).
autocmd VimEnter * call neomake#configure#automake('nrw', 1000)
let g:neomake_python_enabled_makers = ['flake8']

" vinsence
let g:vimsence_client_id = '439476230543245312'
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Directory: {}'
let g:vimsence_file_explorer_text = 'In NERDTree'
let g:vimsence_file_explorer_details = 'Looking for files'
let g:vimsence_custom_icons = {'filetype': 'iconname'}

" NERDTree configuration
" Open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" NERDTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
