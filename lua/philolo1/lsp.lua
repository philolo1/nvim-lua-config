local lsp = require('lsp-zero').preset("recommended")

print("LSP");

lsp.setup_servers({
	'tsserver',
	'eslint',
	'lua_ls',
	'rust_analyzer'
})

-- lsp.nvim_workspace()
--
-- local cmp = require('cmp')
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--   ["<C-Space>"] = cmp.mapping.complete(),
-- })
--
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil
--
-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings
-- })
--
-- lsp.set_preferences({
--     suggest_lsp_servers = false,
--     sign_icons = {
--         error = 'E',
--         warn = 'W',
--         hint = 'H',
--         info = 'I'
--     }
-- })
--
--
--
-- end)
--
--
--


lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
--   local opts = {buffer = bufnr, remap = false}
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
  vim.keymap.set("n", "<leader>d", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)

  -- TODO
  --   vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  --   vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  --   vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  --   vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  --   vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  --   vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  --   vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


-- -- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
