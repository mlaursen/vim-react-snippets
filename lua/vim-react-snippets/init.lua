--- @return string
local get_snippet_path = function()
  local snippets = vim.api.nvim_get_runtime_file("lua/vim-react-snippets/init.lua", false)[1]
  if snippets == nil or snippets == "" then
    error("Unable to find vim-react-snippets path")
  end

  local paths = snippets:gsub("init.lua", "luasnippets")
  return paths
end

return {
  load = function()
    require("luasnip.loaders.from_lua").load({
      paths = { get_snippet_path() },
    })
  end,
  lazy_load = function()
    require("luasnip.loaders.from_lua").lazy_load({
      paths = { get_snippet_path() },
    })
  end,
}
