-- plugin/alchemists-orchid.lua

-- 1) true‐color support
vim.opt.termguicolors = true

-- 2) load & apply the theme
require('alchemists-orchid').setup()

-- 3) register under the dashed name so :colorscheme works
vim.cmd('colorscheme alchemists-orchid')

