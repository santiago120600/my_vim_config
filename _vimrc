syntax enable
set number
set mouse=a
set clipboard=unnamed
set showcmd
set ruler
set encoding=utf8
set showmatch
set sw=2
set relativenumber

set laststatus=2
set noshowmode

"Highlight seach
set hlsearch

set shiftwidth=4
set autoindent
set smartindent
filetype indent on 
set expandtab 
set tabstop=4
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"
"
"
call plug#begin('~/.vim/plugged')
" Temas
Plug 'morhetz/gruvbox'
"Emmet
Plug 'mattn/emmet-vim'
"Wakatime
Plug 'wakatime/vim-wakatime'
" IDE
Plug 'easymotion/vim-easymotion'
" Later plug
Plug 'lervag/vimtex'
" NerdTree
Plug 'scrooloose/nerdtree'
"Para navegar entre ventanas
Plug 'christoomey/vim-tmux-navigator'
"Nerd Commenter
Plug 'preservim/nerdcommenter'
" Gutter
Plug 'airblade/vim-gitgutter'
" git integration
Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

let mapleader=" "

nmap <Leader>s <Plug>(easymotion-s2)

let g:user_emmet_leader_key=','

" settings for sumatraPDF
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" Se abre la consola con los : despues se escribe NERDTreeFind y se presiona
" enter
nmap <Leader>nt :NERDTreeFind<CR>
" Para que nerdtree se cierre cuando cambio de archivo
let NERDTreeQuitOnOpen=1
" Kite
let g:kite_supported_languages = ['python', 'javascript']


" automatic closing of quotes, parenthesis, brackets
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O


" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=500
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction

" GitGutter
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

