local util = require("vim-react-snippets.util")

local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

--- @param typescript boolean
--- @return unknown[]
local react_testing = function(typescript)
  return {
    s({
      trig = "rtf",
      name = "React Test File",
      desc = "Base setup for a test in react with react-testing-library or a custom renderer",
    }, {
      t('import { render, screen } from "'),
      i(1, "@testing-library/react"),
      t({ '"', "" }),
      t("import "),
      util.current_filename(2),
      t(' from "../'),
      util.mirror_node(2),
      t({ '"', "", "" }),

      t('describe("'),
      util.mirror_node(2),
      t({ '", () => {', '\tit("should ' }),
      i(3),
      t({ '", () => {', "\t\t" }),
      i(4),
      t({ "", "\t})", "})" }),
    }),
  }
end

return react_testing
