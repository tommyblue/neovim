vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.opt.number = true
-- vim.opt.relativenumber = true

require("config.lazy")
require("config.lualine")
-- https://github.com/williamboman/mason-lspconfig.nvim
--require("mason").setup()
--require("mason-lspconfig").setup()

require("catppuccin").setup({
    flavour = "frappe",
})

require("toggleterm").setup{
    direction = 'float',
    float_opts = {
        border = 'single', -- | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
        --width = <value>,
        --height = <value>,
        --row = <value>,
        --col = <value>,
        winblend = 3,
        --zindex = <value>,
        title_pos = 'center',
    },
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
}
vim.keymap.set({'n', 't'}, '<C-\\>', '<Cmd>ToggleTerm<CR>', { noremap = true, silent = true })

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
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
require('telescope').load_extension('fzf')


local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<C-b>', builtin.buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<C-p>', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<C-f>', builtin.live_grep, { noremap = true, silent = true })
--vim.keymap.set('n', '<leader>h', builtin.help_tags, { noremap = true, silent = true })

vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "References" })
vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "Definition" })
vim.keymap.set("n", "<C-space>", require("telescope.builtin").lsp_definitions, { desc = "Definition" })

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end,
-- })

-- vim.keymap.set("n", "<leader>f", function()
--   vim.lsp.buf.format({ async = true })
-- end, { desc = "Format code" })

require('lspconfig').ts_ls.setup({
  on_attach = function(client, bufnr)
    -- Usa la formattazione del LSP di tsserver
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = bufnr, noremap = true, silent = true })

    -- Disabilita la formattazione automatica se usi un altro formatter
    client.server_capabilities.documentFormattingProvider = true
  end,
})

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
        vim.lsp.buf.code_action({
          context = { only = { "source.removeUnused" }, diagnostics = {} },
          apply = true,
        })
      end,
    })
  end,
})


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

-- trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle("diagnostics") end, { desc = "Trouble Toggle" })
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Workspace Diagnostics" })
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = "Document Diagnostics" })
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Loclist" })
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "LSP References" })

