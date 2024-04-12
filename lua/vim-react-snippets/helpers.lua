local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node

--- @param typescript boolean
local helpers = function(typescript)
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
  }
end

return helpers
