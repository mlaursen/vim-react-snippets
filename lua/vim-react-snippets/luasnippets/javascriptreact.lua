local util = require("vim-react-snippets.util")
local react_components = require("vim-react-snippets.react-components")
local react_testing = require("vim-react-snippets.react-testing")

return util.extend_language("javascript", util.merge_lists(react_components(false), react_testing(false)))
