local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local nmap = require("philolo1.helper").nmap;


nmap("<leader>m", function()
    mark.clear_all(); mark.add_file();
end, {}, "harpoon mark file");
-- nmap("<C-e>", function() ui.toggle_quick_menu() end, {}, "harpoon open menu");
nmap("<C-e>", function() ui.nav_file(1) end, {}, "harpoon open file 1");
nmap("<leader>e", function() ui.nav_file(1) end, {}, "harpoon open file 1");
