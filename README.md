# Alchemist’s Orchid.nvim

A pastel-infused colorscheme for Neovim that blends serene Arctic blues with soft purples and pinks—designed to evoke the crafting of a magical elixir in your editor.

---

## 🌟 Features

* **Multiple Palette Modes**: Dark, Light, and Sepia modes for different preferences and use cases
* **Accessibility First**: WCAG AAA compliant with reduced saturation for halation prevention
* **Arctic Inspiration**: Hints of cool, muted blues against a dark backdrop
* **Pastel Palette**: Emphasizes gentle pinks and purples for a soothing visual experience
* **True Color Support**: Requires `termguicolors` for full 24-bit color fidelity
* **Automatic Loader**: Ships with a `plugin/alchemists-orchid.lua` autoloader—no manual `:colorscheme` needed
* **Terminal Integration**: Includes terminal color definitions for Neovim’s integrated terminal.

---

## 🚀 Installation

Use your favorite plugin manager to install. Below are examples for **vim-plug**, **packer.nvim**, and **dein**.

### vim-plug (`init.vim`)

```vim
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Rynaro/alchemists-orchid.nvim'
call plug#end()
```

### packer.nvim (`init.lua`)

```lua
require('packer').startup(function()
  use 'Rynaro/alchemists-orchid.nvim'
end)
```

### dein (`init.vim`)

```vim
call dein#add('Rynaro/alchemists-orchid.nvim')
```

After installing, restart Neovim— the plugin’s autoloader will set `termguicolors`, apply the palette, and activate `alchemists-orchid` automatically.

---

## 🛠 Usage

### Minimal Configuration

No extra configuration is required. The plugin defaults to dark mode:

```lua
require('alchemists-orchid').setup()
vim.cmd('colorscheme alchemists-orchid')
```

### Switching Palette Modes

Choose from three palette modes:

**Dark Mode** (default):
```lua
require('alchemists-orchid').setup({
  mode = 'dark'
})
```

**Light Mode** (for users with dark-interface discomfort):
```lua
require('alchemists-orchid').setup({
  mode = 'light'
})
```

**Sepia Mode** (warm tones for extended coding sessions):
```lua
require('alchemists-orchid').setup({
  mode = 'sepia'
})
```

### Full Configuration

All configuration options:

```lua
require('alchemists-orchid').setup({
  mode = 'dark',              -- 'dark', 'light', or 'sepia'
  overrides = {               -- Optional color overrides
    pink = '#E8A4CC',
    purple = '#B89BC0',
  },
  transparent = false,        -- Transparent background
  italic_comments = true,     -- Italic comments (default: true)
})
vim.cmd('colorscheme alchemists-orchid')
```

### On-the-Fly Changes

To apply changes without restarting Neovim:

```vim
:lua require('alchemists-orchid').setup({ mode = 'light' })
```

---

## 🔄 Theme Switching

### Commands

Alchemists Orchid provides convenient commands for switching themes:

- `:AlchemistsOrchid` - Display current theme mode
- `:AlchemistsOrchid dark` - Switch to dark mode
- `:AlchemistsOrchid light` - Switch to light mode  
- `:AlchemistsOrchid sepia` - Switch to sepia mode
- `:AlchemistsOrchidToggle` - Cycle through modes (dark → light → sepia)

### Lua API

You can also switch themes programmatically:

```lua
local orchid = require('alchemists-orchid')

-- Switch to a specific mode
orchid.switch('dark')
orchid.switch('light')
orchid.switch('sepia')

-- Toggle/cycle through modes
orchid.toggle()

-- Get current mode
local mode = orchid.get_mode()

-- Get list of available modes
local modes = orchid.get_modes()  -- {'dark', 'light', 'sepia'}

-- Get current palette (useful for statusline integration)
local palette = orchid.get_palette()
```

### Keybindings

Example keybinding configuration:

```lua
-- Toggle theme mode with <leader>tt
vim.keymap.set('n', '<leader>tt', function()
  require('alchemists-orchid').toggle()
end, { desc = 'Toggle theme mode' })

-- Quick access to specific modes
vim.keymap.set('n', '<leader>td', function()
  require('alchemists-orchid').switch('dark')
end, { desc = 'Dark mode' })

vim.keymap.set('n', '<leader>tl', function()
  require('alchemists-orchid').switch('light')
end, { desc = 'Light mode' })

vim.keymap.set('n', '<leader>ts', function()
  require('alchemists-orchid').switch('sepia')
end, { desc = 'Sepia mode' })
```

---

## 💾 Theme Persistence

To persist your theme selection across Neovim sessions, enable the `persist` option:

```lua
require('alchemists-orchid').setup({
  persist = true,  -- Remember last selected theme
})
```

When `persist` is enabled:
- Theme preference is saved to `~/.cache/nvim/alchemists-orchid/theme.json`
- On startup, the saved theme is automatically loaded
- Calling `:AlchemistsOrchid <mode>` or `toggle()` updates the saved preference

### Custom Persistence Path

You can specify a custom path for the persistence file:

```lua
require('alchemists-orchid').setup({
  persist = true,
  persist_path = vim.fn.expand('~/.config/nvim/alchemists-orchid-theme.json'),
})
```

---

## 🎨 Palettes

### Dark Mode (Default)
WCAG AAA compliant (10.26:1 contrast ratio) with reduced saturation for halation prevention:
- Pink: 60% saturation
- Purple: 36% saturation

| Name       | Hex       |
| ---------- | --------- |
| Background | `#2E3440` |
| Foreground | `#E5E9F0` |
| Cursor     | `#B89BC0` |
| Pink       | `#E8A4CC` |
| Green      | `#A3BE8C` |
| Yellow     | `#EBCB8B` |
| Blue       | `#81A1C1` |
| Purple     | `#B89BC0` |
| Cyan       | `#8FBCBB` |

### Light Mode
WCAG AAA compliant (12.06:1 contrast ratio) for users with dark-interface discomfort.

### Sepia Mode
WCAG AAA compliant (11.05:1 contrast ratio) with warm tones and reduced blue content for extended coding sessions.

---

## ⚙️ Customization

### Color Overrides

You can override any palette color using the `overrides` option:

```lua
require('alchemists-orchid').setup({
  mode = 'dark',
  overrides = {
    pink = '#FFB3DE',
    purple = '#E5C1F9',
    bg = '#1E2228',
  }
})
vim.cmd('colorscheme alchemists-orchid')
```

### Transparent Background

Enable transparent background mode:

```lua
require('alchemists-orchid').setup({
  transparent = true
})
```

### Disable Italic Comments

If your terminal doesn't support italics:

```lua
require('alchemists-orchid').setup({
  italic_comments = false
})
```

### Backward Compatibility

The old override syntax still works for backward compatibility:

```lua
-- Old syntax (still supported)
require('alchemists-orchid').setup({ pink = '#ffb3de', purple = '#e5c1f9' })
```

---

## 🎯 Accessibility

Alchemist's Orchid is designed with accessibility in mind:

* **WCAG AAA Compliance**: All palette modes meet WCAG AAA contrast requirements
* **Halation Prevention**: Reduced saturation in dark mode (60% pink, 36% purple) to prevent halation for users with astigmatism
* **Color Blindness**: Colors are tested for accessibility across different types of color blindness
* **Multiple Modes**: Light and sepia modes provide alternatives for different visual needs

## 🤝 Contributing

Pull requests, issues, and feature requests are welcome. Feel free to:

* Submit alternative pastel variations
* Improve highlight coverage
* Report bugs or compatibility issues
* Suggest accessibility improvements

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

