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
        end,
    }
}
