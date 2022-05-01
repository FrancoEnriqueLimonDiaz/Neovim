call plug#begin(expand(stdpath('config') . '/plugged'))
	" Theme
	Plug 'shaunsingh/moonlight.nvim'
	" Sneak
	Plug 'justinmk/vim-sneak'
	" Indent Line
	Plug 'lukas-reineke/indent-blankline.nvim'
	" lualine
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	" Nerdtree
	" Ale eslint
	Plug 'dense-analysis/ale'
	Plug 'preservim/nerdtree'
	" Harpoon
	Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
	Plug 'ThePrimeagen/harpoon'
	" Better fold
	Plug 'lambdalisue/readablefold.vim'
	" Auto Save
	Plug 'Pocco81/AutoSave.nvim'
	" Ruby
	Plug 'tpope/vim-rails'
	Plug 'tpope/vim-rake'
	Plug 'tpope/vim-projectionist'
	Plug 'thoughtbot/vim-rspec'
	Plug 'ecomba/vim-ruby-refactoring', {'tag': 'main'}
	" Typescript Bundle
	Plug 'leafgarland/typescript-vim'
	Plug 'HerringtonDarkholme/yats.vim'
	" HTML Bundle
	Plug 'hail2u/vim-css3-syntax'
	Plug 'gko/vim-coloresque'
	Plug 'tpope/vim-haml'
	Plug 'mattn/emmet-vim'
	" Javascript Bundle
	Plug 'jelera/vim-javascript-syntax'
	" Coc
	Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
	" Find words 
	Plug 'phaazon/hop.nvim'
call plug#end()
" My remaps
let g:sneak#label = 1
:map c "+:close<CR>
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
tnoremap <Esc> <C-\><C-n>
nnoremap <Tab> gt
nnoremap <S-j> :HopWord<Cr>
nnoremap <S-n> :tabnew<Cr>
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
nnoremap <F3> :NERDTree<CR>
nnoremap <F3><F3> :NERDTreeToggle<CR>
nnoremap <S-m> :lua require("harpoon.mark").add_file()<CR>
nnoremap <S-s> :lua require("harpoon.ui").toggle_quick_menu()<CR>
" Primary Settings.
colorscheme moonlight
set t_Co=256
syntax-enable
set number        
set showcmd
set encoding=utf-8
set showmatch
set relativenumber
set nowrap
set cursorline
" Config indenting.
set tabstop=2   
set shiftwidth=2  
set smartindent  
set cindent
" LSP config.
lua << EOF
  require'hop'.setup()
	require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
  local autosave = require("autosave")
  autosave.setup(
      {
          enabled = true,
          execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
          events = {"InsertLeave", "TextChanged"},
          conditions = {
              exists = true,
              filename_is_not = {},
              filetype_is_not = {},
              modifiable = true
          },
          write_all_buffers = true,
          on_off_commands = true,
          clean_command_line_interval = 0,
          debounce_delay = 135
      }
  ) 
EOF
