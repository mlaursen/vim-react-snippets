local util = require("vim-react-snippets.util")

local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

--- @private
--- @alias vim-react-snippets.ConsoleType 'log' | 'error' | 'warn' | 'debug' | 'table'

--- @param type vim-react-snippets.ConsoleType
--- @param mirror boolean
local console = function(type, mirror)
  local trig = "c" .. type:sub(1, 1) .. (mirror and "v" or "")
  local body = (not mirror and { i(1) }) or {
    t('"'),
    util.mirror_node(1),
    t(':", '),
    i(1),
  }
  return s(
    { trig = trig },
    util.merge_lists(
      {
        t("console." .. type .. "("),
      },
      body,
      {
        t(")"),
      }
    )
  )
end

local logging = function()
  --- @type vim-react-snippets.ConsoleType[]
  local types = { "log", "error", "warn", "debug", "table" }
  local false_true = { false, true }

  local snippets = {}
  for _, mirror in pairs(false_true) do
    for _, type in pairs(types) do
      if type ~= "table" or not mirror then
        table.insert(snippets, console(type, mirror))
      end
    end
  end

  return snippets
end

return logging
