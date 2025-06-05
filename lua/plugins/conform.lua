return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
        require("conform").setup({
          format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
          },
          formatters_by_ft = {
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
          },
        })


        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = { "*.ts", "*.tsx" },
          --callback = function()
          --  vim.lsp.buf.format({ async = false })
          --end,
          callback = function(args)
            require("conform").format({ bufnr = args.buf })
          end,
        })
  end
}
