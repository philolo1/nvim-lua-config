local ts_utils = require('nvim-treesitter.ts_utils')

local nmap = require("philolo1.helper").nmap;

-- select current node
local SelectNode = function()
    local node = ts_utils.get_node_at_cursor()
    if node == nil then
        error("No Treesitter parser found")
    end

    local root = ts_utils.get_root_for_node(node);
    local start_row = node:start();
    local parent = node:parent();

    while (parent ~= nil and parent ~= root and parent:start() == start_row) do
        node = parent
        parent = node:parent()
    end

    return node
end

Select = function()
    local node = SelectNode()
    local bufNr = vim.api.nvim_get_current_buf();
    print(vim.inspect(node))
    ts_utils.update_selection(bufNr, node)
end

nmap("<leader>z", function()
    Select()
end, {}, "Select treesitter node");
