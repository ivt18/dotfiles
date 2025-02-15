" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard+=unnamedplus              " Copy paste between vim and everything else
set autochdir                           " Your working directory will always be the same as your working directory

"au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm
"alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %

" Enable true colors support
if has ('termguicolors')
    set termguicolors
endif

" Spacegray colorscheme settings
" let g:spacegray_underline_search = 1
" let g:spacegray_use_italics = 1
" let g:spacegray_low_contrast = 1
" colorscheme spacegray

" Gruvbox colorscheme settings
" let g:gruvbox_material_background = 'soft'
" colorscheme gruvbox-material

" Everforest colorscheme settings
" let g:everforest_background = 'medium'
" let g:everforest_transparent_background = 1
" colorscheme everforest

" Nord colorscheme settings
" let g:nord_italic = v:true
" let g:nord_bold = v:true
" colorscheme nord

" OceanicNext colorscheme settings
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" Make the background transparent so that it blends in with the terminal
highlight Normal ctermbg=none guibg=none
highlight NonText ctermbg=none guibg=none
highlight Normal guibg=none ctermbg=none
highlight LineNr guibg=none ctermbg=none
highlight Folded guibg=none ctermbg=none
highlight NonText guibg=none ctermbg=none
highlight SpecialKey guibg=none ctermbg=none
highlight VertSplit guibg=none ctermbg=none
highlight SignColumn guibg=none ctermbg=none
highlight EndOfBuffer guibg=none ctermbg=none

" Make current line transparent
autocmd VimEnter * highlight CursorLine guibg=none ctermbg=none

" Make the number on the sidebar get highlighted
autocmd VimEnter * highlight CursorLineNr guibg=None ctermbg=none ctermfg=White guifg=White cterm=bold gui=bold

" Transparent line number bar
highlight LineNr guibg=none

filetype plugin on

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" VimTeX configuration
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
autocmd FileType tex let g:indentLine_enabled=0
autocmd BufEnter *.tex set wrap 

" Configuration for Markdown files
autocmd FileType markdown let g:indentLine_enabled=0
autocmd BufEnter *.md set wrap 
autocmd BufEnter *.md set conceallevel=0

lua << EOF
-- this is for diagnositcs signs on the line number column
-- nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end

-- Comments
require('Comment').setup()

-- Jupyter notebooks
-- require("jupytext").setup({style = "hydrogen"})
-- require("notebook-navigator").setup()
EOF
