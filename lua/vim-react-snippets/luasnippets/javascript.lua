local util = require("vim-react-snippets.util")

local helpers = require("vim-react-snippets.helpers")
local imports = require("vim-react-snippets.imports")
local logging = require("vim-react-snippets.logging")
local react_hooks = require("vim-react-snippets.react-hooks")
local redux = require("vim-react-snippets.redux")
local test_queries = require("vim-react-snippets.test-queries")
local testing = require("vim-react-snippets.testing")

return util.merge_lists(
  imports(),
  logging(),
  helpers(false),
  react_hooks(false),
  redux(false),
  testing(),
  test_queries()
)
