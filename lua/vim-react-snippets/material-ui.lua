local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

--- @private
--- @param typescript boolean
local material_ui = function(typescript)
  return {
    s({
      trig = "sx",
      name = "sx function",
      desc = "sx={(theme) => ({})}",
    }, {
      t({ "sx={(theme) => ({", "\t" }),
      i(1),
      t({ "", "})}" }),
    }),
  }
end

return material_ui
