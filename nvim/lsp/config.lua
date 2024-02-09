-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end

require("mason").setup({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd", "jdtls", "ltex", "pyright", "sqlls"
    },
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local util = require'lspconfig.util'

require'lspconfig'.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {
        "clangd",
        "--header-insertion=never",
    },
    filetypes = {
        "c",
        "cpp"
    }
}

require'lspconfig'.ltex.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ltex = {
            disabledRules = { ['en-US'] = { 'PROFANITY' } },
            dictionary = {
                ['en-US'] = {'Iliyan', 'Teofilov'},
            },
        },
    },
}

require'lspconfig'.jdtls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.pyright.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {"python"},
}

require'lspconfig'.sqlls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "sql-language-server", "up", "--method", "stdio" },
    filetypes = { "sql", "mysql" },
    root_dir = function(pattern)
        local cwd = vim.loop.cwd()
        local root = util.root_pattern('.git')(pattern)
        return util.path.is_descendant(cwd, root) and cwd or root
    end,
}
