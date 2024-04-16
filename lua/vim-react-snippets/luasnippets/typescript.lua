local util = require("vim-react-snippets.util")

local common = require("vim-react-snippets.common")
local exports = require("vim-react-snippets.exports")
local imports = require("vim-react-snippets.imports")
local logging = require("vim-react-snippets.logging")
local react_hooks = require("vim-react-snippets.react-hooks")
local redux = require("vim-react-snippets.redux")
local test_queries = require("vim-react-snippets.test-queries")
local testing = require("vim-react-snippets.testing")

local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return util.merge_lists(
  imports(),
  exports(),
  logging(),
  common(true),
  react_hooks(true),
  redux(true),
  testing(),
  test_queries(),
  {
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
  }
)
