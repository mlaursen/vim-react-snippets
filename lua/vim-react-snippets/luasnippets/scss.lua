local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({
    trig = "use",
    name = "Use File or Package",
  }, {
    t('@use "'),
    i(1),
    t('";'),
  }),
  s({
    trig = "use*",
    name = "Use File or Package as *",
  }, {
    t('@use "'),
    i(1),
    t('" as *;'),
  }),
  s({
    trig = "for",
    name = "Forward",
  }, {
    t('@forward "'),
    i(1),
    t({ '" with (', "\t" }),
    i(2),
    t({ "", ");" }),
  }),

  s({
    trig = "fun",
    name = "@function",
  }, {
    t("@function "),
    i(1, "name"),
    t("("),
    i(2),
    t({ ") {", "\t" }),
    i(0),
    t({ "", "\t@return " }),
    i(3, "null"),
    t({ ";" }),
    t({ "", "}" }),
  }),

  s({
    trig = "mix",
    name = "@mixin",
  }, {
    t("@mixin "),
    i(1, "name"),
    t("("),
    i(2),
    t({ ") {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- not used often
  s({
    trig = "pcs",
    name = "Prefers Color Scheme",
  }, {
    t("@media (prefers-color-scheme: "),
    i(1, "dark"),
    t({ ") {", "\t" }),
    i(2),
    t({ "", "}" }),
  }),
}
