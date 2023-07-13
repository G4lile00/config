set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set shiftwidth=4
set tabstop=4
set expandtab
set nowrap
set showcmd
set showmode
set hlsearch
set background=dark
set wildmenu

call plug#begin('~/.vim/plugged') 

Plug 'prettier/vim-prettier', { 'do': 'npm install -g --frozen-lockfile --production', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
" Global options
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Keymaps
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
vnoremap <C-f> "ay:Ag <C-r>"<CR>
vnoremap <C-l> "ay/<C-r>"<CR>
nnoremap <C-l> :set hlsearch!<CR>
nnoremap <C-p> :Files<CR> 
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
nno <silent> <C-c> :tabc<CR>
inoremap <silent><expr> <TAB> pumvisible() ? coc#pum#confirm() : "\<TAB>"
" Auto comands


autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

autocmd VimEnter * NERDTree | wincmd p
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Functions

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction




function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['readonly', 'filename', 'modified' ] ]
      \ },
      \ }
