local status, lualine = pcall(require, "lualine")
if not status then
	return
end

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

local function get_lualine_theme()
    local sys_appearance = get_system_appearance()
    if sys_appearance == 'light' then
        return 'ayu_light'
    else
        return 'ayu_dark'
    end
end

lualine.setup({
	options = {
		icons_enabled = true,
		-- theme = "ayu_dark",
        theme = get_lualine_theme(),
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        lualine.setup({ options = { theme = get_lualine_theme() } })
    end
})

