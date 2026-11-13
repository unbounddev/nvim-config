-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
local gh = function(x) return 'https://github.com/' .. x end
local ghv = function(p, v) return { src = gh(p), version = v } end
vim.pack.add({
  gh('nvim-tree/nvim-web-devicons'),
  ghv('nvim-tree/nvim-tree.lua', 'v1.19.0'),
  gh('rafamadriz/friendly-snippets'),
  ghv('saghen/blink.cmp', 'v1.10.2'),
  ghv('folke/tokyonight.nvim', 'v4.14.1'),
  { src = gh('catppuccin/nvim'), version = 'v2.0.0', name = 'catppuccin' },
  gh('nvim-lualine/lualine.nvim'),
})

-- vim.cmd[[colorscheme tokyonight]]
vim.cmd.colorscheme "catppuccin-nvim"
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require('blink.cmp').setup({
  keymap = { 
    preset = 'default',
    ["<C-y>"] = { "select_and_accept" },
    ["<CR>"] = { "select_and_accept", "fallback" },
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
  },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = {
    documentation = { auto_show = true }
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer'}
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning"
  }
})

require('lualine').setup({
--  theme = 'tokyonight'
  theme = 'catppuccin-nvim'
})
