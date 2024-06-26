vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>c", "maggVG\"+y`a")
vim.keymap.set("n", "<leader>e", "gg\"_dGi")

-- format
local function format_or_select_buffer()
    local clients = vim.lsp.buf_get_clients()
    if next(clients) ~= nil then
        vim.lsp.buf.format({ async = true })
    else
        local save_cursor = vim.fn.getpos(".")
        vim.cmd("normal! ggVG=")
        vim.fn.setpos(".", save_cursor)
    end
end
vim.keymap.set('n', '<leader>f', format_or_select_buffer)

vim.keymap.set("n", "vm", "va{V")

vim.keymap.set('n', '<leader>n', ':let new_name=input("New filename: ") | silent execute "!mv % %:h/" . new_name | execute "e %:h/" . new_name<CR>')

-- comments
vim.keymap.set("n", "<C-/>", ":normal Vgcc<CR>");
vim.keymap.set("v", "<C-/>", ":normal Vgcc<CR>");

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set('v', '<leader>/', 'y/\\V<C-R>=escape(@",\'/\\\')<CR><CR>')
vim.keymap.set('n', '<leader>/', 'yiw/<C-R>=escape(@",\'/\\\')<CR><CR>')

-- replace all
vim.keymap.set('n', '<leader>r', function()
    local find = vim.fn.input('Replace: ')
    if vim.fn.search(find, 'nw') == 0 then
        print('String not found: ' .. find)
        return
    end
    local replace = vim.fn.input('Replace: ' .. find .. ' with: ')
    vim.cmd('%s/' .. vim.fn.escape(find, '/') .. '/' .. vim.fn.escape(replace, '/') .. '/g')
end)

-- set executable file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")

-- copilot
vim.keymap.set("n", "<C-S-c>", ":ToggleCopilot<CR>")

-- write
vim.keymap.set("n", "<C-s>", ":w<CR>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- nvim-tree
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")

-- split a terminal
vim.keymap.set("n", "<leader>j", ":split<CR>:term<CR>A")

-- move windows
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
