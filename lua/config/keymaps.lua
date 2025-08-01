-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set

-- Keybindings for molten-nvim
map("n", "<leader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
map("n", "<leader>me", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "Run operator selection" })
map("n", "<leader>mrl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "Evaluate line" })
map("n", "<leader>mrr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "Re-evaluate cell" })
map("v", "<leader>mrv", ":<C-u>MoltenEvaluateVisual<CR>gv", { silent = true, desc = "Evaluate visual selection" })
map("n", "<leader>md", ":MoltenDelete<CR>", { silent = true, desc = "Molten delete cell" })
map("n", "<leader>mh", ":MoltenHideOutput<CR>", { silent = true, desc = "Hide output" })
map("n", "<leader>mc", ":noautocmd MoltenEnterOutput<CR>", { silent = true, desc = "Show/enter output" })
-- Initialize Molten for Python (with virtual env detection)
map("n", "<leader>ip", function()
  local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
  if venv ~= nil then
    -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
    venv = string.match(venv, "/.+/(.+)")
    vim.cmd(("MoltenInit %s"):format(venv))
  else
    vim.cmd("MoltenInit python3")
  end
end, { desc = "Initialize Molten for python3", silent = true })

-- Zk Maps
local opts = { noremap = true, silent = true }

-- Create a new note after asking for its title.
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)

-- Open notes.
vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
-- Open notes associated with the selected tags.
vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)
-- Search for the notes matching a given query.
vim.api.nvim_set_keymap(
  "n",
  "<leader>zf",
  "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
  opts
)
-- Search for the notes matching the current visual selection.
vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)
-- Search for oprhaned notes
vim.api.nvim_set_keymap("n", "<leader>zp", ":ZkOrphans<CR>", opts)
-- Search for recent notes
vim.api.nvim_set_keymap("n", "<leader>zr", ":ZkRecents<CR>", opts)
-- Daily journal
vim.api.nvim_set_keymap("n", "<leader>zj", "<Cmd>ZkNew { dir = 'daily_journal', group = 'daily' }<CR>", opts)
-- Backlink
vim.api.nvim_set_keymap("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)

-- ZK Link from selection
vim.api.nvim_set_keymap("n", "<leader>zm", ":ZkInsertLink<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>zm", ":ZkInsertLinkAtSelection<CR>", { noremap = true, silent = true })

if require("zk.util").notebook_root(vim.fn.expand("%:p")) ~= nil then
  local function map(...)
    vim.api.nvim_buf_set_keymap(0, ...)
  end
  local opts = { noremap = true, silent = false }

  -- Open the link under the caret.
  map("n", "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)

  -- Create a new note after asking for its title.
  -- This overrides the global `<leader>zn` mapping to create the note in the same directory as the current buffer.
  map("n", "<leader>zn", "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)
  -- Create a new note in the same directory as the current buffer, using the current selection for title.
  map("v", "<leader>znt", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", opts)
  -- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
  map(
    "v",
    "<leader>znc",
    ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
    opts
  )

  -- Open notes linking to the current buffer.
  map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)
  -- Alternative for backlinks using pure LSP and showing the source context.
  --map('n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- Open notes linked by the current buffer.
  map("n", "<leader>zl", "<Cmd>ZkLinks<CR>", opts)

  -- Preview a linked note.
  map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- Open the code actions for a visual selection.
  map("v", "<leader>za", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
end
