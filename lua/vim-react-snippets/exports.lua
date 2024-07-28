local util = require("vim-react-snippets.util")
local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local exports = function()
  return {
    s({
      trig = "exp",
      name = "Export Default",
    }, {
      t('export { default } from "./'),
      util.current_filename(1),
      t('"'),
    }),
    s({
      trig = "exf",
      name = "Export File",
    }, {
      t("export "),
      i(1),
      t(' from "'),
      i(2, "./"),
      util.mirror_node(1),
      t('"'),
    }),
    s({
      trig = "expd",
      name = "Export Destructured",
    }, {
      t("export { "),
      i(1),
      t(' } from "'),
      i(2),
      t('"'),
    }),
    s({
      trig = "expa",
      name = "Export All",
    }, {
      t('export * from "'),
      i(1),
      t('"'),
    }),
  }
end

return exports
