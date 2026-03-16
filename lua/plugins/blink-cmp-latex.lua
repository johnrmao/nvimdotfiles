return {
  "saghen/blink.cmp",
  dependencies = {
    "erooke/blink-cmp-latex",
  },

  opts = function(_, opts)
    opts.sources = opts.sources or {}
    opts.sources.default = { "lsp", "path", "snippets", "buffer" }
    opts.sources.providers = opts.sources.providers or {}
    
    -- Disable tree-sitter highlighting in completion menu (empty array = disabled)
    opts.completion = opts.completion or {}
    opts.completion.menu = opts.completion.menu or {}
    opts.completion.menu.draw = opts.completion.menu.draw or {}
    opts.completion.menu.draw.treesitter = {}
    
    return opts
  end,
}
