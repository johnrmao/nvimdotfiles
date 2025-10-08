vim.env.PATH = "/home/jyun/.nvm/versions/node/v24.9.0/bin:" .. vim.env.PATH
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.env.ZK_NOTEBOOK_DIR = "/home/jyun/Documents/zk"
vim.opt.conceallevel = 1

vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
vim.opt.termguicolors = true
vim.g.tex_flavor = "latex"
vim.g.node_host_prog = "/home/jyun/.nvm/versions/node/v24.9.0/bin/node"
