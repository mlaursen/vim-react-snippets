local util = require("vim-react-snippets.util")

local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node

local imports = function()
  return {
    s({
      trig = "imp",
      name = "Import Package",
      desc = "import anything from package",
    }, {
      t("import "),
      i(1),
      t(' from "'),
      util.editable_mirror_node(2, { 1 }),
      t('"'),
    }),
    s({
      trig = "impa",
      name = "Import All",
      desc = "import * as something from package",
    }, {
      t("import * as "),
      i(1),
      t(' from "'),
      util.editable_mirror_node(2, { 1 }),
      t('"'),
    }),
    s({
      trig = "impf",
      name = "Import File",
    }, {
      t("import "),
      i(1),
      t(' from "'),
      d(2, function(args)
        return sn(nil, { i(1, "./"), i(2, args[1]) })
      end, { 1 }),
      t('"'),
    }),
    s({
      trig = "impd",
      name = "Import Destructured",
      desc = "import { destructured } from package",
    }, {
      t("import { "),
      i(1),
      t(' } from "'),
      i(2),
      t('"'),
    }),
    s({
      trig = "impp",
      name = 'import "package-name"',
      desc = "Import a package that only has side effects",
    }, {
      t('import "'),
      i(1, ""),
      t('"'),
    }),
    s({
      trig = "icn",
      name = "Import Classnames",
      desc = "import classnames as cn",
    }, {
      t('import cn from "classnames"'),
    }),
    s({
      trig = "icnb",
      name = "Import cnbuilder",
      desc = "import cnbuilder as cnb",
    }, {
      t('import { cnb } from "cnbuilder"'),
    }),
    s({
      trig = "ism",
      name = "Import SCSS Module",
      desc = "import scss module",
    }, {
      t("import "),
      i(2, "styles"),
      t(' from "./'),
      util.current_filename(1),
      t('.module.scss"'),
    }),
  }
end

return imports
