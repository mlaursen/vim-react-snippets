local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
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

    s({
      trig = "@s",
      name = "@since major.minor.patch",
    }, {
      t("@since "),
      i(1, "1"),
      t("."),
      i(2, "0"),
      t("."),
      i(3, "0"),
    }),
  }
end

return jsdoc
