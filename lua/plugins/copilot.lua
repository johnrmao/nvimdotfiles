return {
  'github/copilot.vim',
  config = function()
    opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<leader>cp', ':Copilot panel<CR>', opts)
    vim.keymap.set('i', '<C-K>', '<Plug>(copilot-accept-word)', opts)
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
  end,
}
