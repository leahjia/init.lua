local lsp = require('lsp-zero')

-- v3

-- diagnostics
lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
})

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  float = {
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})


require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'rust_analyzer',
        'lua_ls'
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end
    }
})


-- language servers
lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)


local cmp = require('cmp')

local cmp_action = require('lsp-zero').cmp_action()

local cmp_format = require('lsp-zero').cmp_format()

cmp.setup({
  -- completion
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  },
  mapping = cmp.mapping.preset.insert({
    -- confirm completion item
    ['<Tab>'] = cmp.mapping.confirm({select = true}),

    -- toggle completion menu
    ['<C-e>'] = cmp_action.toggle_completion(),
  }),
  -- border to documentation window
  window = {
    documentation = cmp.config.window.bordered(),
  },
  -- label that shows the source of the completion item
  cmp.setup({
      formatting = cmp_format,
  })
})





-- v1
-- for leptos
-- require('lspconfig').rust_analyzer.setup {
    -- settings = {
        -- ["rust-analyzer"] = {
            -- procMacro = {
                -- ignored = {
                    -- leptos_macro = {
                        -- "server",
                    -- },
                -- },
            -- },
        -- },
    -- }
-- }

