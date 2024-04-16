local ls = require("luasnip")
local conds = require("luasnip.extras.expand_conditions")

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node

--- @param typescript boolean
local common = function(typescript)
  return {
    s({
      trig = "dev",
      name = "Development",
      desc = 'process.env.NODE_ENV !== "production"',
    }, {
      t('process.env.NODE_ENV !== "production"'),
    }),
    s({
      trig = "prod",
      name = "Production",
      desc = 'process.env.NODE_ENV === "production"',
    }, {
      t('process.env.NODE_ENV === "production"'),
    }),

    s({
      trig = "noop",
    }, {
      t("const noop = ()" .. (typescript and ": void" or "")),
      t({ " => {", "\t// do nothing", "}" }),
    }),

    s({
      trig = "dc",
      name = "Destructured Const",
    }, {
      t("const { "),
      i(2),
      t(" } = "),
      i(1, "props"),
    }),

    s({
      trig = "edc",
      name = "Export Destructured Const",
    }, {
      t("export const { "),
      i(2),
      t(" } = "),
      i(1, "props"),
    }),

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
  }
end

return common
