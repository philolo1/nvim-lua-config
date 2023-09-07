local builtin = require('telescope.builtin')

require('telescope').setup {
    extensions = {
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

vim.keymap.set('n', '<C-k>', builtin.find_files, {})

vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<C-l>', FilterLua, {})

vim.keymap.set('n', '<C-s>', function()
    --	builtin.grep_string({ search = vim.fn.input("Grep > ") });
    builtin.live_grep();
end)
