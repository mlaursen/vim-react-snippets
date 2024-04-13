local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({
    trig = "use",
    name = "Use File or Package",
  }, {
    t('use "'),
    i(1),
    t('"'),
  }),
  s({
    trig = "use*",
    name = "Use File or Package as *",
  }, {
    t('use "'),
    i(1),
    t('" as *'),
  }),
  s({
    trig = "forw",
    name = "Forward",
  }, {
    t('forward "'),
    i(1),
    t('" with ('),
    i(2),
    t(");"),
  }),
}