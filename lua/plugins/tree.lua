return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
        --require("nvim-tree").setup {}
        -- https://github.com/nvim-tree/nvim-tree.lua
        vim.opt.termguicolors = true
        require("nvim-tree").setup()

        vim.keymap.set('n', '<Leader>b', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
  }
