local util = require("vim-react-snippets.util")
local react_components = require("vim-react-snippets.react-components")
local react_testing = require("vim-react-snippets.react-testing")
local react_prop_types = require("vim-react-snippets.react-prop-types")
local material_ui = require("vim-react-snippets.material-ui")

return util.extend_language(
  "typescript",
  util.merge_lists(react_components(true), react_prop_types(true), react_testing(true), material_ui(true))
)
