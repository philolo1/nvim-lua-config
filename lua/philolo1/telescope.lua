local builtin = require('telescope.builtin')


local nmap = require("philolo1.helper").nmap;



require('telescope').setup {
    extensions = {
        workspaces = {
            -- keep insert mode after selection in the picker, default is false
            keep_insert = true,
        },
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}

function FilterLua()
    builtin.find_files({
        default_text = ".lua$ ",
    })
end

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('workspaces')

nmap('<C-k>', builtin.find_files, {}, "telescope find files")
nmap('<leader>k', builtin.find_files, {}, "telescope find files")

-- nmap('<C-p>', builtin.git_files, {})

-- nmap('<C-l>', FilterLua, {}, "telescope search lua files")
-- nmap('<leader>l', FilterLua, {}, "telescope search lua files")

nmap('<C-s>', builtin.live_grep, {}, "telescope search content")
nmap('<leader>s', builtin.live_grep, {}, "telescope search content")


nmap('<C-b>', builtin.buffers, {}, "telescope buffer search")
nmap('<leader>b', builtin.buffers, {}, "telescope buffer search")

nmap('<leader>w', ":Telescope workspaces<CR>", {}, "telescope workspace search")
