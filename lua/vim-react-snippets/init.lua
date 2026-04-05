local util = require("vim-react-snippets.util")
local config = require("vim-react-snippets.config")

local M = {}

--- @class vim-react-snippets.SetupOptions
--- @field readonly_props? boolean Set to `false` if all props should no longer be wrapped in `Readonly<T>`.
--- @field test_framework? string The test framework for the react test snippets. Can be set to `"vitest"`
--- @field test_renderer_path? string The import path for `import { render, screen, userEvent }`. If you use a custom test renderer, set it to this config option. i.e. `"@/test-utils.js"`
--- @field load? boolean Set to `false` to prevent loading the snippets with `require("luasnip.loaders.from_lua").load()`

--- @param opts vim-react-snippets.SetupOptions
M.setup = function(opts)
  opts = opts or {}

  if opts.readonly_props == true or opts.readonly_props == false then
    config.readonly_props = opts.readonly_props
  end

  if type(opts.test_framework) == "string" then
    config.test_framework = opts.test_framework
  end

  if type(opts.test_renderer_path) == "string" then
    config.test_renderer_path = opts.test_renderer_path
  end

  if opts.load ~= false then
    util.load()
  end
end

return M
