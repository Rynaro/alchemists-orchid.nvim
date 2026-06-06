-- Dark Mode Palette (v2)
-- Reduced saturation for halation prevention
-- Pink: 60% saturation, Purple: 36% saturation
-- WCAG AAA compliance: 10.26:1 contrast ratio

local M = {}

M.background = 'dark'

M.palette = {
  -- Base colors
  bg            = "#2E3440",
  fg            = "#E5E9F0",
  cursor        = "#D9A8DD",  -- Reduced saturation purple

  -- Standard terminal colors (base)
  black         = "#3B4252",
  red           = "#E8A4CC",  -- Pink with 60% saturation (reduced from #FF92D0)
  green         = "#A3BE8C",
  yellow        = "#DFCA9A",
  blue          = "#81A1C1",
  purple        = "#C89BD0",  -- Purple with 36% saturation (reduced from #C89BD0)
  cyan          = "#8FBCBB",
  white         = "#D8DEE9",

  -- Bright terminal colors
  bright_black  = "#4C566A",
  bright_red    = "#F0C0DD",  -- Brighter pink, still reduced saturation
  bright_green  = "#C3E4A8",
  bright_yellow = "#EBD9AF",
  bright_blue   = "#A3C2E8",
  bright_purple = "#DAC0F2",  -- Brighter purple, reduced saturation
  bright_cyan   = "#9EECE8",
  bright_white  = "#ECEFF4",

  -- Additional semantic colors
  comment       = "#4C566A",
  visual        = "#4C566A",
  cursorline    = "#3B4252",
  linenr        = "#4C566A",
  cursorlinenr  = "#D9A8DD",

  -- LSP diagnostics
  error         = "#E8A4CC",  -- Using reduced saturation pink
  warn          = "#DFCA9A",
  info          = "#81A1C1",
  hint          = "#8FBCBB",

  -- Search and selection
  search        = "#4C566A",
  incsearch     = "#D9A8DD",

  -- Diff
  diff_add      = "#A3BE8C",
  diff_delete   = "#E8A4CC",
  diff_change   = "#DFCA9A",
  diff_text     = "#81A1C1",
}

return M
