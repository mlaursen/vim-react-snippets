local util = require("vim-react-snippets.util")

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

return util.extend_language("typescript", {
  s({
    trig = "fce",
    namr = "Function Component Export",
    dscr = "React function component exported with prop interface based on the current file name",
  }, {
    t({ 'import { type ReactElement, type ReactNode } from "react"' }),
    t({ "", "", "export interface " }),
    i(1, "Hello"),
    t("Props {"),
    t({ "", "\tchildren: ReactNode", "\t" }),
    -- t({ "Props {" }, { "" }, "\tchildren: ReactNode;", "\t"),
    i(3),
    t({ "", "}", "", "" }),
    t({ "export function " }),
    i(2, "Hello"),
    t({ "(): ReactElement {" }),
    t({ "", "\treturn <></>" }),
    t({ "", "}", "" }),
  }),
})
