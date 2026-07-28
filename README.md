# Lite Neovim config
This repository contains a minimalist config for Neovim. It's main goal is to be lighter than LazyVim, yet have a VSCode-ish feel to it.

## Structure
`init.lua` - main entry point for neovim
`/lua` - contains your profiles with plugins (e.g. /lite)
`/lua/lite` - the default profile `init.lua` loads
`/lite/config` - base config files for keymaps, editor options, lazy plugin manager
`/lite/plugins` - specify plugins here and their configuration, dependencies etc.
`/lite/init.lua` - setups modules from `/config` and inits lazy that pulls plugins from `/plugins`

## Plugins
- autopairs
- bufferline
- colors (gruvbox, rose-pine, tokyonight)
- gitsigns
- lsp (mason, lspconfig, cmp, fidget)
- lualine
- neotree
- noice
- telescope
- treesitter
- trouble
