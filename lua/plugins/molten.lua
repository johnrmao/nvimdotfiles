return {
    {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
            vim.g.molten_copy_output = true


            local map = vim.keymap.set
            map("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
            map("n", "<localleader>me", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "Run operator selection" })
            map("n", "<localleader>mrl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "Evaluate line" })
            map("n", "<localleader>mrr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "Re-evaluate cell" })
            map("v", "<localleader>mrv", ":<C-u>MoltenEvaluateVisual<CR>gv",
                { silent = true, desc = "Evaluate visual selection" })
            map("n", "<localleader>md", ":MoltenDelete<CR>", { silent = true, desc = "Molten delete cell" })
            map("n", "<localleader>mh", ":MoltenHideOutput<CR>", { silent = true, desc = "Hide output" })
            map("n", "<localleader>mc", ":noautocmd MoltenEnterOutput<CR>", { silent = true, desc = "Show/enter output" })
            -- Initialize Molten for Python (with virtual env detection)
            map("n", "<localleader>ip", function()
                local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
                if venv ~= nil then
                    -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
                    venv = string.match(venv, "/.+/(.+)")
                    vim.cmd(("MoltenInit %s"):format(venv))
                else
                    vim.cmd("MoltenInit python3")
                end
            end, { desc = "Initialize Molten for python3", silent = true })
        end,
    },
    {
        -- see the image.nvim readme for more information about configuring this plugin
        "3rd/image.nvim",
        opts = {
            backend = "kitty", -- whatever backend you would like to use
            max_width = 100,
            max_height = 12,
            max_height_window_percentage = math.huge,
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        },
    }
}
