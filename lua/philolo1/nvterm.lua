local tmap = require("philolo1.helper").tmap;

require("nvterm").setup({
    terminals = {
        shell = vim.o.shell,
        list = {},
        type_opts = {
            float = {
                relative = 'editor',
                row = 0.5,
                col = 0.5,
                width = 0.5,
                height = 0.4,
                border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = .5, },
            vertical = { location = "rightbelow", split_ratio = .5 },
        }
    },
    behavior = {
        autoclose_on_quit = {
            enabled = false,
            confirm = true,
        },
        close_on_exit = true,
        auto_insert = true,
    },
})

local terminal = require("nvterm.terminal")

-- local ft_cmds = {
--     python = "python3 " .. vim.fn.expand('%'),
-- }
local toggle_modes = { 'n', 't' }
local mappings = {
    -- { 'n',          '<C-l>', function() terminal.send(ft_cmds[vim.bo.filetype]) end },
    { toggle_modes, '<C-h>', function() terminal.toggle('horizontal') end },
    -- { toggle_modes, '<C-v>', function() terminal.toggle('vertical') end },
    { toggle_modes, '<C-f>', function() terminal.toggle('float') end },
}
local opts = { noremap = true, silent = true }
for _, mapping in ipairs(mappings) do
    vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end

tmap('<ESC>', "<C-\\><C-N>", { noremap = true }, "enter normal mode in terminal");
