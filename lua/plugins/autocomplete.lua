return {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    config = function()
        -- autocomplete
        local cmp = require("cmp")
        cmp.setup({
          mapping = cmp.mapping.preset.insert({
            ['<Tab>'] = cmp.mapping.select_next_item(),
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
          }),
          sources = {
            { name = "nvim_lsp" },
          },
        })
    end
}
