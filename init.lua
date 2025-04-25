vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--vim.g.mapleader = '\\'

require("config.lazy")
require("config.lualine")
-- https://github.com/williamboman/mason-lspconfig.nvim
--require("mason").setup()
--require("mason-lspconfig").setup()

-- https://github.com/nvim-tree/nvim-tree.lua
vim.opt.termguicolors = true
require("nvim-tree").setup()

require('Comment').setup()
-- telescope
--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
--vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<C-b>', builtin.buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<C-p>', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<C-f>', builtin.live_grep, { noremap = true, silent = true })
--vim.keymap.set('n', '<leader>h', builtin.help_tags, { noremap = true, silent = true })

vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
