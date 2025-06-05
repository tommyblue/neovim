vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.opt.number = true

require("config.lazy")

require('Comment').setup()

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end,
-- })

-- vim.keymap.set("n", "<leader>f", function()
--   vim.lsp.buf.format({ async = true })
-- end, { desc = "Format code" })

