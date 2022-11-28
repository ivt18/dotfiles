source $HOME/.config/nvim/plugins/plugins.vim

luafile $HOME/.config/nvim/treesitter/treesitter.lua
luafile $HOME/.config/nvim/lsp/config.lua
luafile $HOME/.config/nvim/cmp/config.lua
luafile $HOME/.config/nvim/discord/presence.lua
luafile $HOME/.config/nvim/plugins/luasnip.lua

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim

lua require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/luasnip/"})
