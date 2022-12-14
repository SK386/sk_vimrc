"<------CONFIGURACOES BASICAS------>
set nu!
set mouse=a
set title
set cursorline
set encoding=utf-8
"<------TEMA------>
packadd! dracula
syntax enable
colorscheme dracula
"<------PLUGINS------>
call plug#begin('~/.vim/plugged')
"Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'puremourning/vimspector'
Plug 'zxqfl/tabnine-vim'
Plug 'rust-lang/rust.vim'
Plug 'Yohannfra/Vim-Vim-Project'
"Plug 'frazrepo/vim-rainbow'
"Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
"Plug 'EvanQuan/vim-executioner'
call plug#end()
"<---------complemento dos plug-------->
set laststatus=2
set noshowmode
"let g:rainbow_active = 1
"<--rust.vim-->
syntax enable
filetype plugin indent on
"<------Executavel de codigo------>
"declaração da função
function! Executar(arq)
 :w

    if &filetype == 'html'
        :exec '!luakit' a:arq
    elseif &filetype == 'python'
        :exec '!python3' a:arq
    elseif &filetype == 'c'
        :exec '!gcc -o /tmp/a.out' a:arq ';/tmp/a.out'
    endif
endfunction
"mapear a tecla F5 para chamar a função Executar
nnoremap <F5> :call Executar(shellescape(@%, 1))<CR> 
"<---------VIMRSPEC-------->
"mapeando
map <C-s> :write<CR>
map <C-q> :quit<CR>
map <C-t> :terminal<CR>
map <C-e> :NERDTree<CR>
map <C-n> :tabnew<CR>
"ycm conf
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_config.py'
