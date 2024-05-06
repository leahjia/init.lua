vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<Tab>")', { silent = true, expr = true })

-- vim.g.copilot_filetypes = {
    -- ["java"] = false,
    -- ["rust"] = false,
    -- ["python"] = false,
    -- }


vim.api.nvim_create_user_command(
    'ToggleCopilot',
    function()
        local copilot_enabled = vim.g.copilot_enabled or false
        vim.g.copilot_enabled = not copilot_enabled
        print("Copilot: " .. tostring(vim.g.copilot_enabled))

        vim.g.copilot_filetypes = { ["*"] = vim.g.copilot_enabled }
    end,
    {}
)

