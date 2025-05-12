# Alchemist’s Orchid.nvim

A pastel-infused colorscheme for Neovim that blends serene Arctic blues with soft purples and pinks—designed to evoke the crafting of a magical elixir in your editor.

---

## 🌟 Features

* **Arctic Inspiration**: Hints of cool, muted blues against a dark backdrop.
* **Pastel Palette**: Emphasizes gentle pinks and purples for a soothing visual experience.
* **True Color Support**: Requires `termguicolors` for full 24-bit color fidelity.
* **Automatic Loader**: Ships with a `plugin/alchemists-orchid.lua` autoloader—no manual `:colorscheme` needed.
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

No extra configuration is required. However, if you prefer manual control:

1. Ensure true colors are enabled:

   ```vim
   set termguicolors
   ```

2. In your config (or via `:lua`):

   ```lua
   require('alchemists-orchid').setup()
   vim.cmd('colorscheme alchemists-orchid')
   ```

3. (Optional) To apply on-the-fly without restart:

   ```vim
   :lua require('alchemists-orchid').setup()
   ```


## 🎨 Palette

| Name       | Hex       |
| ---------- | --------- |
| Background | `#2E3440` |
| Foreground | `#E5E9F0` |
| Cursor     | `#C89BD0` |
| Pink       | `#FF92D0` |
| Green      | `#A3BE8C` |
| Yellow     | `#EBCB8B` |
| Blue       | `#81A1C1` |
| Purple     | `#C89BD0` |
| Cyan       | `#8FBCBB` |

---

## ⚙️ Customization

You can override any highlight group or color by calling `require('alchemists-orchid').setup()` with a custom palette table before applying:

```lua
require('alchemists-orchid').setup({ pink = '#ffb3de', purple = '#e5c1f9' })
vim.cmd('colorscheme alchemists-orchid')
```

---

## 🤝 Contributing

Pull requests, issues, and feature requests are welcome. Feel free to:

* Submit alternative pastel variations.
* Improve highlight coverage.
* Report bugs or compatibility issues.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

