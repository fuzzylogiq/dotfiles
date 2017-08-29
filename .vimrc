set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Bundle 'stephenmckinney/vim-solarized-powerline'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'ervandew/supertab'
Plugin 'Shougo/neocomplete.vim'
Plugin 'aperezdc/vim-template'
Plugin 'chrisbra/csv.vim'
Plugin 'darfink/vim-plist'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'kchmck/vim-coffee-script'
Plugin 'klen/python-mode'
Plugin 'lambdalisue/vim-manpager'
Plugin 'plasticboy/vim-markdown'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/badwolf'
Plugin 'suan/vim-instant-markdown'
Plugin 'sukima/xmledit'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-scripts/moin.vim'
Plugin 'sophacles/vim-processing'
Plugin 'tell-k/vim-autopep8'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'juneedahamed/vc.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set clipboard=unnamed         " use the os x clipboard
set nocompatible              " os x keyboard compatability
set bs=2                      " set backspace behaviour 
set number                    " add line numbers
set ruler                     " shows row and column number at bottom right corner
syntax on                     " syntax highlighting
colorscheme badwolf           " colours
set laststatus=2              " always show status bar
set encoding=utf-8            " default coding unicode
set t_Co=256                  " set terminal colours to 256
set mouse=a                   " mouse on everywhere
"set background=dark

" temp fix for jedi-vim
let g:jedi#force_py_version = 2

" airline stuff
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" template stuff
let g:templates_directory='~/.vim/templates'
let g:templates_global_name_prefix = 'template:'

" plist stuff
let g:plist_display_format = 'xml'
let g:plist_save_format = 'xml'

" neocomplete stuff
let g:neocomplete#disable_auto_complete = 1

" syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_ignore_files = ['\.py$']
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_python_python_exec = '/Users/ouit0354/Developer/homebrew/bin/python3'

" vimtex stuff
let g:vimtex_view_general_viewer
      \ = '/Users/ouit0354//My Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction
" pymode stuff
let g:pymode_rope_completion = 0

" autocmd for .recipe files (autopkg)
au BufNewFile, BufRead *.recipe set filetype=xml

" tab stuff
set expandtab
set tabstop=2
set shiftwidth=2

" word wrap stuff
set wrap
set linebreak
set nolist

" Markdown stuff
let g:vim_markdown_folding_disabled=1

" NerdTREE stuff
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Snippet stuff
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsEditSplit="vertical"

" VC stuff
let g:vc_browse_cache_all = 1

" my keymappings
map <C-i> :bp<CR>
map <C-o> :bn<CR>
inoremap jk <ESC>
let mapleader = "\<Space>"
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
