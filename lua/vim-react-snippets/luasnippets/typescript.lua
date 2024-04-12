local util = require("vim-react-snippets.util")
local imports = require("vim-react-snippets.imports")
local logging = require("vim-react-snippets.logging")
local react_hooks = require("vim-react-snippets.react-hooks")
local test_queries = require("vim-react-snippets.test-queries")
local testing = require("vim-react-snippets.testing")
local helpers = require("vim-react-snippets.helpers")

local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return util.merge_lists(imports(), logging(), helpers(true), react_hooks(true), testing(), test_queries(), {
  -- NOTE: Not supporting the following snippets on purpose:
  -- rc, rcn - I don't use `require`
  -- impa - I don't do `import *`
  -- impn - renamed to impd
  -- exp, expf, expn, expd, expa - I don't use barrel files anymore

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
})
