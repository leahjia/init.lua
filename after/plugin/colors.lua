require('onedark').setup({
    transparent = true
})

function Theme(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "#1E2127" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1E2127" })
end

Theme()
