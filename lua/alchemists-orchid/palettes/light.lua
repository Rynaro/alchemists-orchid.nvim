-- Light / White Mode Palette (v2.0)
-- Astigmatism-optimized: off-white background (#FAFBFC, not pure white)
-- Vivid dark accents for halation-free readability on a light surface
-- WCAG AAA compliance: 12.06:1 contrast ratio (fg/bg)

local M = {}

M.background = 'light'

M.palette = {
  -- Base colors
  bg            = "#FAFBFC",
  fg            = "#2E3440",
  cursor        = "#B266B2",

  -- Standard terminal colors (base)
  black         = "#2E3440",
  red           = "#C41585",
  green         = "#4D7028",
  yellow        = "#8A6000",
  blue          = "#2D6299",
  purple        = "#8839AA",
  cyan          = "#1D7A78",
  white         = "#E5E9F0",

  -- Bright terminal colors
  bright_black  = "#4C566A",
  bright_red    = "#E31C97",
  bright_green  = "#5E8A32",
  bright_yellow = "#A57800",
  bright_blue   = "#3A7AB8",
  bright_purple = "#9F47C4",
  bright_cyan   = "#248E8B",
  bright_white  = "#FAFBFC",

  -- Additional semantic colors
  comment       = "#6B7280",  -- Muted slate gray (AA on #FAFBFC)
  visual        = "#D8DEE9",  -- Canonical selection background
  cursorline    = "#EFF1F5",
  linenr        = "#A8ADB5",
  cursorlinenr  = "#8839AA",  -- Purple, bold-readable

  -- LSP diagnostics
  error         = "#C41585",
  warn          = "#8A6000",
  info          = "#2D6299",
  hint          = "#1D7A78",

  -- Search and selection
  search        = "#D8DEE9",
  incsearch     = "#E8D5EE",  -- Light purple highlight

  -- Diff (used as foreground in highlights)
  diff_add      = "#4D7028",
  diff_delete   = "#C41585",
  diff_change   = "#8A6000",
  diff_text     = "#2D6299",
}

return M
