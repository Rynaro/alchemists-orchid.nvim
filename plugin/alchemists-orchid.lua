-- plugin/alchemists-orchid.lua
-- This file is sourced automatically by Neovim after startup,
-- so it can set up your colorscheme.

-- Enable true colors
vim.opt.termguicolors = true

-- Load and apply the palette
require("alchemists-orchid").setup()
vim.cmd("colorscheme alchemists-orchid")

