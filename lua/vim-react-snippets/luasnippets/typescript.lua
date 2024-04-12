local ls = require("luasnip")
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local ms = ls.multi_snippet

local date = function()
  return { os.date("%Y-%m-%d") }
end

-- local snippets = {
--   s({
--     trig = "date",
--     namr = "Date",
--     dscr = "Date in the form of YYYY-MM-DD",
--   }, {
--     f(date, {}),
--   }),
-- }

return {
  s({
    trig = "impp",
    namr = 'import "package-name"',
    dscr = "Import a package that only has side effects",
  }, {
    t('import "'),
    i(1, ""),
    t('"'),
  }),

  s({
    trig = "date",
    namr = "Date",
    dscr = "Date in the form of YYYY-MM-DD",
  }, {
    t("Date: "),
    f(date, {}),
  }),

  s({
    trig = "cl",
    namr = "console.log",
    dscr = "",
  }, {
    t("console.log("),
    t(")"),
  }),

  -- s({
  --   trig = "",
  --   namr = "",
  --   dscr = "",
  -- }, {
  --   t(""),
  -- }),
}
