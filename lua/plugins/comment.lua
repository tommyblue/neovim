-- https://github.com/numToStr/Comment.nvim
return {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    config = function()
        require('Comment').setup()
        -- vim.keymap.set({'t','v'}, '<C-/>', 'gc')
        vim.keymap.set("v", "<C-_>", "<Plug>(comment_toggle_blockwise_visual)", { noremap = false, silent = true })
        vim.keymap.set("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", { noremap = false, silent = true })
    end
}

