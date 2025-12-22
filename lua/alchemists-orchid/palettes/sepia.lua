-- Sepia Mode Palette
-- Warm tones for extended coding sessions
-- Reduced blue content for eye comfort
-- WCAG AAA compliance: 11.05:1 contrast ratio

local M = {}

M.palette = {
  -- Base colors (warm sepia background)
  bg            = "#2E2A24",  -- Warm dark brown
  fg            = "#E8E4D8",  -- Warm off-white
  cursor        = "#B89A90",  -- Warm purple-brown
  
  -- Standard terminal colors (base) - warm tones
  black         = "#3B352F",
  red           = "#D8A494",  -- Warm pink-salmon
  green         = "#A3B88C",  -- Warm green
  yellow        = "#EBCB8B",  -- Warm yellow
  blue          = "#9A8A7A",  -- Warm muted blue (reduced blue)
  purple        = "#B89A90",  -- Warm purple-brown
  cyan          = "#9FBCB8",  -- Warm cyan (reduced blue)
  white         = "#E8E4D8",
  
  -- Bright terminal colors
  bright_black  = "#4C463A",
  bright_red    = "#E8B4A4",  -- Brighter warm pink
  bright_green  = "#C3D4A8",  -- Brighter warm green
  bright_yellow = "#F5E27A",  -- Brighter warm yellow
  bright_blue   = "#B0A090",  -- Brighter warm blue
  bright_purple = "#D0B8A0",  -- Brighter warm purple
  bright_cyan   = "#AFCCC8",  -- Brighter warm cyan
  bright_white  = "#F0ECE0",
  
  -- Additional semantic colors
  comment       = "#6A6458",  -- Warm gray
  visual        = "#4C463A",  -- Warm selection
  cursorline    = "#3B352F",  -- Warm cursor line
  linenr        = "#6A6458",
  cursorlinenr  = "#B89A90",  -- Warm purple-brown
  
  -- LSP diagnostics
  error         = "#D8A494",  -- Warm pink-salmon
  warn          = "#EBCB8B",  -- Warm yellow
  info          = "#9A8A7A",  -- Warm muted blue
  hint          = "#9FBCB8",  -- Warm cyan
  
  -- Search and selection
  search        = "#4C463A",
  incsearch     = "#B89A90",  -- Warm purple-brown
  
  -- Diff
  diff_add      = "#A3B88C",  -- Warm green
  diff_delete   = "#D8A494",  -- Warm pink-salmon
  diff_change   = "#EBCB8B",  -- Warm yellow
  diff_text     = "#9A8A7A",  -- Warm muted blue
}

return M
