local util = require("vim-react-snippets.util")

return {
  load = function()
    require("luasnip.loaders.from_lua").load({
      paths = { util.get_snippet_path() },
    })
  end,
  lazy_load = function()
    require("luasnip.loaders.from_lua").lazy_load({
      paths = { util.get_snippet_path() },
    })
  end,
}