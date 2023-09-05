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
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
end)


-- -- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
