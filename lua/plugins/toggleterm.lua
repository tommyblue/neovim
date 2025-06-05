return  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
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
    end
}
