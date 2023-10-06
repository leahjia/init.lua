vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

vim.keymap.set("n", "<leader>p", function()
    vim.cmd.Git('push')
end, opts)
-- vim.cmd[[packadd fugitive]]
-- vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', { noremap = true, silent = true })

