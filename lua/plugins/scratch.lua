return {
  "LintaoAmons/scratch.nvim",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },
  config = function()
    require("scratch").setup({
      scratch_file_dir = vim.fn.stdpath("cache") .. "/scratch.nvim", -- where your scratch files will be put
      use_telescope = true,
      file_picker = "telescope",
      filetypes = { "mk", "lua", "js", "ts" },
    })
  end,
  event = "VeryLazy",
}
