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
      trig = "te",
      name = "Typeparam Extends",
      desc = "<T extends >",
    }, {
      t("<"),
      i(1, "T"),
      d(2, function()
        return sn(nil, { i(1, "extends "), i(2) })
      end),
      i(3),
      t(">"),
    }),
    s({
      trig = "tee",
      name = "Typeparam Extends htmlElement",
      desc = "<E extends HTMLElement = HTMLElement>",
    }, {
      t("<"),
      i(1, "E"),
      t(" extends HTMLElement = "),
      i(2, "HTMLElement"),
      t(">"),
    }),

    s({
      trig = "ro",
      name = "Readonly<T>",
    }, {
      t("Readonly<"),
      i(1, "T"),
      t(">"),
    }),
  }
end

return typescript
