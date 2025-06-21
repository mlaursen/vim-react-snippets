local util = require("vim-react-snippets.util")

local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node

local typescript = function()
  return {
    s({
      trig = "intf",
      name = "Interface",
    }, {
      t("export interface "),
      util.current_filename(1),
      i(2),
      t({ " {", "\t" }),
      i(3),
      t({ "", "}" }),
    }),
    s({
      trig = "<T",
      name = "T typeparam",
      desc = "<T extends >",
    }, {
      t("<T "),
      d(1, function()
        return sn(nil, { i(1, "extends "), i(2) })
      end),
      i(1),
      t(">"),
    }),
    s({
      trig = "<E",
      name = "E typeparam",
      desc = "<E extends HTMLElement = HTMLElement>",
    }, {
      t("<E extends HTMLElement = "),
      i(1, "HTMLElement"),
      t(">"),
    }),
  }
end

return typescript
