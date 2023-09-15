local H = {}

--- Adds a new mapping
--- Examples:
---@param mode string|table    Mode short-name, see |nvim_set_keymap()|.
---                            Can also be list of modes to create mapping on multiple modes.
---@param lhs string           Left-hand side |{lhs}| of the mapping.
---@param lhs string           Left-hand side |{lhs}| of the mapping.
---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts table|nil Table of |:map-arguments|.
---                      - Same as |vim.keymap.set| {opts}, except:
---                        - "desc" is a seperate parameter
---@param desc string|function Description of the mapping
local function map(mode, lhs, rhs, opts, desc)
    local new_opts = vim.deepcopy(opts) or {};
    new_opts.desc = desc;
    vim.keymap.set(mode, lhs, rhs, new_opts)
end


--- Adds a new normal mode mapping
--- Examples:
---@param lhs string           Left-hand side |{lhs}| of the mapping.
---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts table|nil Table of |:map-arguments|.
---                      - Same as |vim.keymap.set| {opts}, except:
---                        - "desc" is a seperate parameter
---@param desc string|function Description of the mapping
H.nmap = function(lhs, rhs, opts, desc)
    map('n', lhs, rhs, opts, desc);
end

--- Adds a new insert mode mapping
--- Examples:
---@param lhs string           Left-hand side |{lhs}| of the mapping.
---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts table|nil Table of |:map-arguments|.
---                      - Same as |vim.keymap.set| {opts}, except:
---                        - "desc" is a seperate parameter
---@param desc string|function Description of the mapping
H.imap = function(lhs, rhs, opts, desc)
    map('i', lhs, rhs, opts, desc);
end

--- Adds a new visual mode mapping
--- Examples:
---@param lhs string           Left-hand side |{lhs}| of the mapping.
---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts table|nil Table of |:map-arguments|.
---                      - Same as |vim.keymap.set| {opts}, except:
---                        - "desc" is a seperate parameter
---@param desc string|function Description of the mapping
H.vmap = function(lhs, rhs, opts, desc)
    map('v', lhs, rhs, opts, desc);
end

--- Adds a new visual mode mapping
--- Examples:
---@param lhs string           Left-hand side |{lhs}| of the mapping.
---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts table|nil Table of |:map-arguments|.
---                      - Same as |vim.keymap.set| {opts}, except:
---                        - "desc" is a seperate parameter
---@param desc string|function Description of the mapping
H.tmap = function(lhs, rhs, opts, desc)
    map('t', lhs, rhs, opts, desc);
end


return H;
