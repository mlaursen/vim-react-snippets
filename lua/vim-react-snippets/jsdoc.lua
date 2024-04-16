local ls = require("luasnip")
local conds = require("luasnip.extras.expand_conditions")

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node

--- @param typescript boolean
--- @return unknown[]
local jsdoc = function(typescript)
  return {
    s({
      trig = "/**",
      name = "JSDoc Comment",
    }, {
      sn(1, {
        t({ "/**", " * " }),
        i(1),
        t({ "", " */" }),
      }),
    }),

    s({
      trig = "@e",
      name = "@example",
    }, {
      t("@example "),
      i(1, "Example Name"),
      t({ "", "" }),
      t("* ```"),
      i(2, "tsx"),
      t({ "", "* " }),
      i(3),
      t({ "", "* ```" }),
    }),

    s({
      trig = "@d",
      name = "@default" .. (typescript and "Value" or ""),
    }, {
      t("@default" .. (typescript and "Value" or "") .. " `"),
      i(1),
      t("`"),
    }),
  }
end

return jsdoc
