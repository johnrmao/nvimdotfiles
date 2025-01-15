require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.neotree',
  require 'plugins.bambootheme',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.autoformatting',
  require 'plugins.alpha',
  require 'plugins.misc',
  require 'plugins.blankline',
  require 'plugins.zk',
  require 'plugins.markview',
  require 'plugins.gitsigns',
  require 'plugins.molten',
  require 'plugins.term',
  require 'plugins.copilot',
  require 'plugins.neogit',
}

-- zk settings
require 'core.zk_commands'
vim.env.ZK_NOTEBOOK_DIR = '/home/jyun/Documents/zk/'
vim.cmd 'filetype plugin on'
vim.opt.conceallevel = 1

vim.g.python3_host_prog = vim.fn.expand '~/.virtualenvs/neovim/bin/python3'

vim.opt.hidden = true
-- Check if the undo directory exists, and create it if it doesn't
if vim.fn.isdirectory(vim.o.undodir) == 0 then
  vim.fn.mkdir(vim.o.undodir, 'p')
end

-- Set the undo directory and enable persistent undo
vim.opt.undodir = '~/.vim/undodir'
vim.opt.undofile = true

vim.opt.autochdir = true
