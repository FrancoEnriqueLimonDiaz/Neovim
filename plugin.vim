
call plug#begin(expand(stdpath('nvim') . '/plugged'))
  " Iconos
  Plug 'ryanoasis/vim-devicons'
	" Tema de neovim
	Plug 'shaunsingh/moonlight.nvim'
	" Menu para navegar
	Plug 'preservim/nerdtree'
	" Crear folds
	Plug 'lambdalisue/readablefold.vim'
	" Mostar recomendaciones mientras escribes
	Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
	" Encontrar palabras mas rapido 
	Plug 'phaazon/hop.nvim'
  " Telescope, encontrar archivos facilmente
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-lua/plenary.nvim'
  " Indent line
  Plug 'Yggdroot/indentLine'
  Plug 'lukas-reineke/indent-blankline.nvim'
  " Format 
  Plug 'lukas-reineke/lsp-format.nvim'
call plug#end()