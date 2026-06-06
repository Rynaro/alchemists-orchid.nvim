-- Alchemist's Orchid Neovim Theme
-- Main entry point with setup() function
-- Supports multiple palette modes: dark, light, sepia, sepia_dark

local M = {}

-- Load modules
local highlights = require('alchemists-orchid.highlights')
local terminal = require('alchemists-orchid.terminal')
local version = require('alchemists-orchid._version')
local persistence = require('alchemists-orchid.persistence')

-- Load palettes
local dark_palette      = require('alchemists-orchid.palettes.dark')
local light_palette     = require('alchemists-orchid.palettes.light')
local sepia_palette     = require('alchemists-orchid.palettes.sepia')
local sepia_dark_palette = require('alchemists-orchid.palettes.sepia_dark')

-- Available modes
local available_modes = { 'dark', 'light', 'sepia', 'sepia_dark' }

-- Default configuration
local default_config = {
  mode = 'dark',           -- 'dark', 'light', 'sepia', 'sepia_dark'
  overrides = {},          -- Optional color overrides
  transparent = false,     -- Transparent background
  italic_comments = true,  -- Italic comments
  persist = false,         -- Persist theme selection across sessions
  persist_path = nil,      -- Custom path for persistence file (optional)
}

-- Current active configuration (stored for re-application)
local current_config = nil

-- Re-entrancy guard. Setting 'background' while g:colors_name is set causes
-- Neovim to re-source colors/alchemists-orchid.vim (which calls setup() with
-- no args). This flag makes that nested call a no-op so it cannot clobber the
-- user's active mode/config mid-apply.
local applying = false

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

-- Map mode → palette module
local palette_modules = {
  dark       = dark_palette,
  light      = light_palette,
  sepia      = sepia_palette,
  sepia_dark = sepia_dark_palette,
}

-- Get palette module based on mode (defaults to dark)
local function get_palette_module(mode)
  return palette_modules[mode] or dark_palette
end

-- Get palette table based on mode
local function get_palette(mode)
  return get_palette_module(mode).palette
end

-- Validate mode
local function is_valid_mode(mode)
  for _, m in ipairs(available_modes) do
    if m == mode then
      return true
    end
  end
  return false
end

-- Apply theme with given options (internal function)
local function apply_theme(opts)
  -- Guard the whole apply against the re-source triggered by 'background'
  -- (see the `applying` declaration above).
  applying = true

  -- Ensure termguicolors is set
  vim.opt.termguicolors = true

  -- Resolve the palette module for this mode
  local mod = get_palette_module(opts.mode)

  -- Set background from the palette's own declaration
  vim.opt.background = mod.background or 'dark'

  -- Get palette and apply overrides
  local palette = mod.palette
  palette = apply_overrides(palette, opts.overrides)

  -- Apply highlights
  highlights.apply(palette, {
    transparent = opts.transparent,
    italic_comments = opts.italic_comments,
  })

  -- Apply terminal colors
  terminal.apply(palette)

  -- Set colorscheme name LAST: highlights.apply() runs `highlight clear`,
  -- which resets vim.g.colors_name, so it must be set after that call.
  vim.g.colors_name = 'alchemists-orchid'

  applying = false
end

-- Setup function
function M.setup(config)
  -- Ignore the nested setup() call that Neovim triggers by re-sourcing
  -- colors/alchemists-orchid.vim when 'background' changes mid-apply; the
  -- in-progress apply_theme() already paints the correct palette.
  if applying then
    return
  end

  config = config or {}

  -- Merge with defaults
  local opts = vim.tbl_deep_extend('force', default_config, config)

  -- If persistence is enabled and no explicit mode given, try to load saved mode
  if opts.persist and config.mode == nil then
    local saved_mode = persistence.load({ path = opts.persist_path })
    if saved_mode and is_valid_mode(saved_mode) then
      opts.mode = saved_mode
    end
  end

  -- Store current config for later use
  current_config = opts

  -- Apply the theme
  apply_theme(opts)
end

-- Switch to a specific mode
function M.switch(mode)
  if not current_config then
    vim.notify('alchemists-orchid: Please call setup() first', vim.log.levels.WARN)
    return false
  end

  if not is_valid_mode(mode) then
    vim.notify(
      string.format('alchemists-orchid: Invalid mode "%s". Available: %s', mode, table.concat(available_modes, ', ')),
      vim.log.levels.ERROR
    )
    return false
  end

  -- Update mode in current config
  current_config.mode = mode

  -- Re-apply theme
  apply_theme(current_config)

  -- Persist if enabled
  if current_config.persist then
    persistence.save(mode, { path = current_config.persist_path })
  end

  vim.notify(string.format('alchemists-orchid: Switched to %s mode', mode), vim.log.levels.INFO)
  return true
end

-- Toggle/cycle through available modes
function M.toggle()
  if not current_config then
    vim.notify('alchemists-orchid: Please call setup() first', vim.log.levels.WARN)
    return nil
  end

  -- Find current mode index
  local current_index = 1
  for i, m in ipairs(available_modes) do
    if m == current_config.mode then
      current_index = i
      break
    end
  end

  -- Get next mode (cycle)
  local next_index = (current_index % #available_modes) + 1
  local next_mode = available_modes[next_index]

  -- Switch to next mode
  M.switch(next_mode)

  return next_mode
end

-- Get current mode
function M.get_mode()
  if current_config then
    return current_config.mode
  end
  return nil
end

-- Get list of available modes
function M.get_modes()
  return vim.deepcopy(available_modes)
end

-- Get current palette (useful for statusline integration)
function M.get_palette()
  if current_config then
    local palette = get_palette(current_config.mode)
    return apply_overrides(palette, current_config.overrides)
  end
  return dark_palette.palette
end

-- Backward compatibility: support old override syntax
function M.setup_legacy(config)
  if config and not config.mode and not config.transparent and not config.italic_comments then
    return M.setup({ overrides = config })
  else
    return M.setup(config)
  end
end

-- Export palette for external access (backward compatibility)
M.palette = dark_palette.palette

-- Export version information
M.version = version

return M
