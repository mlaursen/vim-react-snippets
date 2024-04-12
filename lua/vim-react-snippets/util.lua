local M = {}

M.extension_name = "vim-react-snippets"
M.get_snippet_path = function()
  local snippets = vim.api.nvim_get_runtime_file("lua/" .. M.extension_name .. "/init.lua", false)[1]
  if snippets == nil or snippets == "" then
    error("Unable to find " .. M.extension_name .. " path")
  end

  return (snippets:gsub("init.lua", "luasnippets"))
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

return M
