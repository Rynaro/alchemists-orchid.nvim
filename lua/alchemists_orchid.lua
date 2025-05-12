-- Alchemist's Orchid Neovim Theme

local M = {}

M.palette = {
  bg            = "#2E3440",
  fg            = "#E5E9F0",
  cursor        = "#C89BD0",
  black         = "#3B4252",
  red           = "#FF92D0",
  green         = "#A3BE8C",
  yellow        = "#EBCB8B",
  blue          = "#81A1C1",
  purple        = "#C89BD0",
  cyan          = "#8FBCBB",
  white         = "#E5E9F0",
  bright_black  = "#4C566A",
  bright_red    = "#FFB3DE",
  bright_green  = "#C3E4A8",
  bright_yellow = "#F5E27A",
  bright_blue   = "#A3C2E8",
  bright_purple = "#DAC0F2",
  bright_cyan   = "#9EECE8",
  bright_white  = "#ECEFF4",
}

function M.setup()
  -- clear existing highlights and set defaults
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.opt.termguicolors = true
  vim.opt.background    = "dark"
  vim.g.colors_name     = "alchemists_orchid"

  local c = M.palette

  -- Basic highlights
  vim.api.nvim_set_hl(0, "Normal",       { fg = c.fg, bg = c.bg })
  vim.api.nvim_set_hl(0, "CursorLine",   { bg = c.bright_black })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.purple, bold = true })
  vim.api.nvim_set_hl(0, "LineNr",       { fg = c.bright_black })
  vim.api.nvim_set_hl(0, "Visual",       { bg = c.bright_black })

  -- Syntax groups
  vim.api.nvim_set_hl(0, "Comment",     { fg = c.bright_black, italic = true })
  vim.api.nvim_set_hl(0, "Constant",    { fg = c.purple })
  vim.api.nvim_set_hl(0, "Identifier",  { fg = c.blue })
  vim.api.nvim_set_hl(0, "Statement",   { fg = c.red })
  vim.api.nvim_set_hl(0, "PreProc",     { fg = c.yellow })
  vim.api.nvim_set_hl(0, "Type",        { fg = c.green })
  vim.api.nvim_set_hl(0, "Special",     { fg = c.cyan })
  vim.api.nvim_set_hl(0, "Underlined",  { fg = c.blue, underline = true })
  vim.api.nvim_set_hl(0, "Todo",        { fg = c.yellow, bg = c.bright_blue, bold = true })

  -- Terminal colors
  vim.g.terminal_color_0  = c.black
  vim.g.terminal_color_1  = c.red
  vim.g.terminal_color_2  = c.green
  vim.g.terminal_color_3  = c.yellow
  vim.g.terminal_color_4  = c.blue
  vim.g.terminal_color_5  = c.purple
  vim.g.terminal_color_6  = c.cyan
  vim.g.terminal_color_7  = c.white
  vim.g.terminal_color_8  = c.bright_black
  vim.g.terminal_color_9  = c.bright_red
  vim.g.terminal_color_10 = c.bright_green
  vim.g.terminal_color_11 = c.bright_yellow
  vim.g.terminal_color_12 = c.bright_blue
  vim.g.terminal_color_13 = c.bright_purple
  vim.g.terminal_color_14 = c.bright_cyan
  vim.g.terminal_color_15 = c.bright_white
end

return M

