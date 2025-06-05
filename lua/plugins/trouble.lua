return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  -- cmd = "Trouble",
  -- keys = {
  --   {
  --     "<leader>xx",
  --     "<cmd>Trouble diagnostics toggle<cr>",
  --     desc = "Diagnostics (Trouble)",
  --   },
  --   {
  --     "<leader>xX",
  --     "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  --     desc = "Buffer Diagnostics (Trouble)",
  --   },
  --   {
  --     "<leader>cs",
  --     "<cmd>Trouble symbols toggle focus=false<cr>",
  --     desc = "Symbols (Trouble)",
  --   },
  --   {
  --     "<leader>cl",
  --     "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  --     desc = "LSP Definitions / references / ... (Trouble)",
  --   },
  --   {
  --     "<leader>xL",
  --     "<cmd>Trouble loclist toggle<cr>",
  --     desc = "Location List (Trouble)",
  --   },
  --   {
  --     "<leader>xQ",
  --     "<cmd>Trouble qflist toggle<cr>",
  --     desc = "Quickfix List (Trouble)",
  --   },
  -- },
  config = function()
        -- trouble
        vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle("diagnostics") end, { desc = "Trouble Toggle" })
        vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Workspace Diagnostics" })
        vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = "Document Diagnostics" })
        vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Quickfix" })
        vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Loclist" })
        vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "LSP References" })
  end
}
