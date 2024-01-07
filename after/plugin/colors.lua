-- require('onedark').setup({
    -- transparent = true,
-- })

require('catppuccin').setup({
    transparent_background = true,
})

function Theme(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)
    vim.cmd('highlight ColorColumn ctermbg=10 guibg=#5b95b5')
    -- vim.api.nvim_set_hl(0, "Normal", { bg = nil })
    -- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = nil })
    -- vim.api.nvim_set_hl(0, "LineNr", { bg = nil })
    -- vim.api.nvim_set_hl(0, "SignColumn", { bg = nil })
    -- vim.api.nvim_set_hl(0, "CursorLineNr", { bg = nil })
    -- vim.api.nvim_set_hl(0, "Visual", { bg = "#3c3f41" })
end

Theme()
