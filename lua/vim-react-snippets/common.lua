local ls = require("luasnip")

local s = ls.snippet
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
      trig = "cd",
      name = "Const Destructure",
    }, {
      t("const { "),
      i(2),
      t(" } = "),
      i(1, "props"),
    }),
  }
end

return common
