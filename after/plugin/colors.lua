-- require('onedark').setup({
-- transparent = true,
-- })

require('catppuccin').setup({
    transparent_background = true,
})

require('rose-pine').setup({
    variant = 'dawn',
    -- styles = {
        -- transparency = true,
    -- }
})

local function get_system_appearance()
    local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
    local result = handle:read("*a")
    handle:close()

    if result:match("Dark") then
        return "dark"
    else
        return "light"
    end
end

function Theme(color)
    -- color = color or "catppuccin"
    local sys_appearance = get_system_appearance()

    if sys_appearance == 'light' then
        color = "rose-pine-dawn"
    else
        color = "catppuccin"
    end

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

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        Theme()
    end
})
