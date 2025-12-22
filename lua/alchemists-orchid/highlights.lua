-- Highlights Module
-- Comprehensive highlight groups for all editor components
-- Mode-agnostic: accepts palette as parameter

local M = {}

function M.apply(palette, config)
  config = config or {}
  local transparent = config.transparent or false
  local italic_comments = config.italic_comments ~= false  -- Default to true
  
  local c = palette
  
  -- Clear existing highlights
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  
  local bg = transparent and "NONE" or c.bg
  
  -- Core editor highlights
  vim.api.nvim_set_hl(0, "Normal",       { fg = c.fg, bg = bg })
  vim.api.nvim_set_hl(0, "NormalFloat",  { fg = c.fg, bg = c.bg })
  vim.api.nvim_set_hl(0, "NormalNC",     { fg = c.fg, bg = bg })
  
  -- Cursor and line numbers
  vim.api.nvim_set_hl(0, "Cursor",       { fg = c.bg, bg = c.cursor })
  vim.api.nvim_set_hl(0, "CursorLine",   { bg = c.cursorline })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.cursorlinenr, bold = true })
  vim.api.nvim_set_hl(0, "LineNr",       { fg = c.linenr })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = c.cursorline })
  
  -- Visual selection
  vim.api.nvim_set_hl(0, "Visual",       { bg = c.visual })
  vim.api.nvim_set_hl(0, "VisualNOS",    { bg = c.visual })
  
  -- Search
  vim.api.nvim_set_hl(0, "Search",       { bg = c.search })
  vim.api.nvim_set_hl(0, "IncSearch",    { bg = c.incsearch })
  vim.api.nvim_set_hl(0, "CurSearch",    { bg = c.incsearch })
  
  -- Status line
  vim.api.nvim_set_hl(0, "StatusLine",   { fg = c.fg, bg = c.bright_black })
  vim.api.nvim_set_hl(0, "StatusLineNC", { fg = c.comment, bg = c.bright_black })
  vim.api.nvim_set_hl(0, "StatusLineTerm", { fg = c.fg, bg = c.bright_black })
  vim.api.nvim_set_hl(0, "StatusLineTermNC", { fg = c.comment, bg = c.bright_black })
  
  -- Tab line
  vim.api.nvim_set_hl(0, "TabLine",     { fg = c.comment, bg = c.bright_black })
  vim.api.nvim_set_hl(0, "TabLineFill", { bg = c.bg })
  vim.api.nvim_set_hl(0, "TabLineSel",  { fg = c.fg, bg = c.bg, bold = true })
  
  -- Window splits
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = c.bright_black })
  vim.api.nvim_set_hl(0, "VertSplit",   { fg = c.bright_black })
  
  -- Syntax groups
  local comment_style = italic_comments and { italic = true } or {}
  vim.api.nvim_set_hl(0, "Comment",     { fg = c.comment, italic = italic_comments })
  vim.api.nvim_set_hl(0, "Constant",    { fg = c.purple })
  vim.api.nvim_set_hl(0, "String",      { fg = c.green })
  vim.api.nvim_set_hl(0, "Character",   { fg = c.green })
  vim.api.nvim_set_hl(0, "Number",      { fg = c.purple })
  vim.api.nvim_set_hl(0, "Boolean",     { fg = c.purple })
  vim.api.nvim_set_hl(0, "Float",       { fg = c.purple })
  
  vim.api.nvim_set_hl(0, "Identifier",  { fg = c.blue })
  vim.api.nvim_set_hl(0, "Function",    { fg = c.blue })
  
  vim.api.nvim_set_hl(0, "Statement",   { fg = c.red })
  vim.api.nvim_set_hl(0, "Conditional", { fg = c.red })
  vim.api.nvim_set_hl(0, "Repeat",      { fg = c.red })
  vim.api.nvim_set_hl(0, "Label",       { fg = c.red })
  vim.api.nvim_set_hl(0, "Operator",    { fg = c.red })
  vim.api.nvim_set_hl(0, "Keyword",     { fg = c.red })
  vim.api.nvim_set_hl(0, "Exception",   { fg = c.red })
  
  vim.api.nvim_set_hl(0, "PreProc",     { fg = c.yellow })
  vim.api.nvim_set_hl(0, "Include",     { fg = c.yellow })
  vim.api.nvim_set_hl(0, "Define",      { fg = c.yellow })
  vim.api.nvim_set_hl(0, "Macro",       { fg = c.yellow })
  vim.api.nvim_set_hl(0, "PreCondit",   { fg = c.yellow })
  
  vim.api.nvim_set_hl(0, "Type",        { fg = c.green })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = c.green })
  vim.api.nvim_set_hl(0, "Structure",   { fg = c.green })
  vim.api.nvim_set_hl(0, "Typedef",     { fg = c.green })
  
  vim.api.nvim_set_hl(0, "Special",     { fg = c.cyan })
  vim.api.nvim_set_hl(0, "SpecialChar", { fg = c.cyan })
  vim.api.nvim_set_hl(0, "Tag",         { fg = c.cyan })
  vim.api.nvim_set_hl(0, "Delimiter",   { fg = c.cyan })
  vim.api.nvim_set_hl(0, "SpecialComment", { fg = c.cyan })
  vim.api.nvim_set_hl(0, "Debug",       { fg = c.cyan })
  
  vim.api.nvim_set_hl(0, "Underlined",  { fg = c.blue, underline = true })
  vim.api.nvim_set_hl(0, "Bold",        { bold = true })
  vim.api.nvim_set_hl(0, "Italic",      { italic = true })
  
  vim.api.nvim_set_hl(0, "Error",       { fg = c.error })
  vim.api.nvim_set_hl(0, "Todo",        { fg = c.yellow, bg = c.bright_blue, bold = true })
  vim.api.nvim_set_hl(0, "WarningMsg",  { fg = c.warn })
  vim.api.nvim_set_hl(0, "ErrorMsg",    { fg = c.error })
  
  -- LSP diagnostics
  vim.api.nvim_set_hl(0, "DiagnosticError",       { fg = c.error })
  vim.api.nvim_set_hl(0, "DiagnosticWarn",        { fg = c.warn })
  vim.api.nvim_set_hl(0, "DiagnosticInfo",        { fg = c.info })
  vim.api.nvim_set_hl(0, "DiagnosticHint",        { fg = c.hint })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { sp = c.error, undercurl = true })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { sp = c.warn, undercurl = true })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",  { sp = c.info, undercurl = true })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",  { sp = c.hint, undercurl = true })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = c.error })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn",  { fg = c.warn })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo",  { fg = c.info })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint",  { fg = c.hint })
  vim.api.nvim_set_hl(0, "DiagnosticSignError",   { fg = c.error })
  vim.api.nvim_set_hl(0, "DiagnosticSignWarn",    { fg = c.warn })
  vim.api.nvim_set_hl(0, "DiagnosticSignInfo",    { fg = c.info })
  vim.api.nvim_set_hl(0, "DiagnosticSignHint",    { fg = c.hint })
  vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { fg = c.error })
  vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn",  { fg = c.warn })
  vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo",  { fg = c.info })
  vim.api.nvim_set_hl(0, "DiagnosticFloatingHint",  { fg = c.hint })
  
  -- Tree-sitter syntax groups
  vim.api.nvim_set_hl(0, "@comment",         { fg = c.comment, italic = italic_comments })
  vim.api.nvim_set_hl(0, "@constant",        { fg = c.purple })
  vim.api.nvim_set_hl(0, "@constant.builtin", { fg = c.purple })
  vim.api.nvim_set_hl(0, "@constant.macro",  { fg = c.purple })
  vim.api.nvim_set_hl(0, "@string",          { fg = c.green })
  vim.api.nvim_set_hl(0, "@string.regex",    { fg = c.cyan })
  vim.api.nvim_set_hl(0, "@string.escape",   { fg = c.cyan })
  vim.api.nvim_set_hl(0, "@number",          { fg = c.purple })
  vim.api.nvim_set_hl(0, "@boolean",         { fg = c.purple })
  vim.api.nvim_set_hl(0, "@function",        { fg = c.blue })
  vim.api.nvim_set_hl(0, "@function.builtin", { fg = c.blue })
  vim.api.nvim_set_hl(0, "@function.macro",  { fg = c.blue })
  vim.api.nvim_set_hl(0, "@method",          { fg = c.blue })
  vim.api.nvim_set_hl(0, "@constructor",     { fg = c.blue })
  vim.api.nvim_set_hl(0, "@parameter",      { fg = c.fg })
  vim.api.nvim_set_hl(0, "@keyword",         { fg = c.red })
  vim.api.nvim_set_hl(0, "@keyword.function", { fg = c.red })
  vim.api.nvim_set_hl(0, "@keyword.operator", { fg = c.red })
  vim.api.nvim_set_hl(0, "@keyword.return",  { fg = c.red })
  vim.api.nvim_set_hl(0, "@conditional",     { fg = c.red })
  vim.api.nvim_set_hl(0, "@repeat",          { fg = c.red })
  vim.api.nvim_set_hl(0, "@exception",       { fg = c.red })
  vim.api.nvim_set_hl(0, "@operator",        { fg = c.red })
  vim.api.nvim_set_hl(0, "@type",            { fg = c.green })
  vim.api.nvim_set_hl(0, "@type.builtin",    { fg = c.green })
  vim.api.nvim_set_hl(0, "@type.definition", { fg = c.green })
  vim.api.nvim_set_hl(0, "@storageclass",    { fg = c.green })
  vim.api.nvim_set_hl(0, "@structure",      { fg = c.green })
  vim.api.nvim_set_hl(0, "@namespace",      { fg = c.yellow })
  vim.api.nvim_set_hl(0, "@include",        { fg = c.yellow })
  vim.api.nvim_set_hl(0, "@preproc",        { fg = c.yellow })
  vim.api.nvim_set_hl(0, "@define",         { fg = c.yellow })
  vim.api.nvim_set_hl(0, "@macro",          { fg = c.yellow })
  vim.api.nvim_set_hl(0, "@variable",       { fg = c.fg })
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = c.blue })
  vim.api.nvim_set_hl(0, "@property",       { fg = c.fg })
  vim.api.nvim_set_hl(0, "@field",          { fg = c.fg })
  vim.api.nvim_set_hl(0, "@punctuation",    { fg = c.cyan })
  vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = c.cyan })
  vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = c.cyan })
  vim.api.nvim_set_hl(0, "@punctuation.special", { fg = c.cyan })
  vim.api.nvim_set_hl(0, "@tag",            { fg = c.cyan })
  vim.api.nvim_set_hl(0, "@tag.delimiter",  { fg = c.cyan })
  vim.api.nvim_set_hl(0, "@text",           { fg = c.fg })
  vim.api.nvim_set_hl(0, "@text.strong",    { fg = c.fg, bold = true })
  vim.api.nvim_set_hl(0, "@text.emphasis",  { fg = c.fg, italic = true })
  vim.api.nvim_set_hl(0, "@text.underline", { fg = c.blue, underline = true })
  vim.api.nvim_set_hl(0, "@text.strike",    { strikethrough = true })
  vim.api.nvim_set_hl(0, "@text.title",     { fg = c.blue, bold = true })
  vim.api.nvim_set_hl(0, "@text.literal",   { fg = c.green })
  vim.api.nvim_set_hl(0, "@text.uri",       { fg = c.blue, underline = true })
  vim.api.nvim_set_hl(0, "@text.math",      { fg = c.purple })
  vim.api.nvim_set_hl(0, "@text.reference", { fg = c.blue })
  vim.api.nvim_set_hl(0, "@text.environment", { fg = c.yellow })
  vim.api.nvim_set_hl(0, "@text.environment.name", { fg = c.yellow })
  vim.api.nvim_set_hl(0, "@text.note",      { fg = c.info })
  vim.api.nvim_set_hl(0, "@text.warning",   { fg = c.warn })
  vim.api.nvim_set_hl(0, "@text.danger",    { fg = c.error })
  vim.api.nvim_set_hl(0, "@text.diff.add",  { fg = c.diff_add })
  vim.api.nvim_set_hl(0, "@text.diff.delete", { fg = c.diff_delete })
  
  -- Diff
  vim.api.nvim_set_hl(0, "DiffAdd",         { fg = c.diff_add })
  vim.api.nvim_set_hl(0, "DiffDelete",      { fg = c.diff_delete })
  vim.api.nvim_set_hl(0, "DiffChange",      { fg = c.diff_change })
  vim.api.nvim_set_hl(0, "DiffText",        { fg = c.diff_text })
  
  -- Git signs
  vim.api.nvim_set_hl(0, "GitSignsAdd",     { fg = c.diff_add })
  vim.api.nvim_set_hl(0, "GitSignsChange",  { fg = c.diff_change })
  vim.api.nvim_set_hl(0, "GitSignsDelete",  { fg = c.diff_delete })
  vim.api.nvim_set_hl(0, "GitSignsAddNr",   { fg = c.diff_add })
  vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = c.diff_change })
  vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = c.diff_delete })
  vim.api.nvim_set_hl(0, "GitSignsAddLn",   { bg = c.diff_add })
  vim.api.nvim_set_hl(0, "GitSignsChangeLn", { bg = c.diff_change })
  vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { bg = c.diff_delete })
  
  -- Telescope
  vim.api.nvim_set_hl(0, "TelescopeNormal",         { fg = c.fg, bg = c.bg })
  vim.api.nvim_set_hl(0, "TelescopeBorder",          { fg = c.bright_black })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder",   { fg = c.bright_black })
  vim.api.nvim_set_hl(0, "TelescopeResultsBorder",  { fg = c.bright_black })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder",  { fg = c.bright_black })
  vim.api.nvim_set_hl(0, "TelescopePromptNormal",   { fg = c.fg, bg = c.bg })
  vim.api.nvim_set_hl(0, "TelescopePromptPrefix",   { fg = c.purple })
  vim.api.nvim_set_hl(0, "TelescopeSelection",      { bg = c.visual })
  vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = c.purple })
  vim.api.nvim_set_hl(0, "TelescopeMatching",       { fg = c.purple })
  vim.api.nvim_set_hl(0, "TelescopePreviewTitle",   { fg = c.purple })
  vim.api.nvim_set_hl(0, "TelescopePromptTitle",    { fg = c.purple })
  vim.api.nvim_set_hl(0, "TelescopeResultsTitle",   { fg = c.purple })
  
  -- NvimTree
  vim.api.nvim_set_hl(0, "NvimTreeNormal",          { fg = c.fg, bg = bg })
  vim.api.nvim_set_hl(0, "NvimTreeNormalNC",        { fg = c.fg, bg = bg })
  vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer",     { fg = c.bg })
  vim.api.nvim_set_hl(0, "NvimTreeRootFolder",      { fg = c.purple, bold = true })
  vim.api.nvim_set_hl(0, "NvimTreeFolderIcon",      { fg = c.blue })
  vim.api.nvim_set_hl(0, "NvimTreeFolderName",      { fg = c.blue })
  vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = c.blue, bold = true })
  vim.api.nvim_set_hl(0, "NvimTreeClosedFolderName", { fg = c.blue })
  vim.api.nvim_set_hl(0, "NvimTreeExecFile",        { fg = c.green })
  vim.api.nvim_set_hl(0, "NvimTreeOpenedFile",      { fg = c.fg })
  vim.api.nvim_set_hl(0, "NvimTreeSpecialFile",     { fg = c.yellow })
  vim.api.nvim_set_hl(0, "NvimTreeImageFile",       { fg = c.purple })
  vim.api.nvim_set_hl(0, "NvimTreeGitNew",          { fg = c.diff_add })
  vim.api.nvim_set_hl(0, "NvimTreeGitDirty",        { fg = c.diff_change })
  vim.api.nvim_set_hl(0, "NvimTreeGitDeleted",      { fg = c.diff_delete })
  vim.api.nvim_set_hl(0, "NvimTreeGitIgnored",      { fg = c.comment })
  vim.api.nvim_set_hl(0, "NvimTreeIndentMarker",    { fg = c.bright_black })
  vim.api.nvim_set_hl(0, "NvimTreeWindowPicker",    { fg = c.purple, bg = c.visual })
  
  -- Lualine
  vim.api.nvim_set_hl(0, "LualineNormal",          { fg = c.fg, bg = c.bright_black })
  vim.api.nvim_set_hl(0, "LualineInsert",          { fg = c.green, bg = c.bright_black })
  vim.api.nvim_set_hl(0, "LualineVisual",          { fg = c.purple, bg = c.bright_black })
  vim.api.nvim_set_hl(0, "LualineReplace",         { fg = c.red, bg = c.bright_black })
  vim.api.nvim_set_hl(0, "LualineCommand",         { fg = c.yellow, bg = c.bright_black })
  vim.api.nvim_set_hl(0, "LualineInactive",        { fg = c.comment, bg = c.bright_black })
  
  -- Popup menu
  vim.api.nvim_set_hl(0, "Pmenu",                  { fg = c.fg, bg = c.bright_black })
  vim.api.nvim_set_hl(0, "PmenuSel",               { fg = c.bg, bg = c.purple })
  vim.api.nvim_set_hl(0, "PmenuSbar",              { bg = c.bright_black })
  vim.api.nvim_set_hl(0, "PmenuThumb",             { bg = c.comment })
  
  -- Quickfix
  vim.api.nvim_set_hl(0, "QuickFixLine",           { bg = c.visual })
  vim.api.nvim_set_hl(0, "qfFileName",             { fg = c.blue })
  vim.api.nvim_set_hl(0, "qfLineNr",               { fg = c.purple })
  
  -- Sign column
  vim.api.nvim_set_hl(0, "SignColumn",             { bg = bg })
  vim.api.nvim_set_hl(0, "FoldColumn",             { fg = c.comment, bg = bg })
  
  -- Folding
  vim.api.nvim_set_hl(0, "Folded",                 { fg = c.comment, bg = c.bright_black })
  vim.api.nvim_set_hl(0, "FoldColumn",             { fg = c.comment, bg = bg })
  
  -- Non-text
  vim.api.nvim_set_hl(0, "NonText",                { fg = c.bright_black })
  vim.api.nvim_set_hl(0, "Whitespace",             { fg = c.bright_black })
  vim.api.nvim_set_hl(0, "SpecialKey",             { fg = c.bright_black })
  
  -- Match parenthesis
  vim.api.nvim_set_hl(0, "MatchParen",              { fg = c.purple, bold = true })
  
  -- Conceal
  vim.api.nvim_set_hl(0, "Conceal",                 { fg = c.comment })
  
  -- Spell
  vim.api.nvim_set_hl(0, "SpellBad",                { sp = c.error, undercurl = true })
  vim.api.nvim_set_hl(0, "SpellCap",                { sp = c.warn, undercurl = true })
  vim.api.nvim_set_hl(0, "SpellRare",               { sp = c.info, undercurl = true })
  vim.api.nvim_set_hl(0, "SpellLocal",              { sp = c.hint, undercurl = true })
  
  -- Wild menu
  vim.api.nvim_set_hl(0, "WildMenu",                { fg = c.bg, bg = c.purple })
  
  -- Question
  vim.api.nvim_set_hl(0, "Question",                { fg = c.blue })
  
  -- MoreMsg
  vim.api.nvim_set_hl(0, "MoreMsg",                 { fg = c.blue })
  
  -- ModeMsg
  vim.api.nvim_set_hl(0, "ModeMsg",                 { fg = c.fg })
  
  -- Directory
  vim.api.nvim_set_hl(0, "Directory",               { fg = c.blue })
  
  -- Title
  vim.api.nvim_set_hl(0, "Title",                   { fg = c.blue, bold = true })
end

return M
