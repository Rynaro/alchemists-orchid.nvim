-- Sepia Mode Palette (v2.0)
-- Warm cream background (#F5F0E6) for reduced blue-light, extended sessions
-- Light sepia variant per Alchemist's Orchid v2.0 canon
-- WCAG AAA compliance: 11.05:1 contrast ratio (fg/bg)

local M = {}

M.background = 'light'

M.palette = {
  -- Base colors (warm cream background)
  bg            = "#F5F0E6",
  fg            = "#3B3228",
  cursor        = "#A35BA3",

  -- Standard terminal colors (base)
  black         = "#3B3228",
  red           = "#B52080",
  green         = "#4A6A28",
  yellow        = "#806000",
  blue          = "#2E5E8A",
  purple        = "#7B3399",
  cyan          = "#1A6B69",
  white         = "#E5E0D6",

  -- Bright terminal colors
  bright_black  = "#5A5045",
  bright_red    = "#D42995",
  bright_green  = "#5C8432",
  bright_yellow = "#997300",
  bright_blue   = "#3972A8",
  bright_purple = "#9440B3",
  bright_cyan   = "#238280",
  bright_white  = "#F5F0E6",

  -- Additional semantic colors
  comment       = "#6E6253",  -- Warm muted gray (AA on #F5F0E6)
  visual        = "#E5DFD5",  -- Canonical selection background
  cursorline    = "#EDE7DA",
  linenr        = "#A89B85",
  cursorlinenr  = "#7B3399",  -- Purple, bold-readable

  -- LSP diagnostics
  error         = "#B52080",
  warn          = "#806000",
  info          = "#2E5E8A",
  hint          = "#1A6B69",

  -- Search and selection
  search        = "#E5DFD5",
  incsearch     = "#E9D9EC",  -- Light warm purple highlight

  -- Diff (used as foreground in highlights)
  diff_add      = "#4A6A28",
  diff_delete   = "#B52080",
  diff_change   = "#806000",
  diff_text     = "#2E5E8A",
}

return M
