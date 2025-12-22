-- Alchemist's Orchid Neovim Theme
-- Main entry point with setup() function
-- Supports multiple palette modes: dark, light, sepia

local M = {}

-- Load modules
local highlights = require('alchemists-orchid.highlights')
local terminal = require('alchemists-orchid.terminal')

-- Load palettes
local dark_palette = require('alchemists-orchid.palettes.dark')
local light_palette = require('alchemists-orchid.palettes.light')
local sepia_palette = require('alchemists-orchid.palettes.sepia')

-- Default configuration
local default_config = {
  mode = 'dark',           -- 'dark', 'light', 'sepia'
  overrides = {},          -- Optional color overrides
  transparent = false,      -- Transparent background
  italic_comments = true,   -- Italic comments
}

-- Merge color overrides into palette
local function apply_overrides(palette, overrides)
  if not overrides or vim.tbl_isempty(overrides) then
    return palette
  end
  
  local merged = vim.deepcopy(palette)
  for key, value in pairs(overrides) do
    if merged[key] then
      merged[key] = value
    end
  end
  return merged
end

-- Get palette based on mode
local function get_palette(mode)
  if mode == 'light' then
    return light_palette.palette
  elseif mode == 'sepia' then
    return sepia_palette.palette
  else
    -- Default to dark mode
    return dark_palette.palette
  end
end

-- Setup function
function M.setup(config)
  config = config or {}
  
  -- Merge with defaults
  local opts = vim.tbl_deep_extend('force', default_config, config)
  
  -- Ensure termguicolors is set
  vim.opt.termguicolors = true
  
  -- Set background based on mode
  if opts.mode == 'light' then
    vim.opt.background = 'light'
  else
    vim.opt.background = 'dark'
  end
  
  -- Set colorscheme name
  vim.g.colors_name = 'alchemists-orchid'
  
  -- Get palette and apply overrides
  local palette = get_palette(opts.mode)
  palette = apply_overrides(palette, opts.overrides)
  
  -- Apply highlights
  highlights.apply(palette, {
    transparent = opts.transparent,
    italic_comments = opts.italic_comments,
  })
  
  -- Apply terminal colors
  terminal.apply(palette)
end

-- Backward compatibility: support old override syntax
-- If config is a table with color keys directly, treat as overrides
function M.setup_legacy(config)
  if config and not config.mode and not config.transparent and not config.italic_comments then
    -- Old syntax: config is just overrides
    return M.setup({ overrides = config })
  else
    -- New syntax or empty
    return M.setup(config)
  end
end

-- Export palette for external access (backward compatibility)
M.palette = dark_palette.palette

return M
