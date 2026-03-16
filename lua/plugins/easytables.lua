return {
  {
    "Kicamon/markdown-table-mode.nvim",
    lazy = false,
    config = function()
      require("markdown-table-mode").setup()
    end,
  },
  {
    "Myzel394/easytables.nvim",
    opts = {},
  },
}
