return {
  'zk-org/zk-nvim',
  lazy = false,
  config = function()
    require('zk').setup {
      picker = 'telescope', -- Use Telescope for picking notes
      lsp = {
        config = {
          cmd = { 'zk', 'lsp' },
          name = 'zk',
        },
        auto_attach = {
          enabled = true,
          filetypes = { 'markdown' },
        },
      },
    }
    local opts = { noremap = true, silent = false }

    -- Create a new note after asking for its title.
    vim.api.nvim_set_keymap('n', '<leader>zn', "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)

    -- Open notes.
    vim.api.nvim_set_keymap('n', '<leader>zo', "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
    -- Open notes associated with the selected tags.
    vim.api.nvim_set_keymap('n', '<leader>zt', '<Cmd>ZkTags<CR>', opts)
    -- Search for the notes matching a given query.
    vim.api.nvim_set_keymap('n', '<leader>zf', "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)
    -- Search for the notes matching the current visual selection.
    vim.api.nvim_set_keymap('v', '<leader>zf', ":'<,'>ZkMatch<CR>", opts)
    -- Search for oprhaned notes
    vim.api.nvim_set_keymap('n', '<leader>zp', ':ZkOrphans<CR>', opts)
    -- Search for recent notes
    vim.api.nvim_set_keymap('n', '<leader>zr', ':ZkRecents<CR>', opts)
    -- Daily journal
    vim.api.nvim_set_keymap('n', '<leader>zj', "<Cmd>ZkNew { dir = 'daily_journal', group = 'daily' }<CR>", opts)
    -- Markview split toggle
    vim.api.nvim_set_keymap('n', '<leader>ms', ':Markview splitToggle<CR>', opts)
    -- ZK Link from selection
    vim.api.nvim_set_keymap('n', '<leader>zm', ':ZkInsertLink<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<leader>zm', ':ZkInsertLinkAtSelection<CR>', { noremap = true, silent = true })
  end,
  dependencies = { -- Make sure these are installed
    'nvim-telescope/telescope.nvim',
  },
}
