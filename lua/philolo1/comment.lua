local comment = require('Comment');

local api = require('Comment.api')

vim.keymap.set('n', '<leader>c', api.toggle.linewise.current)

-- Toggle selection (blockwise)
local esc = vim.api.nvim_replace_termcodes( '<ESC>', true, false, true)
vim.keymap.set('x', '<leader>c', function()
	vim.api.nvim_feedkeys(esc, 'nx', false)
	api.toggle.linewise(vim.fn.visualmode())
end)




