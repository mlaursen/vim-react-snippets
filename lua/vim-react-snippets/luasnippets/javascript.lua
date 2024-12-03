local util = require("vim-react-snippets.util")

local common = require("vim-react-snippets.common")
local exports = require("vim-react-snippets.exports")
local imports = require("vim-react-snippets.imports")
local jsdoc = require("vim-react-snippets.jsdoc")
local logging = require("vim-react-snippets.logging")
local react_prop_types = require("vim-react-snippets.react-prop-types")
local react_hooks = require("vim-react-snippets.react-hooks")
local react_components = require("vim-react-snippets.react-components")
local react_testing = require("vim-react-snippets.react-testing")
local redux = require("vim-react-snippets.redux")
local test_queries = require("vim-react-snippets.test-queries")
local testing = require("vim-react-snippets.testing")

return util.merge_lists(
  imports(),
  exports(),
  logging(),
  common(false),
  jsdoc(false),
  react_hooks(false),
  redux(false),
  testing(),
  test_queries(),
  react_components(false),
  react_testing(false),
  react_prop_types(false)
)
