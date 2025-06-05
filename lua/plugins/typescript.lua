return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig"
  },
  opts = {},
  config = function()
        require("typescript-tools").setup({
          on_attach = function(client, bufnr)
            local function organize_imports()
              vim.lsp.buf.execute_command({
                command = "_typescript.organizeImports",
                arguments = { vim.api.nvim_buf_get_name(0) },
                title = ""
              })
            end

            -- Auto-command per ordinare import e rimuovere gli inutilizzati
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                organize_imports()
                -- vim.lsp.buf.code_action({
                --   context = { only = { "source.removeUnused" }, diagnostics = {} },
                --   apply = true,
                -- })
              end,
            })
          end,
        })
  end
}
