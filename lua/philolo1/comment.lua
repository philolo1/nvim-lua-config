local comment = require('Comment');

local nmap = require("philolo1.helper").nmap;
local api = require('Comment.api')

nmap('<leader>c', api.toggle.linewise.current, {}, "comment code out")

-- Toggle selection (blockwise)
local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
vim.keymap.set('x', '<leader>c', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.linewise(vim.fn.visualmode())
end)
