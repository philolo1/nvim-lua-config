vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.cmd("cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'")

-- Define the function to open init.lua file
function openInitLua()
  vim.cmd("e ~/.config/nvim/lua/philolo1/init.lua")
end

-- Map Ctrl-i to the openInitLua function in normal mode
vim.api.nvim_set_keymap('n', '<C-i>', '<cmd>lua openInitLua()<CR>', {noremap=true, silent=true})

-- Map ' to save
vim.api.nvim_set_keymap('n', "'", ":wa<CR>", {noremap = true})
