return {
  'github/copilot.vim',
  config = function()
    opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<leader>cp', ':Copilot panel<CR>', opts)
    vim.keymap.set('i', '<S-Tab>', 'copilot#AcceptWord()', { noremap = true, silent = true, expr = true })
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap('i', '<C-Tab>', 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true })
  end,
}
