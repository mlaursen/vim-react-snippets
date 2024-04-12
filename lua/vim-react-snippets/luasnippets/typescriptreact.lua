local util = require("vim-react-snippets.util")
local react_components = require("vim-react-snippets.react-components")
local react_testing = require("vim-react-snippets.react-testing")

return util.extend_language("typescript", util.merge_lists(react_components(true), react_testing(true)))
