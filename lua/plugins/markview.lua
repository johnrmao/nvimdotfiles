return {
  {
    'OXY2DEV/markview.nvim',
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    -- Markview split toggle
    vim.api.nvim_set_keymap('n', '<leader>ms', ':Markview splitToggle<CR>', { noremap = true, silent = true }),
    },
  }

