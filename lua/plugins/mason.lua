return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function ()
            local mason = require('mason')
            local mason_lspconfig = require('mason-lspconfig')
            mason.setup()
            mason_lspconfig.setup({
                ensure_installed = {
                    "html",
                    "gopls",
                    "ts_ls",
                }
            })

        -- require('lspconfig').ts_ls.setup({
        --   on_attach = function(client, bufnr)
        --     -- Usa la formattazione del LSP di tsserver
        --     vim.keymap.set('n', '<leader>f', function()
        --       vim.lsp.buf.format({ async = true })
        --     end, { buffer = bufnr, noremap = true, silent = true })
        --
        --     -- Disabilita la formattazione automatica se usi un altro formatter
        --     client.server_capabilities.documentFormattingProvider = true
        --   end,
        -- })

        end,
    }
}
