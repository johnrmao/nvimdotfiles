return {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
        require('toggleterm').setup {
            size == function(term)
                if term.direction == 'horizontal' then
                    return 15
                elseif term.direction == 'vertical' then
                    return vim.o.columns * 0.4
                end
            end,
            autochdir = false,
            auto_scroll = true,
        }
        vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<cr>', { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<cr>', { noremap = true, silent = true })
    end,
}
