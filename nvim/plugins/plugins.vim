call plug#begin('~/.config/nvim/autoload/plugged')

" Nerdtree
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'

" Indent line
Plug 'Yggdroot/indentline'

" Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'

" Discord Presence
Plug 'andweeb/presence.nvim'

" Completions
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippets 
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Status lines 
Plug 'itchyny/lightline.vim'

" Themes (choose as you prefer. I'm feeling foresty right now)
" Plug 'ayu-theme/ayu-vim'
" Plug 'altercation/vim-colors-solarized'
" Plug 'rktjmp/lush.nvim'
" Plug 'ellisonleao/gruvbox.nvim'
" Plug 'shaunsingh/nord.nvim'
" Plug 'ackyshake/Spacegray.vim'
" Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Icons
Plug 'ryanoasis/vim-devicons'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'

" Brackets closer
Plug 'windwp/nvim-autopairs'

" LaTeX
Plug 'lervag/vimtex'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()
