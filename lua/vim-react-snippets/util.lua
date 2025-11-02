local M = {}

M.extension_name = "vim-react-snippets"

--- @param extension_name? string
M.get_snippet_path = function(extension_name)
  extension_name = extension_name or M.extension_name
  local snippets = vim.api.nvim_get_runtime_file("lua/" .. extension_name .. "/init.lua", false)[1]
  if snippets == nil or snippets == "" then
    error("Unable to find " .. extension_name .. " path")
  end

  return (snippets:gsub("init.lua", "luasnippets"))
end

--- @param extension_name? string
M.load = function(extension_name)
  require("luasnip.loaders.from_lua").load({
    paths = { M.get_snippet_path(extension_name) },
  })
end

--- @generic T
--- @param ... T[]
--- @return T[]
M.merge_lists = function(...)
  local merged = {}
  for _, arg in ipairs({ ... }) do
    for _, v in ipairs(arg) do
      table.insert(merged, v)
    end
  end
  return merged
end

--- @generic T
--- @param language string
--- @param snippets T[]
--- @return T[]
M.extend_language = function(language, snippets)
  local combined_snippets = require(M.extension_name .. ".luasnippets." .. language)
  return M.merge_lists(combined_snippets, snippets)
end

--- @param start number
--- @return unknown
M.current_filename = function(start)
  local ls = require("luasnip")
  return ls.dynamic_node(start, function()
    return ls.snippet_node(nil, { ls.insert_node(1, vim.fn.expand("%:t:r")) })
  end)
end

--- @param start number
--- @return unknown
M.current_folder = function(start)
  local ls = require("luasnip")
  return ls.dynamic_node(start, function()
    return ls.snippet_node(nil, { ls.insert_node(1, vim.fn.expand("%:p:h:t")) })
  end)
end

--- @param s string
--- @return string
M.upper_first = function(s)
  return (s:gsub("^%l", string.upper))
end

--- @param s string
--- @return string
M.lower_first = function(s)
  return (s:gsub("^%l", string.lower))
end

--- @param s string
--- @return string
M.camel_case = function(s)
  return M.lower_first(s) .. s:sub(1):gsub("_(.)", string.upper)
end

--- @param s string
--- @return string
M.kebab_case = function(s)
  return s
end

--- @param i number
--- @return unknown
M.mirror_node = function(i)
  local ls = require("luasnip")
  return ls.function_node(function(args)
    return args[1][1]
  end, { i })
end

--- @param index number The insert index
--- @param reference_index number[] A list containing a single insert node index to mirror as the default value
M.editable_mirror_node = function(index, reference_index)
  local ls = require("luasnip")

  return ls.dynamic_node(index, function(args)
    return ls.snippet_node(nil, { ls.insert_node(1, args[1]) })
  end, reference_index)
end

--- @param i number
--- @param typescript boolean
M.typescript_tabstop = function(i, typescript)
  if not typescript then
    return {}
  end

  local ls = require("luasnip")

  return {
    ls.insert_node(i),
  }
end

--- @param i number
--- @param typescript boolean
M.typescript_mirror_node = function(i, typescript)
  if not typescript then
    return {}
  end

  return {
    M.mirror_node(i),
  }
end

--- @private
--- @class vim-react-snippets.LuaSnipConfig
--- @field trig string
--- @field name? string
--- @field desc? string

--- @private
--- @class vim-react-snippets.ConstSnippetOptions
--- @field config LuaSnipConfig
--- @field const_name string
--- @field const_edit? number
--- @field create_snippet fun(start: number): unknown[]

--- @param opts vim-react-snippets.ConstSnippetOptions
--- @return unknown[]
M.const_snippet = function(opts)
  local const_name = opts.const_name
  local const_edit = opts.const_edit or 0
  local config = opts.config
  local create_snippet = opts.create_snippet

  local ls = require("luasnip")
  local conds = require("luasnip.extras.expand_conditions")
  local s = ls.snippet
  local t = ls.text_node
  local i = ls.insert_node

  local start = const_edit + 1
  local const_statement = {
    t("const "),
    t(" = "),
  }
  if const_edit > 0 then
    table.insert(const_statement, 2, i(const_edit, const_name))
  else
    table.insert(const_statement, 2, t(const_name))
  end

  return {
    s(config, M.merge_lists(const_statement, create_snippet(start)), { condition = conds.line_begin }),
    s(config, create_snippet(1)),
  }
end

return M
