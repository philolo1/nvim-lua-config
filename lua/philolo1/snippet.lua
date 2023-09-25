local imap = require("philolo1.helper").imap;
local nmap = require("philolo1.helper").nmap;
local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local parser = require("luasnip.util.parser");

-- snippet creater
local s = ls.s;

--
local fmt = require("luasnip.extras.fmt").fmt;

local i = ls.insert_node;

local rep = require("luasnip.extras").rep;

local date = function() return { os.date('%Y-%m-%d') } end

ls.config.set_config {
    history = true,
    updateevents = "TextChanged, TextChangedI",

    enable_autosnippets = true,
}


ls.add_snippets(nil, {
    all = {
        snip({
            trig = "date",
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD",
        }, {
            func(date, {}),
        }),
        parser.parse_snippet("expand", "--- this is what was expanded")
    },
    lua = {
        parser.parse_snippet("lf", "local $1 = function($2)\n $0 \nend"),
        s("req", fmt("local {} = require('{}')", {
            i(1, "default"),
            rep(1)
        })
        ),
    }
})

imap("<C-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, {}, "change choice in snippets")
