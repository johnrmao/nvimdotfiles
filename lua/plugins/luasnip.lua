return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()
    luasnip.config.set_config({
      enable_autosnippets = true,
    })
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/plugins/luasnip/" })
  end,
}
