-- plugin/alchemists-orchid.lua

-- 1) true-color support
vim.opt.termguicolors = true

-- 2) load & apply the theme with defaults (dark mode)
require('alchemists-orchid').setup()

-- 3) register under the dashed name so :colorscheme works
vim.cmd('colorscheme alchemists-orchid')

-- 4) Create user commands for theme switching

-- Switch to specific mode: :AlchemistsOrchid dark|light|sepia
vim.api.nvim_create_user_command('AlchemistsOrchid', function(opts)
  local mode = opts.args
  if mode == '' then
    -- No argument: show current mode
    local current = require('alchemists-orchid').get_mode()
    vim.notify(string.format('alchemists-orchid: Current mode is "%s"', current or 'unknown'), vim.log.levels.INFO)
  else
    require('alchemists-orchid').switch(mode)
  end
end, {
  nargs = '?',
  complete = function()
    return require('alchemists-orchid').get_modes()
  end,
  desc = 'Switch alchemists-orchid theme mode (dark, light, sepia)',
})

-- Toggle/cycle through modes: :AlchemistsOrchidToggle
vim.api.nvim_create_user_command('AlchemistsOrchidToggle', function()
  require('alchemists-orchid').toggle()
end, {
  desc = 'Toggle alchemists-orchid theme mode (cycles: dark → light → sepia)',
})
