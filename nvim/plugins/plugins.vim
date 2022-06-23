call plug#begin('~/.config/nvim/autoload/plugged')

" Nerdtree
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'

" Indent line
Plug 'Yggdroot/indentline'

" Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

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

" Lightline
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

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'

" Brackets closer
" Plug 'rstacruz/vim-closer'
Plug 'windwp/nvim-autopairs'

" Which key
Plug 'liuchengxu/vim-which-key'
Plug 'bohlender/vim-smt2'

call plug#end()

" augroup jdtls_lsp
"     autocmd!
"     autocmd FileType java lua require'jdtls_setup'.setup()
" augroup end

" Completions configuration
lua <<EOF
    require("nvim-lsp-installer").setup({
        ensure_installed = { "clangd"}, -- ensure these servers are always installed
        automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
        ui = {
            icons = {
                server_installed = "✓",
                server_pending = "➜",
                server_uninstalled = "✗"
            }
        }
    })

    -- Setup nvim-cmp
    local cmp = require('cmp')

    cmp.setup({
        snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
        },
        window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-k>'] = cmp.mapping.select_prev_item(),
            ['<C-j>'] = cmp.mapping.select_next_item(),
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({
                select = true,
            }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),

        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
            { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        }, {
            { name = 'buffer' },
        })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
        { name = 'buffer' },
        })
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
        { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
        { name = 'path' }
        }, {
        { name = 'cmdline' }
        })
    })

    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig')['clangd'].setup {
        capabilities = capabilities
    }
    
    local ARDUINO_UNO = "arduino:avr:uno"
    require('lspconfig')['arduino_language_server'].setup{
        cmd = {
                "arduino-language-server",
                "-cli-config", "/home/ivt/.arduino15/arduino-cli.yaml",
                "-fqbn",
                ARDUINO_UNO
            }
    }
    
    -- nvim autopairs
    require('nvim-autopairs').setup{}
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } })) 

    cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"

    -- discord presence
    require("presence"):setup({
        -- General options
        auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
        neovim_image_text   = "wtf are you looking at", -- Text displayed when hovered over the Neovim image
        main_image          = "file",                   -- Main image display (either "neovim" or "file")
        -- client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
        log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
        debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
        enable_line_number  = false,                      -- Displays the current line number instead of the current project
        blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
        file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)

        -- Rich Presence text options
        editing_text        = "Editing some shitty file",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text  = "Browsing some stupid folder",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text        = "Reading some bullshit",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text      = "Working on deez nuts",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
    })
EOF
