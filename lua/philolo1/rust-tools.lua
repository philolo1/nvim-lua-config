local rt = require("rust-tools")

local nmap = require("philolo1.helper").nmap;
rt.setup({
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            nmap("<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr }, "lsp hover action")
            -- Code action groups
            nmap("<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr }, "lsp code action")
        end,
    },
})
