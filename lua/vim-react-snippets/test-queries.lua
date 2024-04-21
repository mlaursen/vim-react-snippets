local util = require("vim-react-snippets.util")

local ls = require("luasnip")
local conds = require("luasnip.extras.expand_conditions")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

--- @private
--- @class vim-react-snippets.ByTypeOptions
--- @field type "role" | "role unnamed" | "testid" | "text"
--- @field find boolean
--- @field inline boolean
--- @field screen boolean

--- @param opts vim-react-snippets.ByTypeOptions
local by_type = function(opts)
  local type = opts["type"]
  local find = opts["find"]
  local inline = opts["inline"]
  local screen = opts["screen"]

  local is_role = type == "role"
  local is_role_unnamed = type == "role unnamed"
  local role = (is_role_unnamed and "progressbar") or (is_role and "button") or ""
  local get_or_find = find and "find" or "get"
  local maybe_screen = screen and "screen." or ""
  local maybe_await = find and "await " or ""
  local by_type = (type == "testid" and "TestId") or (type == "text" and "Text") or "Role"
  local query = maybe_await .. maybe_screen .. get_or_find .. "By" .. by_type

  local start = 1
  local prefix = {}
  local trailing = {}
  if not inline then
    start = start + 1
    table.insert(prefix, t("const "))
    table.insert(prefix, i(1))
    table.insert(prefix, t(" = "))
  end
  if is_role then
    table.insert(trailing, t(', { name: "'))
    table.insert(trailing, i(start + 1))
    table.insert(trailing, t('" }'))
  end

  local char = type == "testid" and "i" or type:sub(1, 1)
  local trig = (screen and "s" or "") .. (find and "f" or "g") .. "b" .. char .. (is_role_unnamed and "u" or "")
  local name = (screen and "Screen " or "")
    .. (find and "Find" or "Get")
    .. " By "
    .. by_type
    .. (is_role_unnamed and " Unnamed" or "")
  local condition = not inline and conds.line_begin or nil

  return s(
    {
      trig = trig,
      name = name,
    },
    util.merge_lists(
      prefix,
      {
        t(query .. '("'),
        (not inline and type == "testid" and util.editable_mirror_node(start, { 1 })) or i(start, role),
        t('"'),
      },
      trailing,
      {
        t(")"),
      }
    ),
    { condition = condition }
  )
end

local test_queries = function()
  local types = { "role", "role unnamed", "testid", "text" }
  local false_true = { false, true }

  local snippets = {}
  for _, type in pairs(types) do
    for _, inline in pairs(false_true) do
      for _, screen in pairs(false_true) do
        for _, find in pairs(false_true) do
          table.insert(
            snippets,
            by_type({
              type = type,
              find = find,
              inline = inline,
              screen = screen,
            })
          )
        end
      end
    end
  end

  return snippets
end

return test_queries
