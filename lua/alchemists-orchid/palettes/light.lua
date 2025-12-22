-- Light Mode Palette (White Mode)
-- For users with dark-interface discomfort
-- WCAG AAA compliance: 12.06:1 contrast ratio
-- Inverted background/foreground relationship

local M = {}

M.palette = {
  -- Base colors (inverted from dark)
  bg            = "#FFFFFF",
  fg            = "#2E3440",
  cursor        = "#7A5A8A",  -- Darker purple for light background
  
  -- Standard terminal colors (base)
  black         = "#E5E9F0",
  red           = "#B85A7A",  -- Darker pink for light background
  green         = "#5C7A4C",
  yellow        = "#8B6A3B",
  blue          = "#4A6A8A",
  purple        = "#7A5A8A",  -- Darker purple for light background
  cyan          = "#4A7A7A",
  white         = "#2E3440",
  
  -- Bright terminal colors
  bright_black  = "#D0D4DA",
  bright_red    = "#C86A8A",  -- Slightly brighter but still dark
  bright_green  = "#6C8A5C",
  bright_yellow = "#9B7A4B",
  bright_blue   = "#5A7A9A",
  bright_purple = "#8A6A9A",
  bright_cyan   = "#5A8A8A",
  bright_white  = "#1A1E24",
  
  -- Additional semantic colors
  comment       = "#8A8E94",  -- Muted gray for comments
  visual        = "#E0E4EA",  -- Light selection background
  cursorline    = "#F5F5F5",  -- Very light cursor line
  linenr        = "#B0B4BA",
  cursorlinenr  = "#7A5A8A",  -- Darker purple
  
  -- LSP diagnostics
  error         = "#B85A7A",  -- Darker pink
  warn          = "#8B6A3B",  -- Darker yellow
  info          = "#4A6A8A",  -- Darker blue
  hint          = "#4A7A7A",  -- Darker cyan
  
  -- Search and selection
  search        = "#E0E4EA",
  incsearch     = "#D0B8E0",  -- Light purple highlight
  
  -- Diff
  diff_add      = "#D0E8C0",  -- Light green
  diff_delete   = "#F0C8D8",  -- Light pink
  diff_change   = "#F0E0B8",  -- Light yellow
  diff_text     = "#C8D8E8",  -- Light blue
}

return M
