-- config for lsp signature to be able to scroll
local function escape_term_codes(str)
    return vim.api.nvim_replace_termcodes(str, true, false, true)
end

local function is_float_open(window_id)
    return window_id and window_id ~= 0 and vim.api.nvim_win_is_valid(window_id)
end

local function scroll_float(mapping)
    local win_id = _G._LSP_SIG_CFG.winnr;

    if is_float_open(win_id) then
        vim.fn.win_execute(win_id, ':normal! ' .. mapping)
    end
end

local scroll_up_mapping = escape_term_codes('<c-u>')
local scroll_down_mapping = escape_term_codes('<c-d>')
vim.keymap.set('i', '<c-u>', function() scroll_float(scroll_up_mapping) end, {})
vim.keymap.set('i', '<c-d>', function() scroll_float(scroll_down_mapping) end, {})
