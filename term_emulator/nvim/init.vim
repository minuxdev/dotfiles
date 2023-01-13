

" Basic configuration
syntax on
:set textwidth=80
:set number
":set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set paste


" custom mappings
" Leader
		
		let mapleader = "\<Space>"

" File management

		:noremap <C-z>q :wq!<CR>
		:noremap <C-x>  :q!<CR>
		:noremap <C-s>  :w<CR>

" Buffer window management
		
		:noremap <C-w> :vsplit<CR>
		:noremap <C-h> <C-W>h
		:noremap <C-j> <C-W>j
		:noremap <C-k> <C-W>k
		:noremap <C-l> <C-W>l

" Tabs

		:noremap <C-S-t> 	:tabprevious<CR>
		:noremap <C-tab> 	:tabnext<CR>
		:noremap <C-t> 	:tabnew<CR>
		:noremap term	:tabnew<CR>:term<CR>i

" Insert mode only

		:inoremap <C-z>	<C-U>
		:inoremap <C-S-z>	<C-R>
		:inoremap hh 	<ESC>^i
		
" plugins

call plug#begin('~/.config/nvim/plugins')

Plug 'vim-airline/vim-airline' "Status bar
Plug 'preservim/nerdtree' "Nerdtree
Plug 'ap/vim-css-color' "CSS Color preview
Plug 'terryma/vim-multiple-cursors' "CTRL + N for multiple cursors
Plug 'tpope/vim-surround' " Sorrund ysw)
Plug 'tpope/vim-commentary' "for commenting gcc & gc
Plug 'ryanoasis/vim-devicons' "Developer icons
Plug 'preservim/tagbar' "For browse the current file and get overview. Install: universal-ctags
Plug 'davidhalter/jedi-vim'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc-snippets'
Plug 'neoclide/coc.nvim'

call plug#end()



nnoremap <Leader>f :NERDTreeFocus<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
