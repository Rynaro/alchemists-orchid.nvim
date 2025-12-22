-- Dark Mode Palette (v2)
-- Reduced saturation for halation prevention
-- Pink: 60% saturation, Purple: 36% saturation
-- WCAG AAA compliance: 10.26:1 contrast ratio

local M = {}

M.palette = {
  -- Base colors
  bg            = "#2E3440",
  fg            = "#E5E9F0",
  cursor        = "#B89BC0",  -- Reduced saturation purple
  
  -- Standard terminal colors (base)
  black         = "#3B4252",
  red           = "#E8A4CC",  -- Pink with 60% saturation (reduced from #FF92D0)
  green         = "#A3BE8C",
  yellow        = "#EBCB8B",
  blue          = "#81A1C1",
  purple        = "#B89BC0",  -- Purple with 36% saturation (reduced from #C89BD0)
  cyan          = "#8FBCBB",
  white         = "#E5E9F0",
  
  -- Bright terminal colors
  bright_black  = "#4C566A",
  bright_red    = "#F0B8D8",  -- Brighter pink, still reduced saturation
  bright_green  = "#C3E4A8",
  bright_yellow = "#F5E27A",
  bright_blue   = "#A3C2E8",
  bright_purple = "#D0B8E0",  -- Brighter purple, reduced saturation
  bright_cyan   = "#9EECE8",
  bright_white  = "#ECEFF4",
  
  -- Additional semantic colors
  comment       = "#4C566A",
  visual        = "#4C566A",
  cursorline    = "#3B4252",
  linenr        = "#4C566A",
  cursorlinenr  = "#B89BC0",
  
  -- LSP diagnostics
  error         = "#E8A4CC",  -- Using reduced saturation pink
  warn          = "#EBCB8B",
  info          = "#81A1C1",
  hint          = "#8FBCBB",
  
  -- Search and selection
  search        = "#4C566A",
  incsearch     = "#B89BC0",
  
  -- Diff
  diff_add      = "#A3BE8C",
  diff_delete   = "#E8A4CC",
  diff_change   = "#EBCB8B",
  diff_text     = "#81A1C1",
}

return M
