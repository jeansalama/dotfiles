" Installation automatisée de Vim-plug
" https://github.com/junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Configuration de Vim-plug
call plug#begin('~/.vim/plugged')
    " Thèmes
    Plug 'michalbachowski/vim-wombat256mod'
    Plug 'crusoexia/vim-monokai'
    Plug 'preocanin/greenwint'

    " Configurations de base
    Plug 'tpope/vim-sensible'

    " Commente/décommente des lignes
    " (voir :help commentary)
    Plug 'tpope/vim-commentary'

    " Tampon d'accueil: accès simple aux fichiers récemments utilisés
    " (voir :help startify)
    Plug 'mhinz/vim-startify'

    " Plusieurs raccourcis utiles
    " (voir :help unimpaired)
    Plug 'tpope/vim-unimpaired'

    " Outil de dessin
    Plug 'vim-scripts/DrawIt'

    " Syntastic : analyse syntaxique (C, C++ et d'autres)
    " (voir :help syntastic)
    Plug 'scrooloose/syntastic'

    " Snippets : substitution rapide de morceaux de code génériques
    " La liste des *snippets* est présente dans les répertoires suivants:
    "   * ~/.vim/plugged/vim-snippets/UltiSnips;
    "   * ~/.vim/plugged/vim-snippets/snippets.
    " Les *snippets* sont placés par type de fichier.
    " (voir :help UltiSnips)
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
call plug#end()

" Touche *leader*
" http://learnvimscriptthehardway.stevelosh.com/chapters/06.html
let mapleader=","

" Coloration syntaxique
syntax on

" Copie-colle directement dans le presse-papier système
set clipboard=unnamedplus

" Activation de la souris
set mouse=a

" Thème de coloration syntaxique
" La commande colorscheme peut engendrer des bugs avec certains thèmes comme
" retirer la coloration syntaxique. Afin de prévenir cela, utiliser le conseil
" suivant:
" https://github.com/altercation/solarized/issues/102#issuecomment-275269574
"
" Les thèmes suivants sont aussi disponibles:
" - wombat256mod
" - monokai
" - greenwint
colorscheme torte
" colorscheme slate

" Rechargement automatique des configurations après modification
augroup vimrc
    au!
    au bufwritepost ~/.vim/vimrc source $MYVIMRC
augroup END

set formatoptions=tcroql
set autochdir
set encoding=utf-8
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set autoindent
set smarttab
set textwidth=120

" Activation des numéros de ligne
set number

" Gestion de l'expansion des tabulations (en espaces)
" (voir :help expandtab)
set tabstop=4 | set shiftwidth=4 | set expandtab
autocmd filetype tex set tabstop=2 | set shiftwidth=2
autocmd FileType make setlocal noexpandtab

" Indicateur du dépassement de 80 caractères
augroup collumnLimit
  autocmd!
  autocmd BufEnter,WinEnter,FileType cpp
        \ highlight CollumnLimit ctermbg=Red guibg=Red
  let collumnLimit = 79 " feel free to customize
  let pattern =
        \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
  autocmd BufEnter,WinEnter,FileType cpp
        \ let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END

" Raccourcis pour appel du Makefile
nnoremap <leader>m :!make<CR>
nnoremap <leader>ma :!make all<CR><CR>

" Replis (de lignes)
set foldmethod=indent
set nofoldenable

" Recherche et remplacement du terme surligné (mode visuel)
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>



