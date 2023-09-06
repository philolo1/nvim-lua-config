local mark = require("harpoon.mark")
local ui = require("harpoon.ui")


vim.keymap.set("n", "<leader>x", function()
    mark.clear_all(); mark.add_file();
end, {});
vim.keymap.set("n", "<C-e>", function() ui.toggle_quick_menu() end);
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end);
